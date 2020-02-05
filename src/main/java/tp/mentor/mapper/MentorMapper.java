package tp.mentor.mapper;

import java.util.HashMap;

public interface MentorMapper {
	void mentor_apply(HashMap<String, String> map);
	String checkApply(String mem_email);
	String checkCode(String ml_phone);
	void setCode(HashMap<String, Object> code);
	String getCode(String ml_phone);
	void updateCode(HashMap<String, Object> code);
	void removeCode(String ml_phone);
}
