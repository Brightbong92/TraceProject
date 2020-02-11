package tp.qa.mapper;


import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.extern.log4j.Log4j;
import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.vo.MentoringQAPagingVo;
import tp.vo.MentoringQAVo;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class QATests {
	@Autowired
	private QAMapper qaMapper;
	/*
	@Test
	public void testSubject() {
		long mtr_seq = 51;
		Mentoring mtr = qaMapper.selectMentoringSubjectEmail(mtr_seq);
		log.info("#str: " + mtr);
	}
	*/
	/*
	@Test
	public void testList() {
		MentoringQAVo mtrqaVo = new MentoringQAVo();
		List<Mentoring_QA_Reply> mtr_qa_reply_list = new ArrayList<Mentoring_QA_Reply>();
		
		long mtr_seq = 2;
		//long mtrqa_seq = 2;
		int cp = 1;
		int ps = 3;
		MentoringQAPagingVo pagingVo = new MentoringQAPagingVo(cp,ps,mtr_seq);
		List<Mentoring_QA> mtr_qa_list = qaMapper.selectMentoringQA(pagingVo);
		
		for(Mentoring_QA list : mtr_qa_list) {
			long mtrqa_seq = list.getMtrqa_seq();
			//log.info("#mtrqa_seq: " + mtrqa_seq);
			Mentoring_QA_Reply mtr_qa_reply = qaMapper.selectMentoringQAReply(mtrqa_seq);
				mtr_qa_reply_list.add(mtr_qa_reply);
			}
			mtrqaVo.setMtr_qa_reply_list(mtr_qa_reply_list);
			mtrqaVo.setMtr_qa_list(mtr_qa_list);
	}
	*/
	/*
	@Test
	public void testRList() {
		long mtrcg_no = 0;
		List<Mentoring> relative_mtr_list = mentoringMapper.selectRelativeMentoring(mtrcg_no);
		log.info("#relative_mtr_list: " + relative_mtr_list);
	}
	/*
	@Test
	public void testList() {
		log.info("#mentoringMapper: " + mentoringMapper.getClass().getName());
		MentoringPagingVo mentoringPagingVo = new MentoringPagingVo(null, 1, 5);
		log.info("#mentoringMapperTests testList(): " + mentoringMapper.selectMentoringListExercise(mentoringPagingVo));
	}
	*/
	/*
	@Test
	public void testMentoringInsert() {
		long mtr_seq = mentoringMapper.selectMentoringNextSeq();
		Mentoring mentoring = new Mentoring(mtr_seq, "제목", "<div>내용</div>입니다", 30000, "홍대/신촌", "원인재로 212", 0, "defaultMentoringImage.jpg", "#테스트#짱", 2, "a@naver.com");
		mentoringMapper.insertMentoring(mentoring);//멘토링 테이블 인서트
		//long mtrdi_seq = mentoringMapper.selectMentoringDetailInfoNextSeq();

		String cal = "";String stime = "";String etime = ""; String maxpcntStr="";
		String[] mtrdi_time = {"2020-01-20 09:00 16:00 22", "2020-01-29 10:00 12:00 10"};
		for(int i = 0; i<=mtrdi_time.length-1; i++) {
			String str = mtrdi_time[i];
			str = str.trim();
			cal = str.substring(0, 10);
			stime = str.substring(11, 16);
			etime = str.substring(17,22);
			
			maxpcntStr = str.substring(23);
			int mtrdi_max_pcnt =  Integer.parseInt(maxpcntStr);
			
			String mtrdi_stime = cal+" "+stime; 
			String mtrdi_etime = cal+" "+etime;
			
			long mtrdi_seq = mentoringMapper.selectMentoringDetailInfoNextSeq();
			//log.info("#mtrdi_seq: " + mtrdi_seq);
			Mentoring_Detail_Info mentoring_detail_info = new Mentoring_Detail_Info(mtrdi_seq, mtrdi_stime, mtrdi_etime, mtrdi_max_pcnt, 0, mtr_seq);
			mentoringMapper.insertMentoringDetailInfo(mentoring_detail_info);

			//System.out.println("시작날짜: " + cal);
			//System.out.println("시작시간: " + stime);
			//System.out.println("종료시간: " + etime);
			//System.out.println("최대인원: " + mtrdi_max_pcnt);
		}
	}
	*/
	/*
	@Test
	public void selectTest() {
		MentoringViewPageVo mvpvo = new MentoringViewPageVo();
		long mtr_seq = 1;
		mvpvo = mentoringMapper.selectMentoringViewPage(mtr_seq);
		
		List<Mentoring_Detail_Info> mtrdi_list = new ArrayList<Mentoring_Detail_Info>();
		
		mtrdi_list = mentoringMapper.selectMentoringDetailInfo(mtr_seq);
		
		mvpvo.setDetailInfoList(mtrdi_list);
		
		log.info("#멘토링세부VO리스트: " + mvpvo);
	}
	*/
	
	
	/*
	@Test
	public void testInsert() {
		Address address = new Address(-1, "오늘은", "금요일", null);
		addressMapper.insert(address);
		log.info("#AddressTests insert(): 수행완료");
	}
	@Test
	public void testDelete() {
		addressMapper.delete(4);
		log.info("#AddressTests delete(): 수행완료");
	}
	*/
}
