package tp.review.mapper;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Mentoring_Review;
import tp.domain.Mentoring_Review_File;
import tp.domain.Mentoring_Review_Like;
import tp.domain.Mentoring_Review_Reply;
import tp.review.service.MentoringReviewPath;
import tp.vo.MentoringQAPagingVo;
import tp.vo.MentoringQAVo;
import tp.vo.MentoringReviewPagingVo;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewTests {
	@Autowired
	private ReviewMapper reviewMapper;
	
	
	/*
	@Test
	public void likePlusTest() {
		Mentoring_Review_Like mtr_review_like = new Mentoring_Review_Like("c@naver.com", 16);
		List<Mentoring_Review_Like> mtr_review_like_list = reviewMapper.selectMentoringReviewLike(mtr_review_like);
		if(mtr_review_like_list.size() == 0) {
			reviewMapper.insertMentoringReviewLike(mtr_review_like);
			reviewMapper.updateMentoringReviewLikeCnt(mtr_review_like.getMtrrv_seq());
		}else {
			log.info("넣어져있음");
		}
	}
	*/
	
	/*
	@Test
	public void mentoringReviewRegister() {
		long mtr_seq = 2;
		
		/*
		long mtrrv_seqNextSeq = reviewMapper.selectMentoringReviewSeq();
		
		Mentoring_Review mtr_review = new Mentoring_Review(mtrrv_seqNextSeq, "리뷰내용테스트1", null, 
						5, 0, 2, "b@naver.com");
		reviewMapper.insertMentoringReview(mtr_review);
		*/
		
		
		/*
		 * ArrayList<MultipartFile> mtrrv_file
		for(MultipartFile file : mtrrv_file) {
			String fname = file.getOriginalFilename();
			if(!fname.equals("")) {
				fname = fname.trim();
				saveStore(file, mtrrv_seqNextSeq);
			}
		}
		
		
		
		long mtr_review_jumsu_total = reviewMapper.selectMentoringReviewJumsu(mtr_seq);
		long mtr_review_count = reviewMapper.selectMentoringReviewCount(mtr_seq);
		
		long mtr_jumsu = mtr_review_jumsu_total / mtr_review_count;
		
		//log.info("#mtr_review_jumsu_total: " + mtr_review_jumsu_total);
		//log.info("#mtr_review_count: " + mtr_review_count);
		//log.info("#mtr_jumsu: " + mtr_jumsu);
		Mentoring mtr = new Mentoring();mtr.setMtr_seq(mtr_seq);mtr.setMtr_jumsu(mtr_jumsu);
		reviewMapper.updateMentoringJumsu(mtr);
	}
	

	private String saveStore(MultipartFile f, long mtrrv_seqNextSeq) {
		//log.info("#service saveStore() f: " + f);
		String ofname = f.getOriginalFilename();
		int idx = ofname.lastIndexOf(".");
		String ofheader = ofname.substring(0, idx); 
		String ext = ofname.substring(idx);
		
		//long fsize = f.getSize();
		long ms = System.currentTimeMillis();	
		String fname = ofheader + "_" + ms + ext;
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String saveFileName = sb.toString();
		//log.info("ofname: " + ofname + ", ext: " + ext + ", fsize: " + fsize);
		//log.info("ofname: " + ofname + ", fname: " + fname);
		//log.info("ofname: " + ofname + ", fname: " + saveFileName);
		
		boolean flag = writeFile(f, saveFileName);
		if(flag) {
			long mtrrvf_seqNextSeq = reviewMapper.selectMentoringFileSeq();
			Mentoring_Review_File mtr_review_file = new Mentoring_Review_File(mtrrvf_seqNextSeq, 
					ofname, saveFileName, mtrrv_seqNextSeq);
			reviewMapper.insertMentoringReviewFile(mtr_review_file);
			log.info("파일출력성공");
		}else {
			log.info("파일출력실패");
		}
		return fname;
	}

	private boolean writeFile(MultipartFile f, String saveFileName) {
		//log.info("#service writeFile() f: " + f + ", saveFileName: " + saveFileName);
		
		File rDir = new File(MentoringReviewPath.FILE_STORE);
		if(!rDir.exists()) {
			rDir.mkdirs();
		}
		
		FileOutputStream fos = null;
		try {
			byte data[] = f.getBytes();
			fos = new FileOutputStream(MentoringReviewPath.FILE_STORE + saveFileName);
			fos.write(data);
			fos.flush();
			return true;
		}catch(IOException ie) {
			return false;
		}finally {
			try {
				if(fos != null) fos.close();
			}catch(IOException ie) {
			}
		}
	}
	
	*/
	/*
	@Test
	public void testSubject() {
		long mtr_seq = 2;
		Mentoring mtr = reviewMapper.selectMentoringSubjectEmail(mtr_seq);
		log.info("#str: " + mtr);
	}
	*/
	/*
	@Test
	public void testList() {
		long mtr_seq = 2;
		//long mtrqa_seq = 2;
		long cp = 1;
		long ps = 5;
		List<List<Mentoring_Review_Reply>> mtr_review_reply_list = new ArrayList<List<Mentoring_Review_Reply>>();
		List<List<Mentoring_Review_File>> mtr_review_file_list = new ArrayList<List<Mentoring_Review_File>>();
		
		MentoringReviewPagingVo pagingVo = new MentoringReviewPagingVo(cp,ps,mtr_seq);
		List<Mentoring_Review> mtr_review_list = reviewMapper.selectMentoringReview(pagingVo);
		
		long totalCount = reviewMapper.selectMentoringReviewCount(mtr_seq);
		Mentoring mtr = reviewMapper.selectMentoringSubjectEmail(mtr_seq);
		for(Mentoring_Review list : mtr_review_list) {
			long mtrrv_seq = list.getMtrrv_seq();
			//log.info("#mtrrv_seq: " + mtrrv_seq);
			//long mtrrv_seq = 2;
			List<Mentoring_Review_Reply> mtr_review_reply = reviewMapper.selectMentoringReviewReply(mtrrv_seq); 
			mtr_review_reply_list.add(mtr_review_reply);
			//log.info("#mtr_review_reply_list: " + mtr_review_reply_list);
			List<Mentoring_Review_File> mtr_review_file = reviewMapper.selectMentoringReviewFile(mtrrv_seq);
				if(mtr_review_file.size() == 0) {
					log.info("#size == 0");
				}else {
					log.info("#size != 0");
					mtr_review_file_list.add(mtr_review_file);
				}
			}
		    log.info("#mtr_review_list: " + mtr_review_list);
			log.info("#mtr_review_file_list: " + mtr_review_file_list);
			log.info("#mtr_review_reply_list: " + mtr_review_reply_list);
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
