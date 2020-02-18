package tp.mentoring.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import tp.domain.Mentor_List;
import tp.domain.Mentoring;
import tp.vo.MentorInfoVo;
import tp.vo.MentoringListResult;
import tp.vo.MentoringViewPageQaRvCountVo;
import tp.vo.MentoringViewPageVo;
public interface MentoringService {
	MentoringListResult getMentoringListResult(int cp, int ps, String sort);//리스트 & 정렬
	MentoringListResult getMentoringListResultSearch(int cp, int ps, String word);
	void MentoringInsert(Mentoring mentoring, String[] mtrdi_time);
	
	String saveStore(MultipartFile f);
	boolean writeFile(MultipartFile f, String saveFileName);
	
	//멘토링 상세뷰 가져오기
	MentoringViewPageVo selectMentoringDetailView(long mtr_seq);
	
	//자동검색
	//String[] getSelectAutoSearchSubject(String word);
	List<String> getSelectAutoSearchSubject(String word);
	List<String> getSelectAutoSearchHashtag(String word);
	
	MentorInfoVo getMentorInfo(long mtr_seq);
	
	MentoringViewPageQaRvCountVo getQaRvCount(long mtr_seq);
}
