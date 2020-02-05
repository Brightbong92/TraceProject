package tp.mypage.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import tp.domain.Disabled;
import tp.domain.Member;
import tp.vo.PointInfo;

public interface MypageService {
	boolean checkPwd(String mem_email, String mem_pwd);
	void updateState(String mem_email);
	void insertDisabled(Disabled disabled);
	PointInfo getPoint(String mem_email);
	Member saveImg(String mem_email, MultipartFile f);
	boolean writeFile(MultipartFile f, String saveFileName);
}
