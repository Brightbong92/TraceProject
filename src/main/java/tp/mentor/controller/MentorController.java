package tp.mentor.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping("/mentor/*")
@Controller
public class MentorController {
	
	@GetMapping("mentor_apply.do")
	public String hobbyHome() {
		return "mentor/mentor_apply";
	}
}