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
	private Timestamp mtrdi_stime;
	private Timestamp mtrdi_etime;
	private long mtrdi_max_pcnt;
	private long mtrdi_now_pcnt;
	private long mtrdi_state;
	private long mtr_seq;
}
