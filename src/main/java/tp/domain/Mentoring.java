package tp.domain;


import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring {
	private long mtr_seq;
	private String mtr_subject;
	private String mtr_content;
	private long mtr_price;
	private String mtr_area;
	private String mtr_addr;
	private long mtr_jumsu;
	private String mtr_profile;
	private String mtr_hashtag;
	private Date mtr_rdate;
	private long mtrcg_no;
	private String mem_email;
}
	