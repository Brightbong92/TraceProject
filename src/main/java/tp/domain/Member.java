package tp.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String mem_email;
	private String mem_pwd;
	private String mem_nick;
	private String mem_age;
	private int mem_gender;
	private String mem_profile;
	private Date mem_rdate;
	private long mem_point;
	private long mem_auth;
	private long mem_state;
}
