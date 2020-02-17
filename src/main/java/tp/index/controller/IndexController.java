package tp.index.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import tp.domain.Mentoring;
import tp.index.service.IndexService;
import tp.vo.BestMentorListResult;
import tp.vo.IndexListResult;
import tp.vo.MemberListResult;

@Log4j
@Controller
public class IndexController {
	@Autowired
	private IndexService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		IndexListResult indexListResult = service.indexListResult();
		BestMentorListResult bestMentorListResult = service.getBestMentorListResult();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index/index");
		mv.addObject("indexListResult",indexListResult);
		mv.addObject("bestMentorListResult", bestMentorListResult);
		return mv;
	}
}