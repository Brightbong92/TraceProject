package tp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment_Info {
	private long pi_seq;
	private String pi_pg;
	private String pi_method;
	private String pi_muid;
	private String pi_product;
	private int pi_price;
	private java.sql.Date pi_rdate;
	private String pi_name;
	private String pi_phone;
	private long pi_state;
	private long mtr_seq;//실제 디비에는 없는 vo
	private String mem_email;
}