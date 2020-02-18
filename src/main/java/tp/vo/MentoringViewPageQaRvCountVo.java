package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentoringViewPageQaRvCountVo {
	private long qaCnt;
	private long rvCnt;
}
