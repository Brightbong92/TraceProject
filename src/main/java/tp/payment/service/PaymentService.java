package tp.payment.service;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.vo.CartListResult;
import tp.vo.CartPaymentCompletePageVo;
import tp.vo.CartPaymentListResult;
import tp.vo.CartPurchaseVo;
import tp.vo.MentoringQAVo;
import tp.vo.PaymentCompletePageVo;
import tp.vo.PaymentPageListVo;
import tp.vo.PurchaseVo;

public interface PaymentService {
	PaymentPageListVo getPaymentPageList(long mtr_seq, long[] mtrdi_seqArr, String mem_email);
	PaymentCompletePageVo getPaymentCompletePageList(PurchaseVo purchaseVo);
	CartPaymentListResult getCartPaymentList(long[] cartList, String mem_email, long sumPaymentPrice);
	CartPaymentCompletePageVo getCartPaymentCompletePageList(CartPurchaseVo cartPurchaseVo);
}
