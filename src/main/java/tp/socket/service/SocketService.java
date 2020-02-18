package tp.socket.service;


import tp.domain.Mentoring;
import tp.domain.Message_Store;


public interface SocketService {
	Mentoring getMentoringInfo(long mtr_seq);
	String getReceiverEmail(long mtr_seq);
	long selectMessageStoreNextSeq();
	void insertMessageStoreS(Message_Store msg_store);
	String getselectMemberNick(String mem_email);
	long getselectMessageAlarmCount(String mem_email);
}