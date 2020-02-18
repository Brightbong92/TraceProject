package tp.socket.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;


import tp.domain.Mentoring;

import tp.domain.Message_Store;


public interface SocketMapper {
	
	Mentoring selectMentoring(long mtr_seq);
	String selectReceiverEmail(long mtr_seq);
	
	@Select(value= {"SELECT MESSAGE_STORE_SEQ.nextval FROM DUAL"})
	long selectMessageStoreNextSeq();
	
	@Insert(value={"INSERT INTO MESSAGE_STORE VALUES (#{ms_seq}, #{ms_caller}, #{ms_receiver}, #{ms_content}, SYSDATE, 0)"})
	void insertMessageStore(Message_Store msg_store);
	String selectMemberNick(String mem_email);
	
	long selectMessageAlarmCount(String mem_email);
	
}
