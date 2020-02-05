package tp.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Points {
	private String po_content;
	private long po_saving;
	private Date po_rdate;
	private String mem_email;
}
