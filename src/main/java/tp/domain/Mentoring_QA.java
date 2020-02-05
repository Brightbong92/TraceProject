package tp.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring_QA {
	private long mtrqa_seq;
	private String mtrqa_content;
	private java.sql.Date mtrqa_rdate;
	private String mem_email;
	private long mtr_seq;
	//mem_email에서 닉네임 가져오기위해
	private String mem_nick;
	private String mem_profile;
}
	