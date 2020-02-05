package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;
import tp.domain.Mentoring;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IndexListResult {
	Mentoring bestMentoringInfo1;
	Mentoring bestMentoringInfo2;
	Mentoring bestMentoringInfo3;
	Mentoring bestMentoringInfo4;
	Mentoring bestMentoringInfo5;
	Member bestMentoringMentor;
}
