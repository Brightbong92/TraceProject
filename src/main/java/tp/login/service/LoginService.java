package tp.login.service;

import javax.servlet.http.HttpSession;

import tp.domain.Member;

public interface LoginService {
	public int loginCheck(String mem_email, String mem_pwd);
	public Member getMembersInfo(String mem_email);  //로그인 정보
	public void logout(HttpSession session);   //로그아웃
}
