package tp.admin.service;

import java.util.List;

import tp.domain.Member;
import tp.domain.Notice;
import tp.vo.MemberInfo;
import tp.vo.MemberListResult;

public interface AdminService {
	MemberListResult getMemberListResult(int cp, int ps);
	void insertN(Notice notice);
	MemberInfo getMemberInfo(String mem_email);
	void updateN(String mem_email);
}
