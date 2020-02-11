package tp.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Disabled {
	int dis_reason;
	String dis_improve;
	String mem_email;
}
