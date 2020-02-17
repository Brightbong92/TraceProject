package tp.login.mapper;

import java.util.List;

import tp.domain.Member;
import tp.domain.Message_Store;

public interface LoginMapper {
	public Member selectMember(String mem_email);
	public String selectKakaoMember(String mem_email);
	public int selectEmailUuid(String mem_email);
	public long selectCartCount(String mem_email);
	public long selectMessageAlarmCount(String mem_email);
	public List<Message_Store> selectMessageStore(String mem_email);
	public void updateMessageStoreMsgCheck(long ms_seq);
}
