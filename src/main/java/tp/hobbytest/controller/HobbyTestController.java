package tp.hobbytest.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/hobbytest/*")
@Controller
public class HobbyTestController {
	@RequestMapping("hobby_test.do")
	public String hobbyHome() {
		return "hobby_test/hobby_test";
	}
	@GetMapping("testResult1.do")
	public String testResult1() {
		return "hobby_test/testResult1";
	}
	@GetMapping("testResult2.do")
	public String testResult2() {
		return "hobby_test/testResult2";
	}
	@GetMapping("testResult3.do")
	public String testResult3() {
		return "hobby_test/testResult3";
	}
}