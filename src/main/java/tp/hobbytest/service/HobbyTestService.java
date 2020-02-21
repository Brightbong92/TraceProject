package tp.hobbytest.service;

import java.util.List;

import tp.domain.Mentoring;

public interface HobbyTestService {
	List<Mentoring> getMentoring(long[] mtr_seq);
}
