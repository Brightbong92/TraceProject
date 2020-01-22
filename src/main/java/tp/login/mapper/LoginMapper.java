package tp.login.mapper;

import tp.domain.Member;

public interface LoginMapper {
	public Member getMembers(String mem_email);
}
