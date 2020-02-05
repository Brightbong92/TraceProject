package tp.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class MemberPagingVo {
	private String keyword;
	
	private int page;  
	private int pageSize; 
	
	public MemberPagingVo(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public int getStartRow() {
		return (page-1) * pageSize;
	}
	public int getEndRow() {
		return page * pageSize;
	}

}
