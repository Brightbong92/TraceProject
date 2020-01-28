package tp.notice.mapper;

import java.util.List;
import tp.domain.Notice;
import tp.vo.NoticeVo;

public interface NoticeMapper {
	List<Notice> selectPerPage(NoticeVo noticeVo);
	int selectCount();
	void insertN(Notice notice);
	void updateCnt(long noti_seq);
	Notice selectBySeq(long noti_seq);
	int selectSearchCount(String keyword);
	List<Notice> selectNoticeListSearch(NoticeVo noticeVo);
	Notice selectPreContent(long noti_seq);
	Notice selectNextContent(long noti_seq);
	void deleteN(long noti_seq);
	void updateN(Notice notice);
}