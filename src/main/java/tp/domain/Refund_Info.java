package tp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Refund_Info {
	private long ri_seq;
	private String ri_pg;
	private String ri_method;
	private String ri_muid;
	private String ri_product;
	private int ri_price;
	private java.sql.Date ri_rdate;
	private String ri_name;
	private String ri_phone;
	private String ri_reason;
	private String mem_email;
	private long pi_seq;
}