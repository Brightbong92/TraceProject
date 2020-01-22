package tp.login.controller;



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
import tp.login.service.LoginService;
import tp.vo.MemberVo;


@RequestMapping("login/*")
@Controller
@AllArgsConstructor
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	 
	private LoginService service;

	@GetMapping("login.do")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVo vo, HttpSession session) {
		boolean result = service.loginCheck(vo,session);
		ModelAndView mav = new ModelAndView();
		if (result == true) { // 로그인 성공
            // main.jsp로 이동
            mav.setViewName("index");
            mav.addObject("msg", "success");
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("member/login");
            mav.addObject("msg", "failure");
        }
        return mav;
	}
}