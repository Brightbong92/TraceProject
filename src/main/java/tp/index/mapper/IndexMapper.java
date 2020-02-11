package tp.index.mapper;

import java.util.List;

import tp.domain.Member;
import tp.domain.Mentoring;

public interface IndexMapper {
	List<Mentoring> bestMentoringTop();
	List<Mentoring> latestArticle();
	Member bestMentoringMentor();
}
