package tp.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring_Review {
	private long mtrrv_seq;
	private String mtrrv_content;
	private java.sql.Date mtrrv_rdate;
	private int mtrrv_jumsu;
	private int mtrrv_likecnt;
	private long mtr_seq;
	private String mem_email;
	//mem_email에서 닉네임 가져오기위해
	private String mem_nick;
	private String mem_profile;
	
	
	public Mentoring_Review(long mtrrv_seq, String mtrrv_content, java.sql.Date mtrrv_rdate, int mtrrv_jumsu,
							int mtrrv_likecnt, long mtr_seq, String mem_email)
	{
		this.mtrrv_seq = mtrrv_seq;
		this.mtrrv_content = mtrrv_content;
		this.mtrrv_rdate = mtrrv_rdate;
		this.mtrrv_jumsu = mtrrv_jumsu;
		this.mtrrv_likecnt = mtrrv_likecnt;
		this.mtr_seq = mtr_seq;
		this.mem_email = mem_email;
	}
	
}
	