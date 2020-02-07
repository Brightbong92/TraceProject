package tp.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class PaymentPageListVo {
	private long mtr_seq;
	private String mtr_subject;
	private String mtr_profile;
	private String mtr_hashtag;
	private long mtr_price;
	private List<Mentoring_Detail_Info> mtrdi_list;
	private long points;
}