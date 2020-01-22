package tp.hobbytest.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("hobbytest/*")
@Controller
public class HobbyTestController {
	@RequestMapping(value = "hobby_test.do", method = RequestMethod.GET)
	public String hobbyHome() {
		return "hobby_test/hobby_test";
	}
}