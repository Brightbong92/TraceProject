package tp.notice.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping("notice/*")
@Controller
public class NoticeController {
	
	@GetMapping("list.do")
	public String hobbyHome() {
		return "notice/notice_list";
	}
}