package tp.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class MentoringPagingVo {
	String keyword; //for 검색 
	
	private int page; //페이지 번호 
	private int pageSize; //페이지 사이즈  ( 한페이지당 글 갯수 )
	

	
	
	{
		page = 1;
		pageSize = 6;
	}
	
	public int getStartRow() {
		return (page-1) * pageSize; // ex) 0
	}
	public int getEndRow() {
		return page * pageSize; //ex) 5
	}
}
