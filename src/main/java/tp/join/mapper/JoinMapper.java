package tp.join.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;

import tp.domain.Email_Auth;
import tp.domain.Member;

public interface JoinMapper {
	public void insertKakaoMember(Member member);//카카오로그인 회원가입
	
	//회원가입(이메일 인증전)트랜잭션
	@Insert(value = {"insert into EMAIL_AUTH values (#{mem_email}, #{email_uuid})"})
	public void insertEmailAuth(HashMap<String, Object> map);
	@Insert(value = { "insert into MEMBER values(#{mem_email}, #{mem_pwd}, #{mem_nick}, #{mem_age}, #{mem_gender} ,#{mem_profile}, SYSDATE, #{mem_point}, #{mem_auth}, #{mem_state})" })
	public void insertTraceMember(Member member);
	

	public String selectCheckEmail(String mem_email);//회원가입 (아이디중복체크)
	//public String selectCheckEmail(HashMap<String, Object> map);//회원가입 (아이디중복체크)
	public String selectCheckNick(String mem_nick);//회원가입 (닉네임중복체크)
	
	//회원가입 (이메일 인증후) 트랜잭션
	@Insert(value = {"update MEMBER set MEM_STATE = 0 where MEM_EMAIL like #{mem_email}"})
	public void updateMemberState(String mem_email);//회원가입 인증
	@Insert(value = {"delete from EMAIL_AUTH where MEM_EMAIL = #{mem_email}"})
	public void deleteEmailAuth(String mem_email);//이메일 인증
	public Email_Auth selectEmailAuth(String mem_email);//이메일 인증

	
}