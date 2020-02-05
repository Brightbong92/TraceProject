package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Points;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointInfo {
	private List<Points> pointInfo;
	
}
