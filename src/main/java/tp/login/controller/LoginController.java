package tp.login.controller;



import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Email_Auth;
import tp.domain.Member;
import tp.domain.Message_Store;
import tp.join.service.JoinService;
import tp.login.service.LoginService;
import tp.login.service.LoginSet;


@RequestMapping("login/*")
@Controller
@AllArgsConstructor
@Log4j
public class LoginController {
	
	private LoginService service;
	private JoinService jService;

	@GetMapping("login.do")
	public String login() {
		return "login/login_form";
	}
	
	private long getCartCount(String mem_email) {
		long cartCount = service.getMemberCartCount(mem_email);
		return cartCount;
	}
	private long getMessageAlarmCount(String mem_email) {
		long msgAlarmCount = service.getMemberMessageAlarmCount(mem_email);
		return msgAlarmCount; 
	}
	
	@PostMapping("msgCheck.do")
	@ResponseBody
	public List<Message_Store> msgCheckAjax(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String mem_email = m.getMem_email();
		List<Message_Store> msg_store = service.getMemberMessageStore(mem_email);
		long msgAlarmCount = getMessageAlarmCount(mem_email);
		session.setAttribute("msgAlarmCount", msgAlarmCount);
		return msg_store;
	}
	@GetMapping("msgCheckUpdate.do")
	public void msgCheckUpdateAjax(long ms_seq, HttpSession session) {
		service.updateMessageStoreMessageCheck(ms_seq);
		Member m = (Member)session.getAttribute("loginUser"); String mem_email = m.getMem_email();
		long msgAlarmCount = getMessageAlarmCount(mem_email);
		session.setAttribute("msgAlarmCount", msgAlarmCount);
	}
	
	@PostMapping("msgAlarmCheck.do")
	@ResponseBody
	public String msgAlarmCheck(@RequestBody String mem_email, HttpSession session) {
		//log.info("#mem_email: " + mem_email);
		long msgAlarmCount = getMessageAlarmCount(mem_email);
		String msgAlarmCountStr = String.valueOf(msgAlarmCount);
		//log.info("msgAlarmCountStr: " +msgAlarmCountStr);
		session.setAttribute("msgAlarmCount", msgAlarmCount);
		return msgAlarmCountStr;
	}
	
	
	@GetMapping("loginAfterAuth.do")//이메일 인증 후 로그인
	public ModelAndView loginAfterAuth(String mem_email, HttpSession session) {
		Member m = service.getMemberInfo(mem_email);
		ModelAndView mv = new ModelAndView();
		session.setAttribute("loginUser", m);	
		session.setAttribute("cartCount", getCartCount(mem_email));
		session.setAttribute("msgAlarmCount", getMessageAlarmCount(mem_email));
		mv.setViewName("login/email_login_msg");
        return mv;
	}
	
