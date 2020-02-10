package tp.mypage.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Payment_Info;
import tp.domain.Refund_Info;
import tp.vo.ActivityListResult;
import tp.vo.ActivityVo;
import tp.vo.PointInfo;

public interface MypageService {
	boolean checkPwd(String mem_email, String mem_pwd);
	void updateState(String mem_email);
	void insertDisabled(Disabled disabled);
	PointInfo getPoint(String mem_email);
	Member saveImg(String mem_email, MultipartFile f);
	boolean writeFile(MultipartFile f, String saveFileName);
	ActivityListResult getActivity(String mem_email);
	List<Payment_Info> getMyPaymentInfo(String mem_email);
	List<Refund_Info> getMyRefundInfo(String mem_email);
	boolean getMyPageNickCheck(String mem_nick, String mem_email);
	void updateMyPageInfoS(Member member);
}
