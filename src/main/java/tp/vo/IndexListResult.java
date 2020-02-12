package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.domain.Mentoring;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class IndexListResult {
	private Member mtr_bestMentor;
	private List<Mentoring> topMentoring;
	private List<Mentoring> latestArticle;
	private List<ReviewFilesList> reviewFiles;
	
}
