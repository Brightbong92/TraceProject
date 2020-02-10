package tp.mypage.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Payment_Info;
import tp.domain.Points;
import tp.domain.Refund_Info;
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
	List<Payment_Info> selectMyPaymentInfo(String mem_email);
	List<Refund_Info> selectMyRefundInfo(String mem_email);
	String selectMyPageNickCheck(Map<String, Object> map);
	void updateMyPageInfo(Member member);
}
