package tp.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.cart.service.CartServiceImpl;
import tp.vo.CartInfo;
import tp.vo.CartListResult;

@Controller
@RequestMapping("cart/*")
@Log4j
@AllArgsConstructor
public class CartController {
	private CartServiceImpl service;
	
	@GetMapping("cart.do")
	public ModelAndView cart(String mem_email) {
		mem_email = mem_email.trim();
		CartListResult cartListResult = service.getCart(mem_email);
		return new ModelAndView("cart/cart","cartListResult", cartListResult);
	}
	
	@GetMapping("setCart.do")
	@ResponseBody
	public String setCart(String[] optionList,String mtr_seq, String mem_email, HttpSession session) {
		mem_email = mem_email.trim();
		mtr_seq = mtr_seq.trim();
		for (String mtrdi_seq : optionList) {
			service.setCart(mtrdi_seq, mtr_seq, mem_email);
		}
		long cartCount = service.getCartCount(mem_email);
		session.setAttribute("cartCount", cartCount);
		String cartCnt = Long.toString(cartCount);
		return cartCnt;
	}
	
	@GetMapping("deleteCart.do")
	public String deleteCart(String mem_email, String ct_seq, HttpSession session) {
		mem_email = mem_email.trim();
		ct_seq = ct_seq.trim();
		//log.info("#ct_seq : " + ct_seq);
		service.deleteCart(mem_email, ct_seq);
		long cartCount = service.getCartCount(mem_email);
		//session.removeAttribute("cartCount");
		session.setAttribute("cartCount", cartCount);
		return "redirect:../cart/cart.do?mem_email="+mem_email;
	}
	@RequestMapping(value="deleteCartAll.do", method=RequestMethod.GET)
	public String deleteCartAll(String mem_email, HttpSession session) {
		//log.info("#mem_email : " + mem_email);
		service.deleteCartAllS(mem_email);
		long cartCount = service.getCartCount(mem_email);
		session.setAttribute("cartCount", cartCount);
		return "cart/cart_del_all_msg";
	}
}
