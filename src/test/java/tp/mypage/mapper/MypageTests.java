package tp.mypage.mapper;


import static org.junit.Assert.assertNull;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MypageTests {
	
	@Autowired
	private MypageMapper mMapper;
	

	
	/*
	@Test
	public void paymentRefundInfoTest() {
		String mem_email = "b@naver.com";
		List<Payment_Info> pi_list = mMapper.selectMyPaymentInfo(mem_email);
		List<Refund_Info> ri_list = mMapper.selectMyRefundInfo(mem_email);
		log.info("#pi_list: " + pi_list);
		log.info("#ri_list: " + ri_list);
		
	}
	*/
	
	/*
	@Test
	public void getCartPaymentCompletePageList() {
		long[] ctseqList = {2, 3};
		int usedPointTot = 20000;
		int pi_price = 30000;
		String memail = "b@naver.com";
		CartPurchaseVo cartPurchaseVo = new CartPurchaseVo("pi_muid=fourP1581146115823", "자세교정밸런스요가 외 1건","장현봉","01012341234",
				ctseqList,usedPointTot, pi_price, memail);
		long usedPoint = -1*cartPurchaseVo.getUsedPointTot();
		if(usedPoint != 0) {
			pMapper.updateMemberUsedPointCart(cartPurchaseVo);
			Points points = new Points("결제", usedPoint, null, cartPurchaseVo.getMem_email());
			pMapper.insertPointsUsedPoint(points);
		}
		long pi_seq = pMapper.selectPaymentInfoSeq();
		Payment_Info payment_info = new Payment_Info(pi_seq, "이니시스", "카드", cartPurchaseVo.getPi_muid(), cartPurchaseVo.getPi_product(), 
				cartPurchaseVo.getPi_price(), null, cartPurchaseVo.getPi_name(), cartPurchaseVo.getPi_phone(),
				1, -1, cartPurchaseVo.getMem_email());
		pMapper.insertPaymentInfo(payment_info);
		
		long[] ct_seqList = cartPurchaseVo.getCt_seq();
		for(long ct_seq : ct_seqList) {
			Cart cart = pMapper.selectCartInfo(ct_seq);
			long mtr_seq = cart.getMtr_seq(); long mtrdi_seq = cart.getMtrdi_seq();
			Payment_Detail_Info payment_detail_info = new Payment_Detail_Info(mtr_seq, mtrdi_seq, pi_seq);
			pMapper.insertPaymentDetailInfo(payment_detail_info);
			pMapper.updateMentoringDetailInfoNowPeopleCount(mtrdi_seq);
		}
		
		//결제이후 로직
		Payment_Info payment_info2 = pMapper.selectPaymentInfo(pi_seq);
		List<CartOrderListVo> cart_order_list = new ArrayList<CartOrderListVo>();
		for(long ct_seq : ct_seqList) {
			CartOrderListVo vo = pMapper.selectCartOrderListVo(ct_seq);
			cart_order_list.add(vo);
		}
		for(long ct_seq : ct_seqList) {//장바구니에서 결제 한 리스트제거
			pMapper.deleteCartInfo(ct_seq);
		}
		
		CartPaymentCompletePageVo listResult = new CartPaymentCompletePageVo(payment_info2, cart_order_list);
		log.info("#listResult: " + listResult);
	}
	*/
	/*
	@Test
	public void cartPayementList() {
		long[] cartList = {2};
		List<CartInfo> cartInfoList = new ArrayList<CartInfo>();
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i<cartList.length; i++) {
		map.put("mem_email", "b@naver.com"); map.put("ct_seq", cartList[i]);
		CartInfo ctInfo= pMapper.selectCartPaymentInfo(map);
		cartInfoList.add(ctInfo);
		map.clear();
		}
		
		log.info("#cartInfoList: " + cartInfoList);
	}
	*/
	/*
	@Test
	public void purchasInfo() {
		long[] mtrdi_seq = {3, 4};
		PurchaseVo purchaseVo = new PurchaseVo("fourP1581037280849", "자세교정밸런스요가", "장현봉", "01012345678", mtrdi_seq, 9000, 16000, 2, "b@naver.com");
		pMapper.updateMemberUsedPoint(purchaseVo);
		long usedPoint = -1*purchaseVo.getUsedPointTot();
		Points points = new Points("결제", usedPoint, null, purchaseVo.getMem_email());
		pMapper.insertPointsUsedPoint(points);
		long pi_seq = pMapper.selectPaymentInfoSeq();
		Payment_Info payment_info = new Payment_Info(pi_seq, "이니시스", "카드", "fourP1581037280849", "자세교정밸런스요가",16000,
				null, "장현봉", "01012345678", 1, 2, "b@naver.com");
		pMapper.insertPaymentInfo(payment_info);
		long mtr_seq = purchaseVo.getMtr_seq();
			for(int i=0; i<mtrdi_seq.length; i++) {
				Payment_Detail_Info payment_detail_info = new Payment_Detail_Info(mtr_seq, mtrdi_seq[i], pi_seq);
				pMapper.insertPaymentDetailInfo(payment_detail_info);
				pMapper.updateMentoringDetailInfoNowPeopleCount(mtrdi_seq[i]);
		}
			//결제 이후
			Payment_Info payment_info2 = pMapper.selectPaymentInfo(pi_seq);
			List<Mentoring> mtr_list = new ArrayList<Mentoring>();
			Mentoring mtr = pMapper.selectMentoring(purchaseVo.getMtr_seq());
			mtr_list.add(mtr);
			List<Mentoring_Detail_Info> mtrdi_list = new ArrayList<Mentoring_Detail_Info>();
			for(int i = 0; i<mtrdi_seq.length; i++) {
				Mentoring_Detail_Info mtr_detail_info = pMapper.selectMentoringDetailInfo(mtrdi_seq[i]);
				mtrdi_list.add(mtr_detail_info);
			}
			PaymentCompletePageVo listResult = new PaymentCompletePageVo(payment_info2, mtr_list, mtrdi_list);
			log.info("#PaymentCompletePageVo: " + listResult);
	}
	*/
	
	/*
	@Test
	public void getPaymentPageList() {
		long mtr_seq = 2; 
		long[] mtrdi_seqArr = {2, 3};
		String mem_email = "b@naver.com";
		Mentoring mtr = pMapper.selectMentoring(mtr_seq);
		Member m = pMapper.selectMember(mem_email);
		List<Mentoring_Detail_Info> mtrdi_list = new ArrayList<Mentoring_Detail_Info>();
		PaymentPageListVo listResult = new PaymentPageListVo(mtr_seq, mtr.getMtr_subject(),
				mtr.getMtr_profile(), mtr.getMtr_hashtag(), mtr.getMtr_price(), mtrdi_list, m.getMem_point());
		
		if(mtrdi_seqArr.length != 0) {
			for(long mtrdi_seq : mtrdi_seqArr) {
				Mentoring_Detail_Info mtr_di = pMapper.selectMentoringDetailInfo(mtrdi_seq);
				if(mtr_di != null) {
					mtrdi_list.add(mtr_di);
				}
			}
		}
			listResult.setMtrdi_list(mtrdi_list);
			int size = mtrdi_list.size();
			long price = mtr.getMtr_price();
			long total = price * size;
			//log.info("#total: " + total);
			//log.info("#listResult: " + listResult);
	}
	*/
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
