package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentorInfoVo {
	private String mem_email;
	private String mem_nick;
	private String mem_age;
	private String mem_gender;
	private String mem_profile;
	private java.sql.Date mem_rdate;
	private String ml_yourself;
	private String ml_name;
	private String ml_fname;
	private String ml_ofname;
	private int mtrcg_no;
	private int ml_apply;
}
