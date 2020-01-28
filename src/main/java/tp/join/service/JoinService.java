package tp.join.service;




import tp.domain.Email_Auth;
import tp.domain.Member;

public interface JoinService {
	public void insertKakaoMemberS(Member member);
	public boolean selectCheckEmailS(String mem_email);//회원가입 (아이디중복체크)서비스S
	public boolean selectCheckNickS(String mem_nick);//회원가입 (닉네임중복체크)서비스S
	public void insertTraceMemberS(Member member);//최초 회원가입(인증전)
	public Email_Auth selectEmailAuthS(String mem_email);//이메일 인증
	public void deleteEmailAuthUpdateMember(String mem_email);//이메일 인증
	public void reAuthIssuanceS(String mem_email);
}
