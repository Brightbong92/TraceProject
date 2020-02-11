package tp.vo;



import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Mentoring_Review;
import tp.domain.Mentoring_Review_File;
import tp.domain.Mentoring_Review_Reply;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentoringReviewVo {
	private long currentPage;
	private long totalCount;
	private long pageSize;
	private long totalPageCount;
	List<Mentoring_Review> mtr_review_list;
	List<List<Mentoring_Review_File>> mtr_review_file_list;
	List<List<Mentoring_Review_Reply>> mtr_review_reply_list;
	private String mtr_subject;
	private long mtr_seq;
	private String mem_email;//멘토링글 작성자 이메일(답변폼 나타나는유무체크)
	
	public MentoringReviewVo(long currentPage, long totalCount, long pageSize, List<Mentoring_Review> mtr_review_list, 
			List<List<Mentoring_Review_File>> mtr_review_file_list, List<List<Mentoring_Review_Reply>> mtr_review_reply_list, 
			String mtr_subject, long mtr_seq, String mem_email)
	{
	this.currentPage = currentPage;
	this.totalCount = totalCount;
	this.pageSize = pageSize;
	this.totalPageCount = calTotalPageCount();
	this.mtr_review_list = mtr_review_list;
	this.mtr_review_file_list = mtr_review_file_list;
	this.mtr_review_reply_list = mtr_review_reply_list;
	this.mtr_subject = mtr_subject;
	this.mtr_seq = mtr_seq;
	this.mem_email = mem_email;
	}
	
	public long calTotalPageCount() {
		long tpc = totalCount / pageSize;
		if((totalCount % pageSize) != 0) {
			tpc++;
		}
		return tpc;
	}
}
