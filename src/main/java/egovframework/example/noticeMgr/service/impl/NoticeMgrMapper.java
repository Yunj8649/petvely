package egovframework.example.noticeMgr.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.notice.service.TAB_NOTICE_VO;
import egovframework.example.noticeMgr.service.NoticeMgrVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("noticeMgrMapper")
public interface NoticeMgrMapper {

	List<EgovMap> selectNoticeList(NoticeMgrVO noticeMgrVO) throws Exception;

	EgovMap selectNoticeListCnt(NoticeMgrVO noticeMgrVO) throws Exception;

	void fnDelNoticeMgr(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> noticeDetailList(TAB_NOTICE_VO vo) throws Exception;

	EgovMap getSelSeqNoData(String param) throws Exception;

	void modifyNoticeDetail(Map<String, Object> paramMap) throws Exception;

}
