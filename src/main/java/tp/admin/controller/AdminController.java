package tp.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import tp.admin.service.AdminService;
import tp.domain.Member;
import tp.domain.Notice;
import tp.vo.MemberInfo;
import tp.vo.MemberListResult;
import tp.vo.MentorListResult;

@Log4j
@RequestMapping("admin/*")
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("dashboard.do")
	public String admin() {
		return "admin/dashboard";
	}
	@GetMapping("member_info.do")
	public ModelAndView member_info(HttpServletRequest request) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		
		HttpSession session = request.getSession();
		
		//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("membercp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("membercp", cp);
		
		//(2) ps 
		int ps = 10;
		if(psStr == null) {
			Object psObj = session.getAttribute("memberps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("memberps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("membercp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("membercp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("memberps", ps);
		
		MemberListResult memberListResult = service.getMemberListResult(cp,ps);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/member_info");
		mv.addObject("memberListResult",memberListResult);
		return mv;
	}
	@GetMapping("notice_form.do")
	public String notice_form() {
		return "admin/notice_form";
	}
	@PostMapping("notice_write.do")
	public ModelAndView notice_write(Notice notice) {
		service.insertN(notice);
		return new ModelAndView("redirect:../notice/list.do");
	}
	
	@GetMapping("charts.do")
	public String charts() {
		return "admin/charts";
	}
	@GetMapping("popup.do")
	public ModelAndView pupup(String mem_email) {
		MemberInfo memberInfoResult = service.getMemberInfo(mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/member_popup");
		mv.addObject("memberInfoResult",memberInfoResult);
		return mv;
	}
	@GetMapping("disabled.do")
	public void disabled(String mem_email) {
		service.updateN(mem_email);
	}
	@GetMapping("mentor_info.do")
	public ModelAndView mentor_info(HttpServletRequest request) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		
		HttpSession session = request.getSession();
		
		//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("mentorcp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("mentorcp", cp);
		
		//(2) ps 
		int ps = 5;
		if(psStr == null) {
			Object psObj = session.getAttribute("mentorps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("mentorps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("mentorcp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("mentorcp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("mentorps", ps);
		
		MentorListResult mentorListResult = service.getMentorListResult(cp,ps);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/mentor_info");
		mv.addObject("mentorListResult",mentorListResult);
		return mv;
	}
	@GetMapping("mentor_approve.do")
	public ModelAndView mentor_approve(String mem_email) {
		service.mentorApprove(mem_email);
		return new ModelAndView("redirect:mentor_info.do");
	}
	
}