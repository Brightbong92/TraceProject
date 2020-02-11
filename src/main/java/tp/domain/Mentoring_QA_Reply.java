package tp.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring_QA_Reply {
	private long mtrqarp_seq;
	private String mtrqarp_content;
	private java.sql.Date mtrqarp_rdate;
	private String mem_email;
	private long mtrqa_seq;
	//mem_email에서 닉네임 가져오기위해
	private String mem_nick;
	private String mem_profile;
}
	