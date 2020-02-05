package tp.mypage.mapper;

import java.util.HashMap;
import java.util.List;

import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Points;

public interface MypageMapper {
	String checkPwd(String mem_email);
	void updateState(String mem_email);
	void insertDisabled(Disabled disabled);
	List<Points> getPoint(String mem_email);
	void updateProfile(HashMap<String,String> map);
	Member selectMember(String mem_email);
}
