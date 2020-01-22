package tp.login.service;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import tp.domain.Member;
import tp.login.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginMapper loginMapper;
	
	
	public int loginCheck(String mem_email, String mem_pwd) {
		Member m = loginMapper.getMembers(mem_email);
		
		if(m == null) {
			return LoginSet.NO_ID; // 이메일 없음
		}else {
			String pwdDb = m.getMem_pwd();
			if(pwdDb != null) pwdDb = pwdDb.trim();
			boolean hashPwd = BCrypt.checkpw(mem_pwd, m.getMem_pwd());
			if(hashPwd == false) {
				return LoginSet.NO_PWD; //비밀번호 불일치
			}else {
				return LoginSet.PASS; //로그인 성공
			}	
		}
	}
	public Member getMembersInfo(String mem_email) {
		return loginMapper.getMembers(mem_email);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
