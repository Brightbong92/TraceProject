package tp.index.mapper;

import tp.domain.Member;
import tp.domain.Mentoring;

public interface IndexMapper {
	Mentoring bestMentoringInfo();
	Member bestMentoringMentor();
}
