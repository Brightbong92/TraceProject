package tp.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import tp.admin.mapper.AdminMapper;
import tp.domain.Member;
import tp.domain.Mentor_List;
import tp.domain.Notice;
import tp.notice.mapper.NoticeMapper;
import tp.vo.MemberListResult;
import tp.vo.MemberPagingVo;
import tp.vo.MemberVo;
import tp.vo.MentorListResult;
import tp.vo.MentorPagingVo;
import tp.vo.MemberInfo;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {
	private AdminMapper adminMapper;
	   private NoticeMapper noticeMapper;
	   
	   @Override
	   public MemberListResult getMemberListResult(int cp, int ps) {
	      int totalCount = adminMapper.memberCount();
	      MemberPagingVo memberPagingVo = new MemberPagingVo(cp, ps);
	      List<Member> list = adminMapper.memberList(memberPagingVo);
	      List<MemberVo> vip_list = adminMapper.vipMemberList();
	      List<MemberVo> review_list = adminMapper.reviewMemberList();
	      List<MemberVo> point_list = adminMapper.pointMemberList();
	      List<MemberVo> new_list = adminMapper.newMemberList();
	      return new MemberListResult(cp, totalCount, ps, list, vip_list, review_list, point_list, new_list);
	   }
	   @Override
	   public void insertN(Notice notice) {
	      noticeMapper.insertN(notice);
	   }
	   @Override
	   public MemberInfo getMemberInfo(String mem_email) {
	      List<Member> memberInfo = adminMapper.memberInfo(mem_email);
	      return new MemberInfo(memberInfo);
	   }
	   @Override
	   public void updateN(String mem_email) {
	      adminMapper.updateN(mem_email);
	   }
	   @Override
	   public MentorListResult getMentorListResult(int cp, int ps) {
	      int totalCount = adminMapper.mentorCount();
	      MentorPagingVo mentorPagingVo = new MentorPagingVo(cp, ps);
	      List<Mentor_List> list = adminMapper.mentorList(mentorPagingVo);
	      return new MentorListResult(cp, totalCount, ps, list);
	   }
	   @Override
	   public void mentorApprove(String mem_email) {
	      adminMapper.mentorApprove(mem_email);
	   }
}