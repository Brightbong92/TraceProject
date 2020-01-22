package tp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mentoring_File {
	private long mtrf_seq;
	private String mtrf_ofname;
	private String mtrf_fname;
	private long mtr_seq;
}
