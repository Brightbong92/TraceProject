package tp.login.service;

import javax.servlet.http.HttpSession;

import tp.domain.Email_Auth;
import tp.domain.Member;

public interface LoginService {
	public int loginCheck(String mem_email, String mem_pwd);
	public Member getMemberInfo(String mem_email);  //로그인 정보
	public void logout(HttpSession session);   //로그아웃
	public boolean getKakaoMemberExist(String mem_email);
	public int emailAuthCheck(String mem_email);
}
