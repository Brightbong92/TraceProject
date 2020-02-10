package tp.payment.controller;



import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.log4j.Log4j;
import tp.domain.Member;
import tp.payment.service.PaymentService;
import tp.vo.CartPaymentCompletePageVo;
import tp.vo.CartPaymentListResult;
import tp.vo.CartPurchaseVo;
import tp.vo.PaymentCompletePageVo;
import tp.vo.PaymentPageListVo;
import tp.vo.PurchaseVo;

@Log4j
@RequestMapping("payment/*")
@Controller
public class PaymentController {
	
	@Autowired
	PaymentService pService;
	
	@GetMapping("paymentList.do")
	public ModelAndView paymentList(long mtr_seq, long[] mtrdi_seqArr, String mem_email) {
		PaymentPageListVo listResult = pService.getPaymentPageList(mtr_seq, mtrdi_seqArr, mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("payment/payment_page_list");
		mv.addObject("listResult", listResult);
		return mv;
	}
	
	@PostMapping("purchaseInfo.do")
	public ModelAndView purchaseInfo(PurchaseVo purchaseVo) {
		PaymentCompletePageVo listResult = pService.getPaymentCompletePageList(purchaseVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("payment/payment_complete_page");
		mv.addObject("listResult", listResult);
		mv.addObject("usedPointTot", purchaseVo.getUsedPointTot());
		return mv;
	}
	
	@PostMapping("cartListPaymentList.do")
	public ModelAndView cartListPayementList(long[] cartList, long sumPaymentPrice, HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		String mem_email = member.getMem_email();
		CartPaymentListResult listResult = pService.getCartPaymentList(cartList, mem_email, sumPaymentPrice);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("payment/cart_payment_page_list");
		mv.addObject("listResult", listResult);
		mv.addObject("cartList", cartList);
		return mv;
	}
	@PostMapping("cartPurchaseInfo.do")
	public ModelAndView CartListPaymentComplete(CartPurchaseVo cartPurchaseVo) {
		CartPaymentCompletePageVo listResult = pService.getCartPaymentCompletePageList(cartPurchaseVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("payment/cart_payment_complete_page");
		mv.addObject("listResult", listResult);
		mv.addObject("cartPurchaseVo", cartPurchaseVo);
		return mv;
	}
	
}