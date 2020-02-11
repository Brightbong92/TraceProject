package tp.domain;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment_Detail_Info {
	private long mtr_seq;
	private long mtrdi_seq;
	private long pi_seq;
}