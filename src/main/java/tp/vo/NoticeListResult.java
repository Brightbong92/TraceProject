package tp.vo;

import java.util.List;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;
import tp.domain.Notice;

@Data
@NoArgsConstructor
public class NoticeListResult {
	private int page;
	private int pageSize;
	private int totalCount;
	private List<Notice> list;
	private int totalPageCount;
	private String keyword;
	
	public NoticeListResult(int page, int pageSize, int totalCount, List<Notice> list) {
		this.page = page;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	public NoticeListResult(int page, int pageSize, int totalCount, List<Notice> list, String keyword) {
		this.page = page;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
		this.keyword = keyword;
	}
	
	public int calTotalPageCount() {
		int tpc = totalCount / pageSize;
		if((totalCount % pageSize) != 0) {
			tpc++;
		}
		return tpc;
	}
}