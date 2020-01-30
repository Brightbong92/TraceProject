package tp.mentor.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Mentor_List;
import tp.mentor.service.MentorService;


@Log4j
@RequestMapping("/mentor/*")
@Controller
@AllArgsConstructor
public class MentorController {
	private MentorService service;
	
	@GetMapping("mentor_apply.do")
	public String mentorApply() {
		return "mentor/mentor_apply";
	}
	
	@GetMapping("popup.do")
	public String mentorProfilePopup() {
		return "mentor/mentor_profile_popup";
	}
	@PostMapping("apply.do")
	public String apply(Model model, @RequestParam String mem_email, @RequestParam String ml_name, @RequestParam String ml_phone,@RequestParam String ml_yourself,@RequestParam String mtrcg_no,@RequestParam MultipartFile ml_ofname) {
		String ofname = ml_ofname.getOriginalFilename();
		log.info("#model : " + model);
		if(ofname != null) ofname=ofname.trim();
    	if(ofname.length() !=0 ) {
    		service.saveStore(mem_email,ml_name,ml_phone,ml_yourself,mtrcg_no,ml_ofname);
    	}
		return "index/index";
	}
}