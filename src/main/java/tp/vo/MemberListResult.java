package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;
import tp.domain.Mentoring;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberListResult {
	private int currentPage;
	private int totalCount;
	private int pageSize;
	private int totalPageCount;
	private List<Member> member_list;
	private List<MemberVo> vip_list;
	private List<MemberVo> review_list;
	private List<MemberVo> point_list;
	private List<MemberVo> new_list;
	
	public MemberListResult(int currentPage, int totalCount, int pageSize, List<Member> member_list,
				List<MemberVo> vip_list,List<MemberVo> review_list,List<MemberVo> point_list,List<MemberVo> new_list) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.totalPageCount = calTotalPageCount();
		this.member_list = member_list;
		this.vip_list = vip_list;
		this.review_list = review_list;
		this.point_list = point_list;
		this.new_list = new_list;
		
	}
	
	
	public int calTotalPageCount() {
		int tpc = totalCount / pageSize;
		if((totalCount % pageSize) != 0) {
			tpc++;
		}
		return tpc;
	}
}
