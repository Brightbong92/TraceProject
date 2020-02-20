package tp.qa.service;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Report;
import tp.vo.MentoringQAVo;

public interface QAService {
	MentoringQAVo getMentoringQAVo(long mtr_seq, int cp, int ps);
	void MentoringQARegister(Mentoring_QA mtr_qa);
	void MentoringQAReplyRegister(Mentoring_QA_Reply mtr_qa_reply);
	Mentoring getMentoringSubject(long mtr_seq);
	boolean insertReportQaBoardS(Report report);
}
