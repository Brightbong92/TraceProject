package tp.mypage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Points;
import tp.mypage.service.MypagePath;
import tp.mypage.service.MypageService;
import tp.vo.ActivityListResult;
import tp.vo.ActivityVo;
import tp.vo.PointInfo;

@RequestMapping("mypage/*")
@Controller
@AllArgsConstructor
@Log4j
public class MypageController {
	private MypageService service;
	 
	@GetMapping("myInfo.do")
	public String myInfo() {
		return "mypage/myInfo";
	}
	@GetMapping("myActivity.do")
	public ModelAndView myActivity(String mem_email) {
		ActivityListResult activityListResult = service.getActivity(mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myActivity");
		mv.addObject("activityListResult", activityListResult);
		return mv;
	}
	@GetMapping("pastActivity.do")
	public String pastActivity() {
		return "mypage/pastActivity";
	}
	@GetMapping("myPayment.do")
	public String myPayment() {
		return "mypage/myPayment";
	}
	@GetMapping("myPoint.do")
	public ModelAndView myPoint(String mem_email) {
		PointInfo pointInfoResult = service.getPoint(mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/myPoint");
		mv.addObject("pointInfoResult", pointInfoResult);
		return mv;
	}
	@GetMapping("refund.do")
	public String refund() {
		return "mypage/refund";
	}
	@GetMapping("disabled.do")
	public String disabled() {
		return "mypage/disabled";
	}
	@RequestMapping("check_pwd.do")
	public @ResponseBody String check_pwd(String mem_email, String mem_pwd) {
		log.info("#mem_email :" + mem_email + "mem_pwd : "+ mem_pwd);
		
		if(mem_email != null) mem_email = mem_email.trim();
		if(mem_pwd != null) mem_pwd = mem_pwd.trim();
		
		boolean flag = service.checkPwd(mem_email, mem_pwd);
		log.info("##flag :" + flag);
		
		if(flag == true) return "correct";
		else return "incorrect";
	}
	@PostMapping("mem_disabled.do")
	public String mem_disabled(Disabled disabled, HttpServletRequest request) {
		service.updateState(disabled.getMem_email());
		service.insertDisabled(disabled);
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "mypage/disabled_msg";
	}
	@PostMapping("changeProfile.do")
	public String loadImg(String mem_email, MultipartFile mem_profile,String fname, HttpServletRequest request) {
		String ofname = mem_profile.getOriginalFilename();
		log.info("#ofname : " + ofname);
		
		File file = new File(MypagePath.FILE_STORE, fname);
		if(file.exists()) {
			file.delete();
		}
		
		if(ofname != null) ofname=ofname.trim();
    	if(ofname.length() !=0 ) {
    		Member member = service.saveImg(mem_email, mem_profile);

        	HttpSession session = request.getSession();
        	session.setAttribute("loginUser", member);
    	}
    	return "mypage/myInfo";
	}
}
