package tp.mentor.mapper;

import java.util.HashMap;
import java.util.List;

import tp.domain.Member;
import tp.domain.Mentor_List;

public interface MentorMapper {
	void mentor_apply(HashMap<String, String> map);
	
	//멘토프로필보기 관련
	Mentor_List selectMentor_List(String mem_email);
	Member selectMentorMemberInfo(String mem_email);
}
