package egovframework.example.notice.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface NoticeService {
	List<EgovMap> noticeDetailList(TAB_NOTICE_VO vo) throws Exception;

	void updateHit(TAB_NOTICE_VO vo) throws Exception;

	int selectNoticeHit(TAB_NOTICE_VO vo) throws Exception;

	List<EgovMap> selectPagingList(Notice_Paging_VO pagingVo) throws Exception;

	EgovMap selectPagingListCnt(Notice_Paging_VO pagingVo) throws Exception;
}
