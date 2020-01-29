package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentor_List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentorListResult {
	private int currentPage;
	private int totalCount;
	private int pageSize;
	private int totalPageCount;
	private List<Mentor_List> mentor_list;
	
	public MentorListResult(int currentPage, int totalCount, int pageSize, List<Mentor_List> mentor_list){
	this.currentPage = currentPage;
	this.totalCount = totalCount;
	this.pageSize = pageSize;
	this.totalPageCount = calTotalPageCount();
	this.mentor_list = mentor_list;
	
	}
	
	public int calTotalPageCount() {
		int tpc = totalCount / pageSize;
		if((totalCount % pageSize) != 0) {
			tpc++;
		}
		return tpc;
	}
}


