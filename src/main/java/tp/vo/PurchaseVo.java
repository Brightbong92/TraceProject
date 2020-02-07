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
public class PurchaseVo {
	private String pi_muid;
	private String mtr_subject;
	private String pi_name;
	private String pi_phone;
	private long[] mtrdi_seq;
	private int usedPointTot;
	private int pi_price;
	private long mtr_seq;
	private String mem_email;
}