package tp.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tp.domain.Notice;
import tp.vo.NoticeContentList;
import tp.vo.NoticeListResult;
import tp.notice.service.NoticeService;


@RequestMapping("notice/*")
@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
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
		
		int ps = 10;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (int)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		System.out.println("#cp: "+ cp + "#ps : "+ ps);
		NoticeListResult listResult = service.getNoticeListResult(cp, ps);
		ModelAndView mv = new ModelAndView("notice/notice_list", "listResult", listResult);
		if(listResult.getList().size() == 0) {
			if(cp > 1) {
				return new ModelAndView("redirect:list.do?cp="+(cp-1));
			}else {
				return new ModelAndView("notice/notice_list", "listResult", null);
			}
		}else {
			return mv;
		}
	}
	
	
	@GetMapping("content.do")
	public ModelAndView content(long noti_seq) {
		NoticeContentList noticeContentList = service.getNotice(noti_seq);
		ModelAndView mv = new ModelAndView("notice/notice_content", "noticeContentList", noticeContentList);
		return mv;
	}
	@GetMapping("qna.do")
	public String qna() {
		
		return "notice/qna";
	}
	@GetMapping("qna2.do")
	public String qna2() {
		return "notice/qna2";
	}
	@GetMapping("qna3.do")
	public String qna3() {
		return "notice/qna3";
	}
	@GetMapping("qna4.do")
	public String qna4() {
		return "notice/qna4";
	}
	@GetMapping("qna5.do")
	public String qna5() {
		return "notice/qna5";
	}
	@GetMapping("qna6.do")
	public String qna6() {
		return "notice/qna6";
	}
	@GetMapping("qna7.do")
	public String qna7() {
		return "notice/qna7";
	}
	@GetMapping("qna8.do")
	public String qna8() {
		return "notice/qna8";
	}
	@GetMapping("qna9.do")
	public String qna9() {
		return "notice/qna9";
	}
	@GetMapping("qna10.do")
	public String qna10() {
		return "notice/qna10";
	}
	@GetMapping("qna11.do")
	public String qna11() {
		return "notice/qna11";
	}
	@GetMapping("search.do")
	public ModelAndView search(HttpServletRequest request, String keyword) {
		
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		keyword = keyword.trim();
		
		HttpSession session = request.getSession();
		
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
		
		int ps = 10;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (int)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		NoticeListResult listResult = service.getNoticeListResultSearch(cp, ps, keyword);
		ModelAndView mv = new ModelAndView("notice/notice_list", "listResult", listResult);
		if(listResult.getList().size() == 0) {
			if(cp > 1) {
				return new ModelAndView("redirect:list.do?cp="+(cp-1));
			}else {
				return new ModelAndView("notice/notice_list", "listResult", null);
			}
		}else {
			return mv;
		}
	}
	@GetMapping("delete.do")
	public ModelAndView delete(long noti_seq) {
		service.deleteN(noti_seq);
		return new ModelAndView("redirect:list.do");
	}
	@GetMapping("update_form.do")
	public ModelAndView update_form(long noti_seq) {
		Notice notice = service.getNoticeUpdate(noti_seq);
		return new ModelAndView("notice/notice_update","notice",notice);
	}
	@PostMapping("notice_update.do")
	public ModelAndView update(Notice notice) {
		service.updateN(notice);
		return new ModelAndView("redirect:list.do");
	}
}