package tp.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class MentoringReviewPagingVo {
	
	private long page; //페이지 번호 
	private long pageSize; //페이지 사이즈  ( 한페이지당 글 갯수 )
	
	private long mtr_seq;
	
	public long getStartRow() {
		return (page-1) * pageSize; // ex) 0
	}
	public long getEndRow() {
		return page * pageSize; //ex) 5
	}
	public long getMtr_seq() {
		return mtr_seq;
	}
	public void setMtr_seq(long mtr_seq) {
		this.mtr_seq = mtr_seq;
	}
	
	
}
