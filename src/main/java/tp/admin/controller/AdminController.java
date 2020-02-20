package tp.admin.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import tp.admin.service.AdminService;
import tp.adminCharts.service.AdminChartsService;
import tp.domain.Member;
import tp.domain.Notice;
import tp.domain.Report;
import tp.vo.MemberInfo;
import tp.vo.MemberListResult;
import tp.vo.MentorListResult;
import tp.vo.NoticeListResult;

@Log4j
@RequestMapping("admin/*")
@Controller
public class AdminController {
	@Autowired
	private AdminChartsService chartservice;
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
		
		log.info("#cp: " + cp + " #ps: " + ps );
		
		MemberListResult memberListResult = service.getMemberListResult(cp,ps);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/member_info");
		mv.addObject("memberListResult",memberListResult);
		return mv;
	}
	@GetMapping("search.do")
	public ModelAndView search(HttpServletRequest request, String keyword) {
		
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		//keyword = keyword.trim();
		
		HttpSession session = request.getSession();
		
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
		MemberListResult memberListResult = service.getMemberListResultSearch(cp, ps, keyword);
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
    @GetMapping("mentor_approved.do")
    public ModelAndView mentor_approved(String mem_email) {
       service.mentorApproved(mem_email);
       return new ModelAndView("redirect:mentor_info.do");
    }
    @GetMapping("mentor_disapproved.do")
    public ModelAndView mentor_disapproved(String mem_email) {
       service.mentorDisapproved(mem_email);
       return new ModelAndView("redirect:mentor_info.do");
    }
	@GetMapping("popup.do")
	public ModelAndView pupup(String mem_email) {
		MemberInfo memberInfoResult = service.getMemberInfo(mem_email);//회원정보
		List<Report> reportList = service.getMemberReport(mem_email);//신고정보
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/member_popup");
		mv.addObject("memberInfoResult",memberInfoResult);
		mv.addObject("reportList", reportList);
		return mv;
	}
	@GetMapping("disabled.do")
	public void disabled(String mem_email) {
		service.updateState(mem_email);
	}
	@GetMapping("auth_cancel.do")
	public void auth_cancel(String mem_email) {
		service.updateAuth(mem_email);
	}
	@GetMapping("charts.do")
	public String charts(Locale locale, Model model) {
		
		int count1 = chartservice.countmem1();//회원가입
		int count2 = chartservice.countmem2();
		int count3 = chartservice.countmem3();
		int count4 = chartservice.countmem4();
		int count5 = chartservice.countmem5();
		int count6 = chartservice.countmem6();
		int count7 = chartservice.countmem7();
		
		int mencount= chartservice.menCount();//남녀성비
		int womencount= chartservice.womenCount();
		
		int sportMTRCG = chartservice.sportMTRCG();
		int musicMTRCG = chartservice.musicMTRCG();
		int craftsMTRCG = chartservice.craftsMTRCG();
		int cookMTRCG = chartservice.cookMTRCG();
		int pictureMTRCG = chartservice.pictureMTRCG();
		int beautyMTRCG = chartservice.beautyMTRCG();
		int bevMTRCG = chartservice.bevMTRCG();
		
		int memberCount = chartservice.memberCount();
		int mentoringCount =chartservice.mentoringCount();
		int mentoCount =chartservice.mentoCount();
		
		int memAge1519 = chartservice.memAge1519();
		int memAge2029 = chartservice.memAge2029();
		int memAge3039 = chartservice.memAge3039();
		int memAge4049 = chartservice.memAge4049();
		int memAge5059 = chartservice.memAge5059();
		int memAge6069 = chartservice.memAge6069();
		int memAge7079 = chartservice.memAge7079();
		int memAge8089 = chartservice.memAge8089();
		int memAge9099 = chartservice.memAge9099();
		
		int dis_reson1 = chartservice.dis_reson1();
		int dis_reson2 = chartservice.dis_reson2();
		int dis_reson3 = chartservice.dis_reson3();
		int dis_reson4 = chartservice.dis_reson4();
		int dis_reson5 = chartservice.dis_reson5();
		int dis_reson6 = chartservice.dis_reson6();
		
		int reviewList = chartservice.reviewList();
		
		model.addAttribute("reviewList",reviewList);
		
		model.addAttribute("dis_reson1",dis_reson1);
		model.addAttribute("dis_reson2",dis_reson2);
		model.addAttribute("dis_reson3",dis_reson3);
		model.addAttribute("dis_reson4",dis_reson4);
		model.addAttribute("dis_reson5",dis_reson5);
		model.addAttribute("dis_reson6",dis_reson6);
		
		model.addAttribute("count1",count1);
		model.addAttribute("count2",count2);
		model.addAttribute("count3",count3);
		model.addAttribute("count4",count4);
		model.addAttribute("count5",count5);
		model.addAttribute("count6",count6);
		model.addAttribute("count7",count7);
		
		model.addAttribute("mencount",mencount);
		model.addAttribute("womencount",womencount);
		
		model.addAttribute("sportMTRCG",sportMTRCG);
		model.addAttribute("musicMTRCG",musicMTRCG);
		model.addAttribute("craftsMTRCG",craftsMTRCG);
		model.addAttribute("cookMTRCG",cookMTRCG);
		model.addAttribute("pictureMTRCG",pictureMTRCG);
		model.addAttribute("beautyMTRCG",beautyMTRCG);
		model.addAttribute("bevMTRCG",bevMTRCG);

		model.addAttribute("memberCount",memberCount);
		model.addAttribute("mentoringCount",mentoringCount);
		model.addAttribute("mentoCount",mentoCount);
		
		model.addAttribute("memAge1519",memAge1519);
		model.addAttribute("memAge2029",memAge2029);
		model.addAttribute("memAge3039",memAge3039);
		model.addAttribute("memAge4049",memAge4049);
		model.addAttribute("memAge5059",memAge5059);
		model.addAttribute("memAge6069",memAge6069);
		model.addAttribute("memAge7079",memAge7079);
		model.addAttribute("memAge8089",memAge8089);
		model.addAttribute("memAge9099",memAge9099);
		return "admin/charts";
	}
}