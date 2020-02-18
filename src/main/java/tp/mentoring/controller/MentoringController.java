package tp.mentoring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jdk.nashorn.internal.parser.JSONParser;
import lombok.extern.log4j.Log4j;
import tp.domain.Mentor_List;
import tp.domain.Mentoring;
import tp.mentoring.service.MentoringService;
import tp.vo.MentorInfoVo;
import tp.vo.MentoringListResult;
import tp.vo.MentoringViewPageQaRvCountVo;
import tp.vo.MentoringViewPageVo;
import tp.vo.SearchListResult;

@Log4j
@RequestMapping("/mentoring/*")
@Controller
public class MentoringController {
	@Autowired
	private MentoringService service;
	
	@GetMapping("searchList.do")
	public ModelAndView serachList(HttpServletRequest request, String word) {
		
		if(word == null) word = ""; word = word.trim();
		log.info("#word: " + word);
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
		int ps = 4;
		session.setAttribute("ps", ps);
				

		MentoringListResult mentoringListResultSearch = service.getMentoringListResultSearch(cp, ps, word);		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mentoring/mentoring_search_list");
		mv.addObject("mentoringListResultSearch",mentoringListResultSearch);
		return mv;
	
	}
	@GetMapping("mentoring_list.do")
	public ModelAndView mentoringList(String sort) {//리스트 & 정렬
		int cp = 1;
		int ps = 8;
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mentoring/mentoring_list");
		switch(sort) {
		case "0": {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultExercise", mentoringListResult);
					return mv;}//운동
		case "1": {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultMusic", mentoringListResult);
					return mv;}//음악
		case "2": {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultCraft", mentoringListResult);
					return mv;}//공예
		case "3": {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultCooking", mentoringListResult);
					return mv;}//요리
		case "4": {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultMedia", mentoringListResult);
					return mv;}//사진&영상
		case "5": {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultBeauty", mentoringListResult);
					return mv;}//뷰티
		case "6": {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultBeverage", mentoringListResult);
					return mv;}//음료
		default: {MentoringListResult mentoringListResult = mentoringListResult(cp, ps, sort); 
					mv.addObject("listResultAll", mentoringListResult);}
					return mv;}//99 전체
	}
	private MentoringListResult mentoringListResult(int cp, int ps, String sort) {
		MentoringListResult mentoringListResult = service.getMentoringListResult(cp, ps, sort);
		return mentoringListResult;
	}
	@GetMapping("ajaxList.do")
	public void ajaxList(int cp, HttpServletResponse response, String sort) {
		switch(sort) {
		case "99": ajaxListWrite(cp, response, sort); break;
		case "0": ajaxListWrite(cp, response, sort); break;
		case "1": ajaxListWrite(cp, response, sort); break;
		case "2": ajaxListWrite(cp, response, sort); break;
		case "3": ajaxListWrite(cp, response, sort); break;
		case "4": ajaxListWrite(cp, response, sort); break;
		case "5": ajaxListWrite(cp, response, sort); break;
		case "6": ajaxListWrite(cp, response, sort); break;
		default: ajaxListWrite(cp, response, sort); break;
		}
		
	}
	
	private void ajaxListWrite(int cp, HttpServletResponse response, String sort) {
		int ps = 8;
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
	@GetMapping("mentoringWriteForm.do")
	public String mentoringWriteForm() {
		return "mentoring/mentoring_write_form";
	}
	
	@PostMapping("mentoringWrite.do")
	public String mentoringWrite(Mentoring mentoring, MultipartFile mtr_profile_file, String[] mtrdi_time, String[] mtr_hashtagArray) {
		if(!mtr_profile_file.getOriginalFilename().equals("")) {//썸네일 등록 했을 시
			String mtr_profile = service.saveStore(mtr_profile_file);
			
			StringBuffer mtr_hashtagSb = new StringBuffer();
			for(int i = 0; i<=mtr_hashtagArray.length-1; i++) {
				String tmpStr = mtr_hashtagArray[i];
				mtr_hashtagSb.append(tmpStr.trim());
			}
			String mtr_hashtag = mtr_hashtagSb.toString();
			Mentoring m = new Mentoring(-1, mentoring.getMtr_subject(),
					mentoring.getMtr_content(),mentoring.getMtr_price(),mentoring.getMtr_area(),mentoring.getMtr_addr(),
					mentoring.getMtr_jumsu(),mtr_profile,mtr_hashtag,null,mentoring.getMtrcg_no(),
					mentoring.getMem_email());
			service.MentoringInsert(m, mtrdi_time);
		}else {//썸네일 등록 안했을 시
			String mtr_profile = "defaultMentoringImage.png";
			StringBuffer mtr_hashtagSb = new StringBuffer();
			for(int i = 0; i<=mtr_hashtagArray.length-1; i++) {
				String tmpStr = mtr_hashtagArray[i];
				mtr_hashtagSb.append(tmpStr.trim());
			}
			String mtr_hashtag = mtr_hashtagSb.toString();
			Mentoring m = new Mentoring(-1, mentoring.getMtr_subject(),
					mentoring.getMtr_content(),mentoring.getMtr_price(),mentoring.getMtr_area(),mentoring.getMtr_addr(),
					mentoring.getMtr_jumsu(),mtr_profile,mtr_hashtag,null,mentoring.getMtrcg_no(),
					mentoring.getMem_email());	
			service.MentoringInsert(m, mtrdi_time);
		}
		return "mentoring/write_msg";
	}
	@RequestMapping(value="mentoringDetail.do", method=RequestMethod.GET)
	public ModelAndView mentoringDetail(long mtr_seq) {
		MentoringViewPageVo listResult = service.selectMentoringDetailView(mtr_seq);
		MentorInfoVo mentorInfo = service.getMentorInfo(mtr_seq);
		
		
		MentoringViewPageQaRvCountVo qaRvCount = service.getQaRvCount(mtr_seq);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mentoring/mentoring_view_page");
		mv.addObject("listResult", listResult);
		mv.addObject("mentorInfo", mentorInfo);
		//log.info("#listResult: " + listResult);
		mv.addObject("qaRvCount", qaRvCount);
		return mv;	
	}
	
	
	@PostMapping("autoSearch.do")
	@ResponseBody
	public void autoSearch(@RequestBody String word, HttpServletResponse response) {
		word = word.substring(1,word.lastIndexOf('"'));
		List<String> list = new ArrayList<String>();
		if(!word.startsWith("#")) {
			list = service.getSelectAutoSearchSubject(word); log.info("#word: " + word);//log.info("#list: " + list);	
		}else {
			list = service.getSelectAutoSearchHashtag(word);
		}

		SearchListResult listResult = new SearchListResult(); listResult.setList(list);
		ObjectMapper om = new ObjectMapper();
		try {
		String json = om.writeValueAsString(listResult);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.write(json);
		}catch(Exception e) {
			log.info("e: " + e);
		}
	}
	
	
	
	@GetMapping("list1.do")
	public String list1() {
		return "mentoring/list1";
		//return new ModelAndView("addr/list","list",list);
	}
	@GetMapping("list4.do")
	public String list4() {
		return "mentoring/list4";
		//return new ModelAndView("addr/list","list",list);
	}
	
	
}
