package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartPurchaseVo {
	private String pi_muid;
	private String pi_product;
	private String pi_name;
	private String pi_phone;
	private long[] ct_seq;
	private int usedPointTot;
	private int pi_price;
	private String mem_email;
}