package tp.cart.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import tp.cart.mapper.CartMapper;
import tp.vo.CartInfo;
import tp.vo.CartListResult;

@Service
@AllArgsConstructor
public class CartServiceImpl implements CartSerivce {
	private CartMapper cartMapper;
	
	@Override
	public CartListResult getCart(String mem_email) {
		List<CartInfo> cartInfo = cartMapper.getCart(mem_email);
		return new CartListResult(cartInfo);
	}
	
	@Override
	public void setCart(String mtrdi_seq, String mtr_seq, String mem_email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("mtrdi_seq", mtrdi_seq);
		map.put("mtr_seq", mtr_seq);
		map.put("mem_email", mem_email);
		cartMapper.setCart(map);
	}
	
	@Override
	public void deleteCart(String mem_email, String ct_seq) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("mem_email", mem_email);
		map.put("ct_seq", ct_seq);
		cartMapper.deleteCart(map);
	}
}
