package tp.payment.controller;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;
import tp.domain.Mentoring_Detail_Info;
import tp.payment.service.PaymentService;
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
	
}