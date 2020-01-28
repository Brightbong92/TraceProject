package tp.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVo {
	private String mem_email;
	private String mem_nick;
	private Date mem_rdate;
	private long mem_point;
	private int cnt;
	
	public MemberVo(String mem_email, String mem_nick, int cnt){
		this.mem_email = mem_email;
		this.mem_nick = mem_nick;
		this.cnt = cnt;
	}
	public MemberVo(String mem_email, String mem_nick, Date mem_rdate){
		this.mem_email = mem_email;
		this.mem_nick = mem_nick;
		this.mem_rdate = mem_rdate;
	}
	public MemberVo(String mem_email, String mem_nick, long mem_point){
		this.mem_email = mem_email;
		this.mem_nick = mem_nick;
		this.mem_point = mem_point;
	}
}
