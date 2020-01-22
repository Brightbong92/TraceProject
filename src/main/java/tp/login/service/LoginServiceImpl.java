package tp.login.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import tp.login.dao.MemberDao;
import tp.vo.MemberVo;


@Service
public class LoginServiceImpl implements LoginService {
	@Inject
	MemberDao memberDao;
	
	public boolean loginCheck(MemberVo vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo);
		MemberVo vo2 = null;
		if(result)
			vo2 = viewMember(vo);
			session.setAttribute("Email",vo2.getUserEmail());
			session.setAttribute("passward", vo2.getUserPwd());
		return result;
	}

	@Override
	public MemberVo viewMember(MemberVo vo) {
		return memberDao.viewMember(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
