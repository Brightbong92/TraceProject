 package tp.index.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Review_File;
import tp.index.mapper.IndexMapper;
import tp.vo.BestMentorListResult;
import tp.vo.BestMentorVo;
import tp.vo.IndexListResult;
import tp.vo.ReviewFilesList;

@Service
@AllArgsConstructor
@Log4j
public class IndexServiceImpl implements IndexService {
	private IndexMapper indexMapper;
	
	@Override
	public IndexListResult indexListResult() {
		List<Mentoring> topMentoring = indexMapper.bestMentoringTop();
		List<Mentoring> latestArticle = indexMapper.latestArticle();
		Member bestMentoringMentor = indexMapper.bestMentoringMentor();
		List<ReviewFilesList> reviewFiles = indexMapper.reviewFiles();
		return new IndexListResult(bestMentoringMentor,topMentoring,latestArticle,reviewFiles);
	}

	@Override
	public BestMentorListResult getBestMentorListResult() {
		Member bestMentoringMentor = indexMapper.bestMentoringMentor();
		String mem_email = bestMentoringMentor.getMem_email();
		BestMentorVo bestMentorVo = indexMapper.selectBestMentor(mem_email);
		List<Mentoring> list = indexMapper.selectBestMentorMentoringList(mem_email);
		return new BestMentorListResult(bestMentorVo, list);
	}
	
}
