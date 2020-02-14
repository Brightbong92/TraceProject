package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentoring;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BestMentorListResult {
	private BestMentorVo bestMentorVo;
	private List<Mentoring> bestMentorMentoringList;
}
