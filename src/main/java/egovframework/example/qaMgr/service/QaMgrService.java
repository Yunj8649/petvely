package egovframework.example.qaMgr.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface QaMgrService {

	List<EgovMap> selectEventMgrList(Qa_Paging_Vo pagingVo) throws Exception;

	EgovMap selectPagingListCnt(Qa_Paging_Vo pagingVo) throws Exception;

	List<EgovMap> selectUserChatList(String string) throws Exception;

	void insertMsgtoUser(TAB_QA_VO vo) throws Exception;


}
