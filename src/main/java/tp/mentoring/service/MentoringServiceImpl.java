package tp.mentoring.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;
import tp.domain.Mentoring_QA;
import tp.mentoring.mapper.MentoringMapper;
import tp.vo.MentoringListResult;
import tp.vo.MentoringPagingVo;
import tp.vo.MentoringViewPageVo;

@Service
@AllArgsConstructor
@Log4j
public class MentoringServiceImpl implements MentoringService {
	
	private MentoringMapper mentoringMapper;
	@Override
	public MentoringListResult getMentoringListResult(int cp, int ps, String sort) {
		int totalCount = mentoringMapper.selectMentoringCount();
		MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
		switch(sort) {
		case "0": {List<Mentoring> list = mentoringMapper.selectMentoringListExercise(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//운동
		case "1": {List<Mentoring> list = mentoringMapper.selectMentoringListMusic(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//음악
		case "2": {List<Mentoring> list = mentoringMapper.selectMentoringListCraft(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//공예
		case "3": {List<Mentoring> list = mentoringMapper.selectMentoringListCooking(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//요리
		case "4": {List<Mentoring> list = mentoringMapper.selectMentoringListMedia(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//사진&영상
		case "5": {List<Mentoring> list = mentoringMapper.selectMentoringListBeauty(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//뷰티
		case "6": {List<Mentoring> list = mentoringMapper.selectMentoringListBeverage(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//음료
		default: {List<Mentoring> list = mentoringMapper.selectMentoringList(mentoringPagingVo);
					return new MentoringListResult(cp, totalCount, ps, list, sort);}//전체
		}
		
	}
	@Override
	public MentoringListResult getMentoringListResultSearch(int cp, int ps, String word) {
			if(word.startsWith("샵")) {//해시검색일시
				word = word.substring(1);//.이후부터 시작
				//log.info("#word: " + word);
				int totalCount = mentoringMapper.selectMentoringHashSearchCount(word);
				MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(word, cp, ps);
				List<Mentoring> list = mentoringMapper.selectMentoringHashListSearch(mentoringPagingVo);
				return new MentoringListResult(cp, totalCount, ps, list, word);
			}
			else {//일반검색시
				int totalCount = mentoringMapper.selectMentoringSearchCount(word);
				MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(word, cp, ps);
				//log.info("#cp: " + cp + "#ps: " + ps);
				List<Mentoring> list = mentoringMapper.selectMentoringListSearch(mentoringPagingVo);
				return new MentoringListResult(cp, totalCount, ps, list, word);
			}
	}
	
	@Override
	@Transactional
	public void MentoringInsert(Mentoring m, String[] mtrdi_time) {
		long mtr_seq = mentoringMapper.selectMentoringNextSeq();//멘토링 시퀀스 넥스트
		Mentoring mentoring = new Mentoring(mtr_seq, m.getMtr_subject(), m.getMtr_content(), m.getMtr_price(), 
				m.getMtr_area(), m.getMtr_addr(), m.getMtr_jumsu(), m.getMtr_profile(), 
				m.getMtr_hashtag(), null ,m.getMtrcg_no(), m.getMem_email());
		mentoringMapper.insertMentoring(mentoring);//멘토링 테이블 인서트
		String cal = "";String stime = "";String etime = ""; String maxpcntStr="";
		for(int i = 0; i<=mtrdi_time.length-1; i++) {
			String str = mtrdi_time[i];
			str = str.trim();cal = str.substring(0, 10);stime = str.substring(11, 16);etime = str.substring(17,22);
			maxpcntStr = str.substring(23);
			int mtrdi_max_pcnt =  Integer.parseInt(maxpcntStr);
			String mtrdi_stime = cal+" "+stime;//타임스탬프 형식으로 인서트위해
			String mtrdi_etime = cal+" "+etime;//타임스탬프 형식으로
			long mtrdi_seq = mentoringMapper.selectMentoringDetailInfoNextSeq();//멘토링 디테일 시퀀스 네스트
			Mentoring_Detail_Info mentoring_detail_info = new Mentoring_Detail_Info(mtrdi_seq, mtrdi_stime, mtrdi_etime, mtrdi_max_pcnt, 0, mtr_seq);
			mentoringMapper.insertMentoringDetailInfo(mentoring_detail_info);//멘토링 디테일 인포 인서트
		}
	}
	
	@Override
	public String saveStore(MultipartFile f) {
		//log.info("#service saveStore() f: " + f);
		String ofname = f.getOriginalFilename();
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx); 
		String ext = ofname.substring(idx);
		
		long fsize = f.getSize();
		long ms = System.currentTimeMillis();	
		String fname = ofheader + "_" + ms + ext;
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String saveFileName = sb.toString();
		//log.info("ofname: " + ofname + ", ext: " + ext + ", fsize: " + fsize);
		//log.info("ofname: " + ofname + ", fname: " + fname);
		//log.info("ofname: " + ofname + ", fname: " + saveFileName);
		
		boolean flag = writeFile(f, saveFileName);
		if(flag) {
			log.info("파일출력성공");
		}else {
			log.info("파일출력실패");
		}
		
		return fname;
	}

	@Override
	public boolean writeFile(MultipartFile f, String saveFileName) {
		//log.info("#service writeFile() f: " + f + ", saveFileName: " + saveFileName);
		
		File rDir = new File(MentoringPath.FILE_STORE);
		if(!rDir.exists()) {
			rDir.mkdirs();
		}
		
		FileOutputStream fos = null;
		try {
			byte data[] = f.getBytes();
			fos = new FileOutputStream(MentoringPath.FILE_STORE + saveFileName);
			fos.write(data);
			fos.flush();
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {
			}
		}
	}
	@Override
	public MentoringViewPageVo selectMentoringDetailView(long mtr_seq) {
		MentoringViewPageVo mvpVo = mentoringMapper.selectMentoringViewPage(mtr_seq);
		List<Mentoring_Detail_Info> mtrdi_list = mentoringMapper.selectMentoringDetailInfo(mtr_seq);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mtrcg_no", mvpVo.getMtrcg_no());
		map.put("mtr_seq", mtr_seq);

		//List<Mentoring_QA> mtr_qa_list = mentoringMapper.selectMentoringQAList(mtr_seq);
		//mvpVo.setMtr_qa_list(mtr_qa_list);

		List<Mentoring> relative_mtr_list = mentoringMapper.selectRelativeMentoring(map);
		mvpVo.setDetail_Info_List(mtrdi_list);
		mvpVo.setRelative_mtr_list(relative_mtr_list);
		return mvpVo;
	}
	
	@Override
	public List<String> getSelectAutoSearchSubject(String word) {
		List<String> autoList = mentoringMapper.selectAutoSearchSubject(word);
		return autoList;
	}
	@Override
	public List<String> getSelectAutoSearchHashtag(String word) {
		List<String> autoList = mentoringMapper.selectAutoSearchHashtag(word);
		return autoList;
	}
}