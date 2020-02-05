package tp.index.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tp.domain.Mentoring;
import tp.index.service.IndexService;
import tp.vo.IndexListResult;


@Controller
public class IndexController {
	@Autowired
	private IndexService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		IndexListResult bestMentoring = service.bestMentoring();
		return new ModelAndView("index/index","bestMentoring",bestMentoring);
	}

}