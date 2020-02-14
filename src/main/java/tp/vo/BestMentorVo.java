package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BestMentorVo {
	private String mem_email;
	private String mem_nick;
	private String mem_age;
	private String mem_gender;
	private String mem_profile;
	private java.sql.Date mem_rdate;
	private String ml_yourself;
}
