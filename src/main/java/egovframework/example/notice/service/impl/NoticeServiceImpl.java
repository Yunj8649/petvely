package egovframework.example.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.notice.service.NoticeService;
import egovframework.example.notice.service.Notice_Paging_VO;
import egovframework.example.notice.service.TAB_NOTICE_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Resource(name = "noticeMapper")
	private NoticeMapper noticeMapper;

	@Override
	public List<EgovMap> noticeDetailList(TAB_NOTICE_VO vo) throws Exception {
		return noticeMapper.noticeDetailList(vo);
	}

	@Override
	public void updateHit(TAB_NOTICE_VO vo) throws Exception {
		noticeMapper.updateHit(vo);
	}

	@Override
	public int selectNoticeHit(TAB_NOTICE_VO vo) throws Exception {
		System.out.println("selectNoticeHit impl");
		return noticeMapper.selectNoticeHit(vo);
	}

	@Override
	public List<EgovMap> selectPagingList(Notice_Paging_VO pagingVo) throws Exception {
		return noticeMapper.selectPagingList(pagingVo);
	}

	@Override
	public EgovMap selectPagingListCnt(Notice_Paging_VO pagingVo) throws Exception {
		return noticeMapper.selectPagingListCnt(pagingVo);
	}

}
