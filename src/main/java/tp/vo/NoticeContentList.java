package tp.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tp.domain.Notice;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeContentList {
	private Notice content_list;
	private Notice pre_content;
	private Notice next_content;
}
