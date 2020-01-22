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
		if(sort.equals("99")) {//전체 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringList(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else if(sort.equals("0")) {// 운동 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListExercise(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else if(sort.equals("1")) {// 음악 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListMusic(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else if(sort.equals("2")) {//공예 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListCraft(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else if(sort.equals("3")) {// 요리 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListCooking(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else if(sort.equals("4")) {// 사진&영상 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListMedia(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else if(sort.equals("5")) {// 뷰티 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListBeauty(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else if(sort.equals("6")) {// 음료 정렬시
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringListBeverage(mentoringPagingVo);
			return new MentoringListResult(cp, totalCount, ps, list, sort);
		}else {// 99전체 정렬시.. 예비책
			int totalCount = mentoringMapper.selectMentoringCount();
			MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, cp, ps);
			List<Mentoring> list = mentoringMapper.selectMentoringList(mentoringPagingVo);
			String category_no = "99";
			return new MentoringListResult(cp, totalCount, ps, list, category_no);
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