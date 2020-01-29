package tp.mentoring.service;


import org.springframework.web.multipart.MultipartFile;

import tp.domain.Mentoring;
import tp.vo.MentoringListResult;
import tp.vo.MentoringViewPageVo;
public interface MentoringService {
	MentoringListResult getMentoringListResult(int cp, int ps, String sort);//리스트 & 정렬
	MentoringListResult getMentoringListResultSearch(int cp, int ps, String word);
	void MentoringInsert(Mentoring mentoring, String[] mtrdi_time);
	
	String saveStore(MultipartFile f);
	boolean writeFile(MultipartFile f, String saveFileName);
	
	//멘토링 상세뷰 가져오기
	MentoringViewPageVo selectMentoringDetailView(long mtr_seq);
	
}
