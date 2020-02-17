package tp.cart.mapper;

import java.util.HashMap;
import java.util.List;

import tp.vo.CartInfo;
import tp.vo.CartListResult;

public interface CartMapper {
	List<CartInfo> getCart(String mem_email);
	void setCart(HashMap<String, String> map);
	void deleteCart(HashMap<String, String> map);
	long selectCartCount(String mem_email);
	void deleteCartAll(String mem_email);
}
