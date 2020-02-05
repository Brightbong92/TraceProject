package tp.qa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.qa.service.QAService;
import tp.vo.MentoringListResult;
import tp.vo.MentoringQAVo;

@Log4j
@RequestMapping("qa/*")
@Controller
public class QAController {
	
	@Autowired
	QAService qaService;
	
	@GetMapping("qaList.do")
	public ModelAndView qaList(long mtr_seq, HttpServletRequest request) {
		
		String cpStr = request.getParameter("cp");
		//String psStr = request.getParameter("ps");
		HttpSession session = request.getSession();
		//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		//(2) ps 
		int ps = 3;
		session.setAttribute("ps", ps);

		ModelAndView mv = new ModelAndView();
		MentoringQAVo listResult = qaService.getMentoringQAVo(mtr_seq, cp, ps);
		
		mv.setViewName("qa/qa_list");
		mv.addObject("listResult", listResult);
		return mv;
	}
	
	@GetMapping("qaWriteForm.do")
	public ModelAndView qaWriteForm(long mtr_seq) {
		ModelAndView mv = new ModelAndView();
		Mentoring mtr = qaService.getMentoringSubject(mtr_seq);
		mv.setViewName("qa/qa_write_form");
		mv.addObject("mtr_seq",mtr_seq);
		mv.addObject("mtr_subject", mtr.getMtr_subject());
		return mv;
	}
	@RequestMapping(value="/qaRegister.do", method=RequestMethod.POST)
	public ModelAndView qaRegister(Mentoring_QA mtr_qa, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");mtr_qa.setMem_email(m.getMem_email());
		String mtrqa_content = mtr_qa.getMtrqa_content().trim();
		mtr_qa.setMtrqa_content(mtrqa_content);
		qaService.MentoringQARegister(mtr_qa);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qa/qa_write_msg");
		long mtr_seq = mtr_qa.getMtr_seq();
		mv.addObject("mtr_seq", mtr_seq);
		return mv;
	}
	@PostMapping("qaReplyRegister.do")
	public String qaReplyRegister(long mtrqa_seq, String mtrqarp_content, HttpSession session, long mtr_seq) {
		Member m = (Member)session.getAttribute("loginUser");
		Mentoring_QA_Reply mtr_qa_reply = new Mentoring_QA_Reply(-1, mtrqarp_content.trim(), null, m.getMem_email(), mtrqa_seq, null, null);
		qaService.MentoringQAReplyRegister(mtr_qa_reply);
		int cpInt = (int)session.getAttribute("cp");
		long cp = (long)cpInt;		
		return "redirect:qaList.do?mtr_seq="+mtr_seq+"&cp=1";
		
	}
	
	
}