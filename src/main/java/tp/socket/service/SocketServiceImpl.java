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
	

}
