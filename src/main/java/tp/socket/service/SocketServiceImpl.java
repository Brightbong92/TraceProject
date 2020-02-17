package tp.socket.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Message_Store;
import tp.qa.mapper.QAMapper;
import tp.socket.mapper.SocketMapper;
import tp.vo.MentoringQAPagingVo;
import tp.vo.MentoringQAVo;

@Service
public class SocketServiceImpl implements SocketService {

	@Autowired
	SocketMapper socketMapper;

	@Override
	public Mentoring getMentoringInfo(long mtr_seq) {
		Mentoring mtr = socketMapper.selectMentoring(mtr_seq);
		return mtr;
	}

	@Override
	public String getReceiverEmail(long mtr_seq) {
		String mem_email = socketMapper.selectReceiverEmail(mtr_seq);
		return mem_email;
	}
	
	@Override
	public long selectMessageStoreNextSeq() {
		long ms_seq = socketMapper.selectMessageStoreNextSeq();
		return ms_seq;
	}
	
	@Override
	public void insertMessageStoreS(Message_Store msg_store) {
		socketMapper.insertMessageStore(msg_store);
	}

	@Override
	public String getselectMemberNick(String mem_email) {
		String mem_nick = socketMapper.selectMemberNick(mem_email);
		return mem_nick;
	}

	@Override
	public long getselectMessageAlarmCount(String mem_email) {
		long msgAlarmCount = socketMapper.selectMessageAlarmCount(mem_email);
		return msgAlarmCount;
	}


	

}
