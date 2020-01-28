package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberInfo {
	private List<Member> memberInfo;
}
