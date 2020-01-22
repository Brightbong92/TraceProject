package tp.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import tp.domain.Member;
import tp.login.mapper.LoginMapper;

//@Service
public class testService implements LoginService{

	private LoginMapper loginMapper;
	/*@Autowired
	BCryptPasswordEncoder BCrypt;*/
	
	public int loginCheck(String mem_email, String mem_pwd) {
		Member m = loginMapper.getMembers(mem_email);
		
		return -1;
	}
	public Member getMembersInfo(String mem_email) {
		return loginMapper.getMembers(mem_email);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
