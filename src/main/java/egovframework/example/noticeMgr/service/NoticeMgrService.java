package egovframework.example.noticeMgr.service;

import java.util.List;

import org.json.JSONArray;

import egovframework.example.notice.service.TAB_NOTICE_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface NoticeMgrService {

	List<EgovMap> selectNoticeList(NoticeMgrVO noticeMgrVO) throws Exception;

	EgovMap selectNoticeListCnt(NoticeMgrVO noticeMgrVO) throws Exception;

	void ctrlJqgridTx(JSONArray jsonArray) throws Exception;

	List<EgovMap> noticeDetailList(TAB_NOTICE_VO vo) throws Exception;

	EgovMap getSelSeqNoData(String param) throws Exception;

}
