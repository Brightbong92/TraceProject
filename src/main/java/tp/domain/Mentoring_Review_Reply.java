package tp.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring_Review_Reply {
	private long mtrrvrp_seq;
	private String mtrrvrp_content;
	private java.sql.Date mtrrvrp_rdate;
	private String mem_email;
	private long mtrrv_seq;
	
	//mem_email에서 닉네임 가져오기위해
	private String mem_nick;
	private String mem_profile;
}
	