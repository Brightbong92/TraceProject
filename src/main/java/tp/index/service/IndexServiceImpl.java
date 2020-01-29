package tp.index.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.index.mapper.IndexMapper;
import tp.vo.IndexListResult;

@Service
@AllArgsConstructor
public class IndexServiceImpl implements IndexService {
	private IndexMapper indexMapper;
	
	@Override
	public IndexListResult bestMentoring() {
		Mentoring bestMentoringInfo = indexMapper.bestMentoringInfo();
		Member bestMentoringMentor = indexMapper.bestMentoringMentor();
		
		return new IndexListResult(bestMentoringInfo,bestMentoringMentor);
	}

}
