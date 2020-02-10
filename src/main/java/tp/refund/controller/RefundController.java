package tp.refund.controller;



import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("refund/*")
@Controller
public class RefundController {
	
	@PostMapping("paymentRefund.do")
	@ResponseBody
	public void paymentRefund() {
		
	}
}