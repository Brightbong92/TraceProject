package tp.mentoring.controller;

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

import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;
import tp.mentoring.service.MentoringService;
import tp.vo.MentoringListResult;

@Log4j
@RequestMapping("/mentoring/*")
@Controller
public class MentoringController {
	
	@Autowired
	private MentoringService service;
	
	
	@GetMapping("list1.do")
	public String list1() {
		return "mentoring/list1";
		//return new ModelAndView("addr/list","list",list);
	}
	@GetMapping("searchList.do")
	public ModelAndView serachList(HttpServletRequest request, String word) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		word = word.trim();
		
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
				if(psStr == null) {
					Object psObj = session.getAttribute("ps");
					if(psObj != null) {
						ps = (Integer)psObj;
					}
				}else {
					psStr = psStr.trim();
					int psParam = Integer.parseInt(psStr);//넘어온 ps
					
					Object psObj = session.getAttribute("ps"); //현재 ps
					if(psObj != null) {
						int psSession = (Integer)psObj;
						if(psSession != psParam) {//현재 ps 넘어온 ps 가 다르면 cp = 1 초기화
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
		//log.info("#cp: " + cp + " #ps: " + ps + "#word: " + word);
		MentoringListResult mentoringListResultSearch = service.getMentoringListResultSearch(cp, ps, word);		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mentoring/mentoring_search_list");
		mv.addObject("mentoringListResultSearch",mentoringListResultSearch);
		return mv;
	}
	
	@GetMapping("mentoring_list.do")
	public ModelAndView mentoringList(String sort) {//리스트 & 정렬
		int cp = 1;
		int ps = 6;
	    if(sort.equals("0")){//운동
			//log.info("#sort: "+ sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultExercise", mentoringListResult);
			return mv;	
		}else if(sort.equals("1")){//음악
			//log.info("#sort: "+ sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultMusic", mentoringListResult);
			return mv;	
		}else if(sort.equals("2")){//공예
			//log.info("#sort: "+ sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultCraft", mentoringListResult);
			return mv;	
		}else if(sort.equals("3")){//요리
			//log.info("#sort: "+ sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultCooking", mentoringListResult);
			return mv;	
		}else if(sort.equals("4")){//사진&영상
			//log.info("#sort: "+ sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultMedia", mentoringListResult);
			return mv;	
		}else if(sort.equals("5")){//5뷰티
			//log.info("#sort: "+ sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultBeauty", mentoringListResult);
			return mv;	
		}else if(sort.equals("6")){//음료
			//log.info("#sort: "+ sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultBeverage", mentoringListResult);
			return mv;	
		}else {//99전체일경우
			//log.info("#sort: " + sort);
			ModelAndView mv = new ModelAndView();
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			mv.setViewName("mentoring/mentoring_list");
			mv.addObject("listResultAll", mentoringListResult);
			return mv;
		}
	}
	@GetMapping("ajaxList.do")
	public void ajaxList(int cp, HttpServletResponse response, String sort) {
		if(sort.equals("99")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else if(sort.equals("0")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else if(sort.equals("1")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else if(sort.equals("2")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else if(sort.equals("3")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else if(sort.equals("4")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else if(sort.equals("5")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else if(sort.equals("6")) {
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}else{
			int ps = 6;
			MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
			ObjectMapper om = new ObjectMapper();
			try {
				String json = om.writeValueAsString(mentoringListResult);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print(json);
			}catch(IOException ie) {
				System.out.println("#ie: " + ie);
			}
		}
	}

	
	@GetMapping("list4.do")
	public String list4() {
		return "mentoring/list4";
		//return new ModelAndView("addr/list","list",list);
	}
	@GetMapping("list5.do")
	public String list5() {
		return "mentoring/list5";
		//return new ModelAndView("addr/list","list",list);
	}
	
}
