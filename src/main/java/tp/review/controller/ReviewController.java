package tp.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Mentoring_Review_Like;
import tp.domain.Mentoring_Review_Reply;
import tp.qa.service.QAService;
import tp.review.service.ReviewService;
import tp.vo.MentoringListResult;
import tp.vo.MentoringQAVo;
import tp.vo.MentoringReviewVo;

@Log4j
@RequestMapping("review/*")
@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	
	@GetMapping("reviewList.do")
	public ModelAndView reviewList(long mtr_seq, HttpServletRequest request) {
		
		String cpStr = request.getParameter("cp");
		//String psStr = request.getParameter("ps");
		HttpSession session = request.getSession();
		//(1) cp 
		long cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Long)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Long.parseLong(cpStr);
		}
		session.setAttribute("cp", cp);
		//(2) ps 
		long ps = 3;
		session.setAttribute("ps", ps);

		ModelAndView mv = new ModelAndView();
		MentoringReviewVo listResult = reviewService.getMentoringReviewVo(mtr_seq, cp, ps);
		mv.addObject("listResult", listResult);
		mv.setViewName("review/review_list");
		
		return mv;
	}
	
	@PostMapping("reviewReplyRegister.do")
	public String reviewReplyRegister(long mtrrv_seq, String mtrrvrp_content, HttpSession session, long mtr_seq) {
		Member m = (Member)session.getAttribute("loginUser");
		Mentoring_Review_Reply mtr_review_reply = new Mentoring_Review_Reply
				(-1, mtrrvrp_content.trim(), null, m.getMem_email(), mtrrv_seq, null, null);
		reviewService.mentoringReviewReplyRegister(mtr_review_reply);
		long cp = (long)session.getAttribute("cp");
		return "redirect:reviewList.do?mtr_seq="+mtr_seq+"&cp="+cp;
	}
	@GetMapping("reviewWriteForm.do")
	public ModelAndView reviewWriteForm(long mtr_seq) {
		ModelAndView mv = new ModelAndView();
		Mentoring mtr = reviewService.getMentoringSubject(mtr_seq);
		mv.setViewName("review/review_write_form");
		mv.addObject("mtr_seq",mtr_seq);
		mv.addObject("mtr_subject", mtr.getMtr_subject());
		return mv;
	}
	@PostMapping("reviewRegister.do")
	public ModelAndView reviewRegister(long mtr_seq, String mtrrv_content, ArrayList<MultipartFile> mtrrv_file, 
			int star_input, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser"); String mem_email = m.getMem_email();
		reviewService.mentoringReviewRegister(mtr_seq, mtrrv_content, mtrrv_file, star_input, mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("review/review_write_msg");
		mv.addObject("mtr_seq", mtr_seq);
		return mv;
	}
	
	@GetMapping("likePlus.do")
	public ModelAndView likePlus(String mem_email, long mtrrv_seq, long mtr_seq, HttpSession session) {
		Mentoring_Review_Like mtr_review_like = new Mentoring_Review_Like(mem_email, mtrrv_seq);
		boolean flag = reviewService.mentoringReviewLikePlus(mtr_review_like);
		
		
		long cp = (long)session.getAttribute("cp");
		ModelAndView mv = new ModelAndView();
		mv.addObject("cp", cp);
		mv.addObject("mtr_seq", mtr_seq);
		mv.setViewName("review/review_like_msg");
		if(flag) {
			mv.addObject("flag", flag);
			return mv;
		}else {
			mv.addObject("flag", flag);
			return mv;
		}
	}
	
	
	
}