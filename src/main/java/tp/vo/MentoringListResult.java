package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentoring;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentoringListResult {
	private int currentPage;
	private int totalCount;
	private int pageSize;
	private List<Mentoring> mtr_list;
	private int totalPageCount;
	private String category_no;
	
	public MentoringListResult(int currentPage, int totalCount, int pageSize, List<Mentoring> mtr_list, String category_no) {
		super();
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.mtr_list = mtr_list;
		this.totalPageCount = calTotPageCount();
		this.category_no = category_no;
	}
	public int calTotPageCount() {
		int tpc = totalCount / pageSize;
		if((totalCount % pageSize) != 0) {
			tpc++;
		}
		return tpc;
	}
}
