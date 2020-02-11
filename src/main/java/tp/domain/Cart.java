package tp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private long ct_seq;
	private java.sql.Date ct_rdate;
	private long mtr_seq;
	private long mtrdi_seq;
	private String mem_email;
}
