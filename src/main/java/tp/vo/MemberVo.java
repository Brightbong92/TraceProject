package tp.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVo {
	private String userEmail;
	private String userPwd;
	private String userNick;
	private String userAge;
	private String userGender;
	private Date userRdate;
}
