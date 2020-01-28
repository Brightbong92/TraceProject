package tp.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class NoticeVo {
	String keyword;
	
	private int page;
	private int pageSize;
	
	public int getStartRow() {
		return (page-1) * pageSize;
	}
	public int getEndRow() {
		return page * pageSize;
	}
}