package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentoringViewPageVo {
	private long mtr_seq;
	private String mtr_subject;
	private String mtr_content;
	private long mtr_price;
	private String mtr_area;
	private String mtr_addr;
	private long mtr_jumsu;
	private String mtr_profile;
	private String mtr_hashtag;
	private long mtrcg_no;
	private String mem_email;
	List<Mentoring_Detail_Info> detail_Info_List;
	List<Mentoring> relative_mtr_list;
}
