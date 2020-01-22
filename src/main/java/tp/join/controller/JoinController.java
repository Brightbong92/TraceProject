package tp.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping("join/*")
@Controller
public class JoinController {
	
	@GetMapping("join.do")
	public String join() {
		return "join/join";
	}
}