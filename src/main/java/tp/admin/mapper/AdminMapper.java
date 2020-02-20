package tp.admin.mapper;

import java.util.List;

import tp.domain.Disabled;
import tp.domain.Member;
import tp.domain.Mentor_List;
import tp.domain.Report;
import tp.vo.MemberPagingVo;
import tp.vo.MemberVo;
import tp.vo.MentorPagingVo;

public interface AdminMapper {
   int memberCount();
   int memberSearchCount(String keyword);
   List<Member> memberList(MemberPagingVo memberpagingVo);
   List<Member> memberSearchList(MemberPagingVo memberpagingVo);
   List<MemberVo> vipMemberList();
   List<MemberVo> reviewMemberList();
   List<MemberVo> pointMemberList();
   List<MemberVo> newMemberList();
   
   List<Member> memberInfo(String mem_email);
   List<Disabled> disInfo(String mem_email);
   void updateState(String mem_email);
   void updateAuth(String mem_email);
   
   void insertDisabled(String mem_email);
   
   int mentorCount();
   List<Mentor_List> mentorList(MentorPagingVo mentorpaingVo);
   void mentorApproved(String mem_email);
   void mentorDisapproved(String mem_email);
   
   List<Report> selectMemberReport(String mem_email);
}