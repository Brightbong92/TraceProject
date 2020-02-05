package tp.vo;



import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentoringQAVo {
	private int currentPage;
	private int totalCount;
	private int pageSize;
	private int totalPageCount;
	List<Mentoring_QA> mtr_qa_list;
	//List<Mentoring_QA_Reply> mtr_qa_reply_list;
	List<List<Mentoring_QA_Reply>> mtr_qa_reply_list;
	private String mtr_subject;
	private long mtr_seq;
	private String mem_email;//멘토링글 작성자 이메일(답변폼 나타나는유무체크)
	
	public MentoringQAVo(int currentPage, int totalCount, int pageSize, List<Mentoring_QA> mtr_qa_list, List<List<Mentoring_QA_Reply>> mtr_qa_reply_list, String mtr_subject, long mtr_seq, String mem_email){
	this.currentPage = currentPage;
	this.totalCount = totalCount;
	this.pageSize = pageSize;
	this.totalPageCount = calTotalPageCount();
	this.mtr_qa_list = mtr_qa_list;
	this.mtr_qa_reply_list = mtr_qa_reply_list;
	this.mtr_subject = mtr_subject;
	this.mtr_seq = mtr_seq;
	this.mem_email = mem_email;

	}
	
	public int calTotalPageCount() {
		int tpc = totalCount / pageSize;
		if((totalCount % pageSize) != 0) {
			tpc++;
		}
		return tpc;
	}
}
