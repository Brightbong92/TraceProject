package tp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	private long rep_seq;
	private String rep_content;
	private String rep_caller;
	private String rep_receiver;
	private java.sql.Date rep_rdate;
	private long mtrqa_seq;
	private long mtrrv_seq;
}
