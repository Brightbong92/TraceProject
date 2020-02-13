package tp.cart.service;

import java.util.List;

import tp.vo.CartInfo;
import tp.vo.CartListResult;

public interface CartSerivce {
	CartListResult getCart(String mem_email);
	void setCart(String mtrdi_seq, String mtr_seq, String mem_email);
	void deleteCart(String mem_email, String ct_seq);
	long getCartCount(String mem_email);
	void deleteCartAllS(String mem_email);
}
