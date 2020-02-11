package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartPaymentListResult {
	private List<CartInfo> cartPaymentInfoList;
	private long mem_point;
	private long sumPaymentPrice;
}
