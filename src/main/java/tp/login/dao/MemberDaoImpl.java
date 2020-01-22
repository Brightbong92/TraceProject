package tp.login.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import tp.vo.MemberVo;


@Repository
public class MemberDaoImpl implements MemberDao {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberVo vo) {
		System.out.println("vo : "+ vo);
		String email = sqlSession.selectOne("member.loginCheck",vo);
		return (email == null) ? false: true;
	}

	@Override
	public MemberVo viewMember(MemberVo vo) {
		return sqlSession.selectOne("member.viewMember",vo);
	}

	@Override
	public void logout(HttpSession session) {

	}

}
