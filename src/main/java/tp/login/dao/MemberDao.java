package tp.login.dao;

import javax.servlet.http.HttpSession;

import tp.vo.MemberVo;

public interface MemberDao {
	public default boolean loginCheck(MemberVo vo) {
		// TODO Auto-generated method stub
		return false;
	}
	public MemberVo viewMember(MemberVo vo);
	public void logout(HttpSession session);
}
