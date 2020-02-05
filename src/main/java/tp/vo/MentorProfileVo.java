package tp.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Member;
import tp.domain.Mentor_List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MentorProfileVo {
	Mentor_List mentor_list_info;
	Member mentor_member_info;
}
