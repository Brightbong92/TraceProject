package tp.login.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping("login/*")
@Controller
public class LoginController {
	
	@GetMapping("login.do")
	public String hobbyHome() {
		return "login/login";
	}
}