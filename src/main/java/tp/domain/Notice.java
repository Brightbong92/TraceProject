package tp.domain;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private long noti_seq; 
	private String noti_subject; 
	private String noti_content; 
	private Date noti_rdate; 
	private long noti_readcnt; 
	private String mem_email;
	
}