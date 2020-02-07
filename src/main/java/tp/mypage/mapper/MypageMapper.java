package tp.mypage.mapper;

import java.util.HashMap;
import java.util.List;

import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Points;
import tp.vo.ActivityVo;

public interface MypageMapper {
	String checkPwd(String mem_email);
	void updateState(String mem_email);
	void insertDisabled(Disabled disabled);
	List<Points> getPoint(String mem_email);
	void updateProfile(HashMap<String,String> map);
	Member selectMember(String mem_email);
	long getMem_point(String mem_email);
	List<ActivityVo> getActivity(String mem_email);
}
