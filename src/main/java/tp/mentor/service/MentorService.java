package tp.mentor.service;

import org.springframework.web.multipart.MultipartFile;

import tp.domain.Mentor_List;
import tp.vo.MentorProfileVo;

public interface MentorService {
	void saveStore(String mem_email,String ml_name,String ml_phone,String ml_yourself,String mtrcg_no,MultipartFile f);
	boolean writeFile(MultipartFile f, String saveFileName);
	boolean checkApply(String mem_email);
	void setCode(String receiver, int rand);
	String getCode(String receiver);
	void removeCode(String receiver);
	MentorProfileVo selectMentorProfile(String mem_email);
}
