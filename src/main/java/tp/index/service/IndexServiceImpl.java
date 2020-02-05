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
		Mentoring bestMentoringInfo1 = indexMapper.bestMentoringInfo1();
		Mentoring bestMentoringInfo2 = indexMapper.bestMentoringInfo2();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
		Mentoring bestMentoringInfo3 = indexMapper.bestMentoringInfo3();
		Mentoring bestMentoringInfo4 = indexMapper.bestMentoringInfo4();
		Mentoring bestMentoringInfo5 = indexMapper.bestMentoringInfo5();
		
		Member bestMentoringMentor = indexMapper.bestMentoringMentor();
		
		return new IndexListResult(bestMentoringInfo1,bestMentoringInfo5,bestMentoringInfo2,bestMentoringInfo3,bestMentoringInfo4,bestMentoringMentor);
	}

}