	@PostMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute Member member, HttpServletRequest request) {
		String mem_email = member.getMem_email();
		String mem_pwd = member.getMem_pwd();
		//System.out.println(mem_email+ " " +mem_pwd);
		int result = service.loginCheck(mem_email, mem_pwd);
		ModelAndView mv = new ModelAndView();
		if(result == LoginSet.PASS) {//로그인 성공
			int email_uuid = service.emailAuthCheck(mem_email);
			if(email_uuid != LoginSet.OK_EMAIL_AUTH) {//(이메일인증전)
				Email_Auth email_auth = new Email_Auth(mem_email, email_uuid);
				mv.setViewName("join/joinAuth_form");
				mv.addObject("email_auth", email_auth);
				return mv;
			}else {// (이메일인증후)
				HttpSession session = request.getSession();
				Member m = service.getMemberInfo(mem_email);
				session.setAttribute("loginUser", m);
				session.setAttribute("cartCount", getCartCount(mem_email));
				session.setAttribute("msgAlarmCount", getMessageAlarmCount(mem_email));
				if(m.getMem_state() ==2) {
					session.removeAttribute("loginUser");
					mv.setViewName("login/disabled_msg");
					return mv;
				}else {
					request.setAttribute("result", result);
					mv.setViewName("login/login_msg");
	
			        return mv;
				}
			}

		}else {
			request.setAttribute("result", result);
			mv.setViewName("login/login_msg");
	        return mv;
		}
	}
	@GetMapping("naverLoginCallback.do")
	public String naverLoginCallback() {
		return "login/naverLoginCallback";
	}
	@PostMapping("naverLoginCheck.do")
	public ModelAndView naverLoginCheck(Member member, HttpSession session) {//네아로는 디비저장 안함
		//log.info("#member: " + member);
		//String mem_email = info[0];String mem_nick = info[1];String mem_profile = info[2];String mem_age = info[3];String mem_gender = info[4];
		//log.info("#mem_email: " + mem_email + "#mem_nick: " + mem_nick + "#mem_profile: " + mem_profile +
				//"mem_age: " + mem_age + "mem_gender: " + mem_gender);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login_msgNaver");
		session.setAttribute("loginUser", member);
		session.setAttribute("cartCount", 0);
		session.setAttribute("msgAlarmCount", 0);
		return mv;
	}
	
	
	@PostMapping("kakaoLoginCheck.do")
	public ModelAndView kakaoLoginCheck(String kakao, HttpSession session) {
		//log.info("#kakao: " + kakao);
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(kakao);
		JsonObject jObj = (JsonObject)element;
		ModelAndView mv = new ModelAndView();
		
		//카카오 회원정보
		String mem_email = jObj.getAsJsonObject("kakao_account").get("email").getAsString();
		String mem_nick = jObj.getAsJsonObject("properties").get("nickname").getAsString();
		String mem_profile = jObj.getAsJsonObject("properties").get("profile_image").getAsString();
		
		//log.info("#mem_email: " + mem_email + "#mem_nick: " + mem_nick + "#mem_profile: " + mem_profile);
		//select로직
		boolean exist = service.getKakaoMemberExist(mem_email);
		if(exist) {//존재 할시 true일 경우 - 로그인 시켜주기.
			//log.info("#true");
			Member m = service.getMemberInfo(mem_email);
			m.setMem_nick(mem_nick);
			m.setMem_profile(mem_profile);
			session.setAttribute("loginUser", m);
			session.setAttribute("cartCount", getCartCount(mem_email));
			session.setAttribute("msgAlarmCount", getMessageAlarmCount(mem_email));
			mv.setViewName("login/login_msgKakao");
	        return mv;
		}else {//존재 안할 경우 - 회원가입 후 로그인 시켜주기
			//log.info("#false");
			//log.info("#mem_profile: " + mem_profile);
			String mem_age = "null";
			int mem_gender = 0;
			boolean has_age_range = jObj.getAsJsonObject("kakao_account").get("has_age_range").getAsBoolean();
			if(has_age_range) {
				mem_age = jObj.getAsJsonObject("kakao_account").get("age_range").getAsString();
			}
			boolean has_gender = jObj.getAsJsonObject("kakao_account").get("has_gender").getAsBoolean();
			if(has_gender) {
				String mem_genderStr = jObj.getAsJsonObject("kakao_account").get("gender").getAsString();
				if(mem_genderStr.equals("male")) {
					mem_gender = 1;//남자
				}else {
					mem_gender = 2;//여자
				}
			}
			long ms = System.currentTimeMillis();
			String mem_nickMs = mem_nick+ms;
			Member member = new Member(mem_email, null, mem_nickMs, mem_age, mem_gender, "TraceDefaultProfile.jpg", null, 0, 0, 0);
			jService.insertKakaoMemberS(member);
			Member m = service.getMemberInfo(mem_email);
			m.setMem_nick(mem_nick);
			m.setMem_profile(mem_profile);
			session.setAttribute("loginUser", m);
			session.setAttribute("cartCount", getCartCount(mem_email));
			session.setAttribute("msgAlarmCount", getMessageAlarmCount(mem_email));
			//log.info("#mem_email: " + mem_email + "#mem_nick: " + mem_nick + "#mem_profile: " + mem_profile + "#mem_age: " + mem_age + "#mem_gender: " + mem_gender);
			mv.setViewName("login/login_msgKakao");
			return mv;
		}

	}
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		session.removeAttribute("cartCount");
		session.removeAttribute("msgAlarmCount");
		return "login/logout_msg";
	}
	
}