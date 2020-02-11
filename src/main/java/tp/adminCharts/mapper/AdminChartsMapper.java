package tp.adminCharts.mapper;

public interface AdminChartsMapper {
	int chartCount1();//회원 증가수
	int chartCount2();
	int chartCount3();
	int chartCount4();
	int chartCount5();
	int chartCount6();
	int chartCount7();
	
	int menCount();//남녀 성비
	int womenCount();
	
	//카테고리 별 멘토링 수
	int sportMTRCG();
	int musicMTRCG();
	int craftsMTRCG();
	int cookMTRCG();
	int pictureMTRCG();
	int beautyMTRCG();
	int bevMTRCG();
	
	//차트페이지 상단 카운팅
	int memberCount();
	int mentoringCount();
	int mentoCount();
	
	//멤버 나이대별 카운팅
	
	int memAge1519();
	int memAge2029();
	int memAge3039();
	int memAge4049();
	int memAge5059();
	int memAge6069();
	int memAge7079();
	int memAge8089();
	int memAge9099();
	//정지 및 탈퇴자 카운팅
	int dis_reson1();
	int dis_reson2();
	int dis_reson3();
	int dis_reson4();
	int dis_reson5();
	int dis_reson6();
} 

