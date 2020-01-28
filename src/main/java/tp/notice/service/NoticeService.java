package tp.notice.service;

import tp.domain.Notice;
import tp.vo.NoticeContentList;
import tp.vo.NoticeListResult;
	
public interface NoticeService {
	NoticeListResult getNoticeListResult(int page, int pageSize);
	NoticeContentList getNotice(long noti_seq);
	NoticeListResult getNoticeListResultSearch(int page, int pageSize, String keyword);
	void deleteN(long noti_seq);
	Notice getNoticeUpdate(long noti_seq);
	void updateN(Notice notice);
}