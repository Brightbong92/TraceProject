package tp.review.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Mentoring_Review_Like;
import tp.domain.Mentoring_Review_Reply;
import tp.domain.Report;
import tp.vo.MentoringReviewVo;

public interface ReviewService {
	MentoringReviewVo getMentoringReviewVo(long mtr_seq, long cp, long ps);
	
	void mentoringReviewReplyRegister(Mentoring_Review_Reply mtr_review_reply);
	
	Mentoring getMentoringSubject(long mtr_seq);
	
	void mentoringReviewRegister(long mtr_seq, String mtrrv_content, ArrayList<MultipartFile> mtrrv_file, 
			int star_input, String mem_email);
	
	boolean mentoringReviewLikePlus(Mentoring_Review_Like mtr_review_like);
	boolean insertReportRvBoardS(Report report);
	
}
