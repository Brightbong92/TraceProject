package tp.login.mapper;

import tp.domain.Member;

public interface LoginMapper {
	public Member selectMember(String mem_email);
	public String selectKakaoMember(String mem_email);
	public int selectEmailUuid(String mem_email);
}
