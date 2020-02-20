package tp.admin.service;

import java.util.List;

import tp.domain.Member;
import tp.domain.Notice;
import tp.domain.Report;
import tp.vo.MemberInfo;
import tp.vo.MemberListResult;
import tp.vo.MentorListResult;

public interface AdminService {
	MemberListResult getMemberListResult(int cp, int ps);
	MemberListResult getMemberListResultSearch(int cp, int ps, String keyword);
	void insertN(Notice notice);
	MemberInfo getMemberInfo(String mem_email);
	void updateState(String mem_email);
	MentorListResult getMentorListResult(int cp, int ps);
	void mentorApproved(String mem_email);
	void mentorDisapproved(String mem_email);
	void updateAuth(String mem_email);
	List<Report> getMemberReport(String mem_email);
}
