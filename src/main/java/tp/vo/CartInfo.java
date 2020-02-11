package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartInfo {
	private long mtr_seq;
	private String mtr_profile;
	private String mtr_subject;
	private String mtr_hashtag;
	private long mtr_price;
	private long mtrdi_seq;
	private String mtrdi_stime;
	private String mtrdi_etime;
	private long mem_point;
	private long ct_seq;
}
