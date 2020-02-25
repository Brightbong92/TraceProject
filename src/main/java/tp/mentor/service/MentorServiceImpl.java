package tp.mentor.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tp.mentor.service.MentorPath;
import tp.vo.MentorProfileVo;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.domain.Mentor_List;
import tp.domain.Sms_Auth;
import tp.mentor.mapper.MentorMapper;

@Log4j
@Service
@AllArgsConstructor
public class MentorServiceImpl implements MentorService {

	private MentorMapper mentorMapper;
	
	@Override
	public void saveStore(String mem_email,String ml_name,String ml_phone,String ml_yourself,String mtrcg_no,MultipartFile f) {
		//log.info("#service saveStore() f:"+f);
		String ml_ofname = f.getOriginalFilename();
		int idx = ml_ofname.lastIndexOf(".");
		String ofheader = ml_ofname.substring(0, idx);
		String ext = ml_ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String ml_fname = sb.toString();
		
		long fsize = f.getSize();
		//log.info("ofname: " + ofname + ", fname: " + fname + ", fsize: " + fsize); 
		
		boolean flag= writeFile(f, ml_fname);
		if(flag) {
			log.info("성공");
		}else {
			log.info("실패");
		}
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("mem_email", mem_email);
		map.put("ml_name", ml_name);
		map.put("ml_phone", ml_phone);
		map.put("ml_yourself", ml_yourself);
		map.put("mtrcg_no", mtrcg_no);
		map.put("ml_ofname", ml_ofname);
		map.put("ml_fname", ml_fname);
		
		mentorMapper.mentor_apply(map);
	}
	@Override
	public boolean writeFile(MultipartFile f, String saveFileName) {
	    File rDir = new File(MentorPath.FILE_STORE);
	    if(!rDir.exists()) rDir.mkdirs();
	    
	    FileOutputStream fos = null;
		try {
			byte data[] = f.getBytes();
			fos = new FileOutputStream(MentorPath.FILE_STORE + saveFileName);
			fos.write(data);
			fos.flush();
			
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				fos.close();
			}catch(IOException ie) {}
		}
	}
	@Override
	public boolean checkApply(String mem_email) {
		String check = mentorMapper.checkApply(mem_email);
		if(check==null) return true; //신청 안 한 일반회원일때
		else if(check.equals("1")) return false;// 신청한 일반회원일때
		else return false;
	}
	@Override
	public void setCode(String ml_phone, int sms_uuid) {
		//log.info("#서비스 phone :" + ml_phone);
		HashMap<String, Object> code =  new HashMap<String, Object>();
		code.put("ml_phone",ml_phone);
		code.put("sms_uuid",sms_uuid);
		String check = mentorMapper.checkCode(ml_phone);
		log.info("체크 : " + check);
		if(check==null) {
			mentorMapper.setCode(code);
		}else {
			mentorMapper.updateCode(code);
		}
	}
	@Override
	public String getCode(String receiver) {
		String code = mentorMapper.getCode(receiver);
		return code;
	}
	@Override
	public void removeCode(String receiver) {
		mentorMapper.removeCode(receiver);
	}
	public MentorProfileVo selectMentorProfile(String mem_email) {
		MentorProfileVo mProfile = new MentorProfileVo();
		Mentor_List mentor_list_info = mentorMapper.selectMentor_List(mem_email);
		Member mentor_member_info = mentorMapper.selectMentorMemberInfo(mem_email);
		mProfile.setMentor_list_info(mentor_list_info);
		mProfile.setMentor_member_info(mentor_member_info);
		return mProfile;
	}

}
