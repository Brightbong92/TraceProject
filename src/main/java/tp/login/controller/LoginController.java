package tp.login.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import tp.domain.Member;
import tp.login.service.LoginService;
import tp.login.service.LoginSet;


@RequestMapping("login/*")
@Controller
@AllArgsConstructor
public class LoginController {

	private LoginService service;

	@GetMapping("login.do")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute Member member, HttpServletRequest request) {
		String mem_email = member.getMem_email();
		String mem_pwd = member.getMem_pwd();
		System.out.println(mem_email+ " " +mem_pwd);
		int result = service.loginCheck(mem_email, mem_pwd);
		ModelAndView mv = new ModelAndView();
		if(result == LoginSet.PASS) {//로그인 성공
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			Member m = service.getMembersInfo(mem_email);
			session.setAttribute("loginUser", m);
			mv.setViewName("index/index");
	        return mv;
		}else {
			mv.setViewName("login/login");
	        return mv;
		}
	}
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "index/index";
	}
	
}