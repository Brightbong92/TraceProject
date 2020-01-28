package tp.mentoring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Mentoring;
import tp.mentoring.mapper.MentoringMapper;
import tp.vo.MentoringListResult;
import tp.vo.MentoringPagingVo;

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
			int totalCount = mentoringMapper.selectMentoringSearchCount(word);
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(word, cp, ps);
			log.info("#cp: " + cp + "#ps: " + ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListSearch(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, word);
	}

}