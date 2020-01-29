package tp.domain;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring_Detail_Info {
	private long mtrdi_seq;
	//private Timestamp mtrdi_stime;
	//private Timestamp mtrdi_etime;
	private String mtrdi_stime;
	private String mtrdi_etime;
	private int mtrdi_max_pcnt;
	private int mtrdi_now_pcnt;
	private long mtr_seq;
}
