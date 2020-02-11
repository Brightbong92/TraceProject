package tp.payment.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import tp.domain.Cart;
import tp.domain.Member;
import tp.domain.Mentoring;
import tp.domain.Mentoring_Detail_Info;
import tp.domain.Mentoring_QA;
import tp.domain.Mentoring_QA_Reply;
import tp.domain.Payment_Detail_Info;
import tp.domain.Payment_Info;
import tp.domain.Points;
import tp.vo.CartInfo;
import tp.vo.CartOrderListVo;
import tp.vo.CartPurchaseVo;
import tp.vo.MentoringQAPagingVo;
import tp.vo.PurchaseVo;

public interface PaymentMapper {
	
	//멘토링view-> 결제화면
	Mentoring selectMentoring(long mtr_seq);
	Mentoring_Detail_Info selectMentoringDetailInfo(long mtrdi_seq);
	Member selectMember(String mem_email);
	
	
	//결제 후 데이터처리
	@Update(value= {"UPDATE MEMBER SET MEM_POINT = MEM_POINT - #{usedPointTot} WHERE MEM_EMAIL = #{mem_email}"})
	void updateMemberUsedPoint(PurchaseVo purchaseVo);
	
	@Insert(value= {"INSERT INTO POINTS VALUES(#{po_content}, #{po_saving}, SYSDATE, #{mem_email})"})
	void insertPointsUsedPoint(Points points);
	
	@Select(value= {"SELECT PAYMENT_INFO_SEQ.nextval FROM DUAL"})
	long selectPaymentInfoSeq();
	//결제 후 포인트는 트리거처리
	@Insert(value= {"INSERT INTO PAYMENT_INFO VALUES (#{pi_seq}, #{pi_pg}, #{pi_method}, #{pi_muid}, #{pi_product}, #{pi_price}, SYSDATE, #{pi_name}, #{pi_phone}, 1, #{mem_email})"})
	void insertPaymentInfo(Payment_Info payment_info);
	@Insert(value= {"INSERT INTO PAYMENT_DETAIL_INFO values(#{mtr_seq}, #{mtrdi_seq}, #{pi_seq})"})
	void insertPaymentDetailInfo(Payment_Detail_Info payment_detail_info);
	
	@Update(value= {"UPDATE MENTORING_DETAIL_INFO SET MTRDI_NOW_PCNT = MTRDI_NOW_PCNT + 1 WHERE MTRDI_SEQ = #{mtrdi_seq}"})
	void updateMentoringDetailInfoNowPeopleCount(long mtrdi_seq);
	
	Payment_Info selectPaymentInfo(long pi_seq);//결제완료화면셋팅위해
	
	//장바구니-->결제화면
	CartInfo selectCartPaymentInfo(Map<String,Object> map);
	
	
	//장바구니에서 결제 후 데이터처리
	
	CartOrderListVo selectCartOrderListVo(long ct_seq);
	
	@Update(value= {"UPDATE MEMBER SET MEM_POINT = MEM_POINT - #{usedPointTot} WHERE MEM_EMAIL = #{mem_email}"})
	void updateMemberUsedPointCart(CartPurchaseVo cartPurchaseVo);
	
	@Select(value= {"SELECT * FROM CART WHERE CT_SEQ = #{ct_seq}"})
	Cart selectCartInfo(long ct_seq);
	
	@Delete(value= {"DELETE FROM CART WHERE CT_SEQ = #{ct_seq}"})
	void deleteCartInfo(long ct_seq);
	
	
	long selectCartCount(String mem_email);
}
