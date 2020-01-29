package tp.mentoring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;
import tp.vo.MentoringPagingVo;
import tp.vo.MentoringViewPageVo;

public interface MentoringMapper {
	List<Mentoring> selectMentoringList(MentoringPagingVo mentoringpaingVo);
	int selectMentoringCount();
	List<Mentoring> selectMentoringListExercise(MentoringPagingVo mentoringpaingVo);
	List<Mentoring> selectMentoringListMusic(MentoringPagingVo mentoringpaingVo);
	List<Mentoring> selectMentoringListCraft(MentoringPagingVo mentoringpaingVo);
	List<Mentoring> selectMentoringListCooking(MentoringPagingVo mentoringpaingVo);
	List<Mentoring> selectMentoringListMedia(MentoringPagingVo mentoringpaingVo);
	List<Mentoring> selectMentoringListBeauty(MentoringPagingVo mentoringpaingVo);
	List<Mentoring> selectMentoringListBeverage(MentoringPagingVo mentoringpaingVo);
	List<Mentoring> selectMentoringListSearch(MentoringPagingVo mentoringpaingVo);
	int selectMentoringSearchCount(String word);
	
	//멘토링 글작성 트랜잭션
	@Select(value = {"select MENTORING_SEQ.nextval from dual"})
	long selectMentoringNextSeq();
	
	@Insert(value = {"insert into MENTORING values (#{mtr_seq}, #{mtr_subject}, #{mtr_content}, #{mtr_price}, #{mtr_area}, #{mtr_addr}, #{mtr_jumsu}, #{mtr_profile}, #{mtr_hashtag}, #{mtrcg_no}, #{mem_email})"})
	void insertMentoring(Mentoring mentoring);
	
	@Select(value = {"select MENTORING_DETAIL_INFO_SEQ.nextval from dual"})
	long selectMentoringDetailInfoNextSeq();

	@Insert(value = {"insert into MENTORING_DETAIL_INFO values(#{mtrdi_seq}, #{mtrdi_stime}, #{mtrdi_etime}, #{mtrdi_max_pcnt}, #{mtrdi_now_pcnt}, #{mtr_seq})"})
	void insertMentoringDetailInfo(Mentoring_Detail_Info mentoring_detail_info);
	
	//멘토링 글 상세뷰가져오는 메소드
	MentoringViewPageVo selectMentoringViewPage(long mtr_seq);
	List<Mentoring_Detail_Info> selectMentoringDetailInfo(long mtr_seq);
	
	List<Mentoring> selectRelativeMentoring(long mtrcg_no);
	

}
