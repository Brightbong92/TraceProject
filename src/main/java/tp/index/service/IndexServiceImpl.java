 package tp.index.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.index.mapper.IndexMapper;
import tp.vo.IndexListResult;

@Service
@AllArgsConstructor
@Log4j
public class IndexServiceImpl implements IndexService {
	private IndexMapper indexMapper;
	
	@Override
	public IndexListResult bestMentoring() {
		List<Mentoring> topMentoring = indexMapper.bestMentoringTop();
		List<Mentoring> latestArticle = indexMapper.latestArticle();
		Member bestMentoringMentor = indexMapper.bestMentoringMentor();
		
		return new IndexListResult(bestMentoringMentor,topMentoring,latestArticle);
	}



}
