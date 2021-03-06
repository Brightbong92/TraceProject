package tp.mypage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Payment_Info;
import tp.domain.Points;
import tp.domain.Refund_Info;
import tp.join.service.JoinService;
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
	private JoinService jService;
	
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
	public ModelAndView pastActivity(String mem_email) {
		ActivityListResult pastActivityListResult = service.getPastActivity(mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/pastActivity");
		mv.addObject("pastActivityListResult", pastActivityListResult);
		return mv;
	}
	@GetMapping("openedActivity.do")
	public ModelAndView openedActivity(String mem_email) {
		List<Mentoring> openedActivityListResult = service.getOpenedActivity(mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/openedActivity");
		mv.addObject("openedActivityListResult", openedActivityListResult);
		return mv;
	}
	@GetMapping("myPayment.do")
	public String myPayment(String mem_email) {
		return "mypage/myPayment";
	}
	@GetMapping("myPaymentInfo.do")
	public String myPaymentInfo(String mem_email, Model model) {
		List<Payment_Info> payment_info_list = service.getMyPaymentInfo(mem_email);
		model.addAttribute("payment_info_list", payment_info_list);
		return "mypage/my_payment_list";
	}
	@GetMapping("myRefundInfo.do")
	public String myRefundInfo(String mem_email, Model model) {
		List<Refund_Info> refund_info_list = service.getMyRefundInfo(mem_email);
		model.addAttribute("refund_info_list", refund_info_list);
		return "mypage/my_refund_list";
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
	public String refund(String mem_email) {
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
		File file = new File(MypagePath.FILE_STORE, fname);
		if(file.exists() & !fname.equals("TraceDefaultProfile.jpg")) {
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
	@GetMapping("nickCheck.do")
	@ResponseBody
	public String nickCheck(String mem_nick, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser"); String mem_email = m.getMem_email();
		mem_nick = mem_nick.trim();
		
		boolean nFlag = service.getMyPageNickCheck(mem_nick, mem_email);
		if(nFlag) {
			return "possible";
		}
		
		boolean flag = jService.selectCheckNickS(mem_nick);
		if(flag) {
			return "possible";
		}else {
			return "impossible";
		}
	}
	@PostMapping("myInfoEdit.do")
	@ResponseBody
	public String myInfoEdit(@RequestBody Member member, HttpSession session) {
		//log.info("#member: " + member);
		Member m = (Member)session.getAttribute("loginUser"); 
		String mem_email = m.getMem_email();
		String mem_nick = member.getMem_nick();
		String mem_pwd = BCrypt.hashpw(member.getMem_pwd().trim(), BCrypt.gensalt(10));
		member.setMem_email(mem_email); member.setMem_nick(mem_nick); member.setMem_pwd(mem_pwd);
		service.updateMyPageInfoS(member);
		return "modifyOk";
		
	}
	
}
