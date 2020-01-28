package tp.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import tp.domain.Mentoring;
import tp.domain.Notice;
import tp.vo.MentoringListResult;
import tp.vo.MentoringPagingVo;
import tp.vo.NoticeContentList;
import tp.vo.NoticeListResult;
import tp.vo.NoticeVo;
import tp.notice.mapper.NoticeMapper;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	private NoticeMapper noticeMapper;
	
	@Override
	public NoticeListResult getNoticeListResult(int page, int pageSize) {
		int totalCount = noticeMapper.selectCount();
		NoticeVo noticeVo = new NoticeVo(null, page, pageSize);
		List<Notice> list = noticeMapper.selectPerPage(noticeVo);
		return new NoticeListResult(page, pageSize, totalCount, list);
	}
	@Override
	public NoticeContentList getNotice(long noti_seq) {
		noticeMapper.updateCnt(noti_seq);
		Notice content_list = noticeMapper.selectBySeq(noti_seq);
		Notice pre_content = noticeMapper.selectPreContent(noti_seq);
		Notice next_content = noticeMapper.selectNextContent(noti_seq);
		return new NoticeContentList(content_list,pre_content,next_content);
	}
	@Override
	public NoticeListResult getNoticeListResultSearch(int page, int pageSize, String keyword) {
		int totalCount = noticeMapper.selectSearchCount(keyword);
		NoticeVo noticeVo = new NoticeVo(keyword, page, pageSize);
		List<Notice> list = noticeMapper.selectNoticeListSearch(noticeVo);
		return new NoticeListResult(page, pageSize, totalCount, list, keyword);
	}
	@Override
	public void deleteN(long noti_seq) {
		noticeMapper.deleteN(noti_seq);
	}
	@Override
	public Notice getNoticeUpdate(long noti_seq) {
		Notice notice = noticeMapper.selectBySeq(noti_seq);
		return notice;
	}
	@Override
	public void updateN(Notice notice) {
		noticeMapper.updateN(notice);
	}
}