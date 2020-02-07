package tp.payment.service;

import tp.domain.Mentoring;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.vo.MentoringQAVo;
import tp.vo.PaymentCompletePageVo;
import tp.vo.PaymentPageListVo;
import tp.vo.PurchaseVo;

public interface PaymentService {
	PaymentPageListVo getPaymentPageList(long mtr_seq, long[] mtrdi_seqArr, String mem_email);
	PaymentCompletePageVo getPaymentCompletePageList(PurchaseVo purchaseVo);
}
