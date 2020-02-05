package tp.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring_Review_File {
	private long mtrrvf_seq;
	private String mtrrvf_ofname;
	private String mtrrvf_fname;
	private long mtrrv_seq;
}
	