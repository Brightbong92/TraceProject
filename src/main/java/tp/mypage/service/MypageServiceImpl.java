package tp.mypage.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Points;
import tp.mentor.service.MentorPath;
import tp.mypage.mapper.MypageMapper;
import tp.vo.ActivityListResult;
import tp.vo.ActivityVo;
import tp.vo.PointInfo;

@Service
@AllArgsConstructor
@Log4j
public class MypageServiceImpl implements MypageService {
	private MypageMapper mypageMapper;
	
	@Override
	public boolean checkPwd(String mem_email, String mem_pwd) {
		String check = mypageMapper.checkPwd(mem_email);
		if(BCrypt.checkpw(mem_pwd, check)) return true;
		else return false;
	}
	
	@Override
	public void updateState(String mem_email) {
		mypageMapper.updateState(mem_email);
	}
	
	@Override
	public void insertDisabled(Disabled disabled) {
		mypageMapper.insertDisabled(disabled);
	}
	
	@Override
	public PointInfo getPoint(String mem_email) {
		List<Points> pointInfo = mypageMapper.getPoint(mem_email);
		long mem_point = mypageMapper.getMem_point(mem_email);
		return new PointInfo(pointInfo, mem_point);
	}
	@Override
	public Member saveImg(String mem_email, MultipartFile f) {
		String ofname = f.getOriginalFilename();
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx);
		String ext = ofname.substring(idx);
		long ms = System.currentTimeMillis();
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String mem_profile = sb.toString();
		
		long fsize = f.getSize();
		//log.info("ofname: " + ofname + ", fname: " + fname + ", fsize: " + fsize); 
		
		boolean flag= writeFile(f, mem_profile);
		if(flag) {
			log.info("저장성공");
		}else {
			log.info("저장실패");
		}
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("mem_email", mem_email);
		map.put("mem_profile", mem_profile);
		
		mypageMapper.updateProfile(map);
		Member member = mypageMapper.selectMember(mem_email);
		return member;
	}
	@Override
	public boolean writeFile(MultipartFile f, String saveFileName) {
	    File rDir = new File(MypagePath.FILE_STORE);
	    if(!rDir.exists()) rDir.mkdirs();
	    
	    FileOutputStream fos = null;
		try {
			byte data[] = f.getBytes();
			fos = new FileOutputStream(MypagePath.FILE_STORE + saveFileName);
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
	public ActivityListResult getActivity(String mem_email) {
		List<ActivityVo> activityVo = mypageMapper.getActivity(mem_email);
		return new ActivityListResult(activityVo);
	}
}
