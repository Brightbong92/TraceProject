package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;
import tp.domain.Points;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointInfo {
	private List<Points> pointInfo;
	private long mem_point;
}
