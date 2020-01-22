package tp.mentoring.service;

import tp.vo.MentoringListResult;
public interface MentoringService {
	MentoringListResult getMentoringListResult(int cp, int ps, String sort);//리스트 & 정렬
	MentoringListResult getMentoringListResultSearch(int cp, int ps, String word);
}
