package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;
import tp.domain.Payment_Detail_Info;
import tp.domain.Payment_Info;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentCompletePageVo {
	Payment_Info payment_info;
	//List<Payment_Detail_Info> payment_detail_info_list;
	List<Mentoring> mtr_list;
	List<Mentoring_Detail_Info> mtrdi_list;
}