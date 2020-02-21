package tp.hobbytest.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.domain.Mentoring;
import tp.hobbytest.mapper.HobbyTestMapper;

@Service
public class HobbyTestServiceImpl implements HobbyTestService {

	@Autowired
	HobbyTestMapper mapper;
	
	@Override
	public List<Mentoring> getMentoring(long[] mtr_seq) {
		List<Mentoring> list = new ArrayList<Mentoring>();
		for(long seq : mtr_seq) {
			Mentoring mtr = mapper.selectMentoring(seq);
			list.add(mtr);
		}
		return list;
	}

}
