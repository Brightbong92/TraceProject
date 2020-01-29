package tp.mentor.service;

import org.springframework.web.multipart.MultipartFile;

import tp.domain.Mentor_List;

public interface MentorService {
	void saveStore(String mem_email,String ml_name,String ml_phone,String ml_yourself,String mtrcg_no,MultipartFile f);
	boolean writeFile(MultipartFile f, String saveFileName);
}
