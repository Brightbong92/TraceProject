package tp.join.controller;




import org.mindrot.jbcrypt.BCrypt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Email_Auth;
import tp.domain.Member;
import tp.join.service.JoinService;

@Log4j
@RequestMapping("join/*")
@AllArgsConstructor
@Controller
public class JoinController {
	
	private JoinService jService;
	
	
	@GetMapping("join.do")
	public String join() {
		return "join/join_form";
	}
	
	@GetMapping("checkEmail.do")//이메일 중복체크
	public @ResponseBody String checkEmail(String mem_email) {
		//log.info("#mem_email: " + mem_email);
		mem_email = mem_email.trim();
		boolean flag = jService.selectCheckEmailS(mem_email);
		if(flag) {//true일경우(null일경우)가능
			return "possible";
		}else {//false일경우(null이 아닐경우) 불가능
			return "impossible";
		}
	}
	@GetMapping("checkNick.do")//닉네임 중복체크
	public @ResponseBody String checkNick(String mem_nick) {
		//log.info("#mem_nick: " + mem_nick);
		mem_nick = mem_nick.trim();
		boolean flag = jService.selectCheckNickS(mem_nick);
		if(flag) {
			return "possible";
		}else {
			return "impossible";
		}
	}
	@GetMapping("checkUuid.do")//이메일 인증번호 체크
	public @ResponseBody String checkUuid(String mem_email, int email_uuid) {
		//log.info("#email_uuid: " + email_uuid);
		Email_Auth email_auth = jService.selectEmailAuthS(mem_email);
		
		if(email_auth.getEmail_uuid() == email_uuid) {
			jService.deleteEmailAuthUpdateMember(email_auth.getMem_email());
			return "pass";
		}else {
			return "unPass";
		}
	}
	@GetMapping("reAuthIssuance.do")
	public @ResponseBody String reAuthIssuance(String mem_email) {
		jService.reAuthIssuanceS(mem_email);
		return "issued";
	}
	
	@PostMapping("memberJoin.do")
	public ModelAndView memberJoin(Member member) {
		//log.info("#member: " + member);
		Member m = member;
		m.setMem_email(member.getMem_email().trim());
		m.setMem_pwd(BCrypt.hashpw(member.getMem_pwd().trim(), BCrypt.gensalt(10)));//BCrypt 암호화 셋팅
		m.setMem_nick(member.getMem_nick().trim());
		m.setMem_age(member.getMem_age().trim());
		m.setMem_gender(member.getMem_gender());
		m.setMem_profile("TraceDefaultProfile.jpg");
		m.setMem_point(0);//포인트 0 초기값
		m.setMem_auth(0);// 권한 0(일반회원) 초기값
		m.setMem_state(3);//이메일 인증전 코드 3 --> 인증 후 0으로 update

		jService.insertTraceMemberS(m);//트랜잭션처리
		Email_Auth email_auth = jService.selectEmailAuthS(m.getMem_email());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join/joinAuth_form");
		mv.addObject("email_auth", email_auth);
		mv.addObject("mem_pwd", m.getMem_pwd());
		return mv;
	}
}