package tp.login.service;

import javax.servlet.http.HttpSession;

import tp.vo.MemberVo;

public interface LoginService {
	public boolean loginCheck(MemberVo vo, HttpSession session);
	public MemberVo viewMember(MemberVo vo);  //로그인 정보
	public void logout(HttpSession session);   //로그아웃
}
