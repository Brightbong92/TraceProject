package tp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentor_List {
	private String mem_email;
	private String ml_name;
	private String ml_phone;
	private String ml_yourself;
	private String ml_fname;
	private String ml_ofname;
	private int mtrcg_no;
	private int ml_apply;
}
