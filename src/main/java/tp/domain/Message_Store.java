package tp.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message_Store {
	private long ms_seq;
	private String ms_caller;
	private String ms_receiver;
	private String ms_content;
	private java.sql.Date ms_rdate;
	private long ms_check;
}