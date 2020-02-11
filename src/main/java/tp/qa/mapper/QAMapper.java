package tp.qa.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.vo.MentoringQAPagingVo;

public interface QAMapper {
	List<Mentoring_QA> selectMentoringQA(MentoringQAPagingVo pagingVo);
	//Mentoring_QA_Reply selectMentoringQAReply(long mtrqa_seq);
	List<Mentoring_QA_Reply> selectMentoringQAReply(long mtrqa_seq);
	int selectQACount(long mtr_seq);
	Mentoring selectMentoringSubjectEmail(long mtr_seq);
	
	
	@Select(value={"SELECT MENTORING_QA_SEQ.nextval FROM DUAL"})
	long selectMentoringQASeq();
	
	@Insert(value={"INSERT INTO MENTORING_QA VALUES(#{mtrqa_seq}, #{mtrqa_content}, SYSDATE, #{mem_email}, #{mtr_seq})"})
	void insertMentoringQA(Mentoring_QA mtr_qa);
	
	
	@Select(value={"SELECT MENTORING_QA_REPLY_SEQ.nextval FROM DUAL"})
	long selectMentoringQAReplySeq();
	
	@Insert(value= {"INSERT INTO MENTORING_QA_REPLY VALUES(#{mtrqarp_seq}, #{mtrqarp_content}, SYSDATE, #{mem_email}, #{mtrqa_seq})"})
	void insertMentoringQAReply(Mentoring_QA_Reply mtr_qa_reply);
	
}
