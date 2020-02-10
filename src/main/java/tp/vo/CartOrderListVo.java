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
public class CartOrderListVo {
	private String mtr_profile;
	private String mtr_subject;
	private String mtr_hashtag;
	private String mtrdi_stime;
	private String mtrdi_etime;
	private long mtr_price;
	private long mtr_seq;
	private long mtrdi_seq;
	private long ct_seq;
}