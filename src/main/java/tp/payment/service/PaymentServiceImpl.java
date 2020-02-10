package tp.payment.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tp.domain.Cart;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Payment_Detail_Info;
import tp.domain.Payment_Info;
import tp.domain.Points;
import tp.payment.mapper.PaymentMapper;
import tp.qa.mapper.QAMapper;
import tp.vo.CartInfo;
import tp.vo.CartListResult;
import tp.vo.CartOrderListVo;
import tp.vo.CartPaymentCompletePageVo;
import tp.vo.CartPaymentListResult;
import tp.vo.CartPurchaseVo;
import tp.vo.MentoringQAPagingVo;
import tp.vo.MentoringQAVo;
import tp.vo.PaymentCompletePageVo;
import tp.vo.PaymentPageListVo;
import tp.vo.PurchaseVo;

@Service
public class PaymentServiceImpl implements PaymentService {

	
	@Autowired
	PaymentMapper pMapper;
	
	@Override
	public PaymentPageListVo getPaymentPageList(long mtr_seq, long[] mtrdi_seqArr, String mem_email) {
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
		return listResult;
	}

	@Override
	@Transactional
	public PaymentCompletePageVo getPaymentCompletePageList(PurchaseVo purchaseVo) {
		//결제로직
		long usedPoint = -1*purchaseVo.getUsedPointTot();
		if(usedPoint != 0) {
			pMapper.updateMemberUsedPoint(purchaseVo);
			Points points = new Points("결제", usedPoint, null, purchaseVo.getMem_email());
			pMapper.insertPointsUsedPoint(points);
		}
		long pi_seq = pMapper.selectPaymentInfoSeq();
		Payment_Info payment_info = new Payment_Info(pi_seq, "이니시스", "카드", purchaseVo.getPi_muid(), purchaseVo.getMtr_subject(), 
				purchaseVo.getPi_price(), null, purchaseVo.getPi_name(), purchaseVo.getPi_phone(),
				1, purchaseVo.getMtr_seq(), purchaseVo.getMem_email());
		pMapper.insertPaymentInfo(payment_info);
		
		long[] mtrdi_seq = purchaseVo.getMtrdi_seq();
			for(int i=0; i<mtrdi_seq.length; i++) {
				Payment_Detail_Info payment_detail_info = new Payment_Detail_Info(purchaseVo.getMtr_seq(),mtrdi_seq[i], pi_seq);
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
			return new PaymentCompletePageVo(payment_info2, mtr_list, mtrdi_list);
	}

	@Override
	public CartPaymentListResult getCartPaymentList(long[] cartList, String mem_email, long sumPaymentPrice) {
		List<CartInfo> cartInfoList = new ArrayList<CartInfo>();
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i<cartList.length; i++) {
		map.put("mem_email", mem_email); map.put("ct_seq", cartList[i]);
		CartInfo ctInfo= pMapper.selectCartPaymentInfo(map);
		cartInfoList.add(ctInfo);
		map.clear();
		}
		Member m = pMapper.selectMember(mem_email);
		long mem_point = m.getMem_point();
		return new CartPaymentListResult(cartInfoList, mem_point, sumPaymentPrice);
	}

	@Override
	@Transactional
	public CartPaymentCompletePageVo getCartPaymentCompletePageList(CartPurchaseVo cartPurchaseVo) {
		//결제로직
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
		
		return new CartPaymentCompletePageVo(payment_info2, cart_order_list);
	}
	
}
