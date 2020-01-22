package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;
import tp.domain.Mentoring_Hashtag;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentoringDetailVo {
	private List<Mentoring> mtr_list;
	private List<Mentoring_Hashtag> mtr_hashtag_list;
	private List<Mentoring_Detail_Info> mtr_detail_info_list;
}
