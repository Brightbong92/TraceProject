package tp.mentoring.mapper;

import java.util.List;

import tp.domain.Mentoring;
import tp.vo.MentoringPagingVo;

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
}
