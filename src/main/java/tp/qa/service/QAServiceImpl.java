package tp.qa.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Report;
import tp.qa.mapper.QAMapper;
import tp.vo.MentoringQAPagingVo;
import tp.vo.MentoringQAVo;

@Service
public class QAServiceImpl implements QAService {

	@Autowired
	QAMapper qaMapper;
	
	@Override
	public MentoringQAVo getMentoringQAVo(long mtr_seq, int cp, int ps) {
		//MentoringQAVo mtrqaVo = new MentoringQAVo();
		//List<Mentoring_QA_Reply> mtr_qa_reply_list = new ArrayList<Mentoring_QA_Reply>();
		List<List<Mentoring_QA_Reply>> mtr_qa_reply_list = new ArrayList<List<Mentoring_QA_Reply>>();
		MentoringQAPagingVo pagingVo = new MentoringQAPagingVo(cp,ps,mtr_seq);
		List<Mentoring_QA> mtr_qa_list = qaMapper.selectMentoringQA(pagingVo);
		int totalCount = qaMapper.selectQACount(mtr_seq);
		Mentoring mtr = qaMapper.selectMentoringSubjectEmail(mtr_seq);
		for(Mentoring_QA list : mtr_qa_list) {
			long mtrqa_seq = list.getMtrqa_seq();
			//Mentoring_QA_Reply mtr_qa_reply = qaMapper.selectMentoringQAReply(mtrqa_seq);
			List<Mentoring_QA_Reply> mtr_qa_reply = qaMapper.selectMentoringQAReply(mtrqa_seq);
				//mtr_qa_reply_list.add(mtr_qa_reply);
				mtr_qa_reply_list.add(mtr_qa_reply);
			}
		/*
			mtrqaVo.setMtr_qa_reply_list(mtr_qa_reply_list);
			mtrqaVo.setMtr_qa_list(mtr_qa_list);
			mtrqaVo.setCurrentPage(cp);
			mtrqaVo.setPageSize(ps);
			mtrqaVo.setTotalCount(totalCount);
			mtrqaVo.setMtr_subject(mtr.getMtr_subject());
			mtrqaVo.setMtr_seq(mtr_seq);
			mtrqaVo.setMem_email(mtr.getMem_email());
			*/
			return new MentoringQAVo(cp, totalCount, ps, mtr_qa_list, mtr_qa_reply_list, mtr.getMtr_subject(), mtr_seq, mtr.getMem_email());
	}

	@Override
	@Transactional
	public void MentoringQARegister(Mentoring_QA mtr_qa) {
		long mtrqa_seq = qaMapper.selectMentoringQASeq(); mtr_qa.setMtrqa_seq(mtrqa_seq);
		qaMapper.insertMentoringQA(mtr_qa);
	}

	@Override
	@Transactional
	public void MentoringQAReplyRegister(Mentoring_QA_Reply mtr_qa_reply) {
		long mtrqarp_seq = qaMapper.selectMentoringQAReplySeq(); mtr_qa_reply.setMtrqarp_seq(mtrqarp_seq);
		qaMapper.insertMentoringQAReply(mtr_qa_reply);
	}

	@Override
	public Mentoring getMentoringSubject(long mtr_seq) {
		Mentoring mtr = qaMapper.selectMentoringSubjectEmail(mtr_seq);
		return mtr;
	}

	@Override
	@Transactional
	public boolean insertReportQaBoardS(Report report) {
		String duplicateCheck = qaMapper.selectReportDuplicate(report);
		if(duplicateCheck != null) {//중복
			return false;
		}else {//중복x
			long rep_seq = qaMapper.selectReportNextSeq(); report.setRep_seq(rep_seq);
			qaMapper.insertReportQaBoard(report);
			qaMapper.updateMemberState(report.getRep_receiver());//신고받은사람 상태변경
			return true;
		}
	}

	@Override
	public void deleteQAS(long mtrqa_seq) {
		qaMapper.deleteQA(mtrqa_seq);
	}

}
