package tp.mentoring.service;

import java.util.List;

import tp.vo.MentoringListResult;

public interface MentoringService {
	MentoringListResult getMentoringListResult(int cp, int ps, String sort);
	
	
}
