package tp.socket.service;

import org.springframework.stereotype.Service;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.vo.MentoringQAVo;

@Service
public interface SocketService {
	Mentoring getMentoringInfo(long mtr_seq);
	
}
