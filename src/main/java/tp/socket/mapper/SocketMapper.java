package tp.socket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import tp.domain.Mentoring;
import tp.domain.Mentoring_Review;
import tp.domain.Mentoring_Review_File;
import tp.domain.Mentoring_Review_Like;
import tp.domain.Mentoring_Review_Reply;
import tp.vo.MentoringReviewPagingVo;

public interface SocketMapper {
	
	Mentoring selectMentoring(long mtr_seq);
	
}
