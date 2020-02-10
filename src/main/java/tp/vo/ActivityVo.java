package tp.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActivityVo {
	private long mtr_seq;
	private String mtr_subject;
	private int mtrdi_max_pcnt;
	private int mtrdi_now_pcnt;
	private String mtrdi_stime;
	private String mtrdi_etime;
	private Date pi_rdate;
}
