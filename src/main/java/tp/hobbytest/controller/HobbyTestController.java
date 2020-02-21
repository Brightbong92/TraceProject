package tp.hobbytest.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tp.domain.Mentoring;
import tp.hobbytest.service.HobbyTestService;

@RequestMapping("/hobbytest/*")
@Controller
public class HobbyTestController {
	
	@Autowired
	HobbyTestService service;
	
	@RequestMapping("hobby_test.do")
	public String hobbyHome() {
		return "hobby_test/hobby_test";
	}
	@GetMapping("testResult1.do")
	public ModelAndView testResult1() {//소극적 seq{21, 51, 22}
		long[] mtr_seq = {21, 22, 51};
		ModelAndView mv = new ModelAndView();
		List<Mentoring> mentoringList = service.getMentoring(mtr_seq);
		mv.setViewName("hobby_test/testResult1");
		mv.addObject("mentoringList", mentoringList);
		return mv;
	}
	@GetMapping("testResult2.do")
	public ModelAndView testResult2() {//밸런스{2, 83, 97}
		long[] mtr_seq = {2, 83, 97};
		ModelAndView mv = new ModelAndView();
		List<Mentoring> mentoringList = service.getMentoring(mtr_seq);
		mv.setViewName("hobby_test/testResult2");
		mv.addObject("mentoringList", mentoringList);
		return mv;
	}
	@GetMapping("testResult3.do")
	public ModelAndView testResult3() {//적극적{12, 11, 56}
		long[] mtr_seq = {12, 11, 56};
		ModelAndView mv = new ModelAndView();
		List<Mentoring> mentoringList = service.getMentoring(mtr_seq);
		mv.setViewName("hobby_test/testResult3");
		mv.addObject("mentoringList", mentoringList);
		return mv;
	}
	
}