package tp.admin.mapper;

import java.util.List;

import tp.domain.Member;
import tp.vo.MemberPagingVo;
import tp.vo.MemberVo;

public interface AdminMapper {
	int memberCount();
	List<Member> memberList(MemberPagingVo memberpaingVo);
	List<MemberVo> vipMemberList();
	List<MemberVo> reviewMemberList();
	List<MemberVo> pointMemberList();
	List<MemberVo> newMemberList();
	
	List<Member> memberInfo(String mem_email);
	void updateN(String mem_email);
}
