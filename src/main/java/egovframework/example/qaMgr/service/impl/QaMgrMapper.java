package egovframework.example.qaMgr.service.impl;

import java.util.List;

import egovframework.example.qaMgr.service.Qa_Paging_Vo;
import egovframework.example.qaMgr.service.TAB_QA_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("qaMgrMapper")
public interface QaMgrMapper {

	List<EgovMap> selectEventMgrList(Qa_Paging_Vo pagingVo) throws Exception;

	EgovMap selectPagingListCnt(Qa_Paging_Vo pagingVo) throws Exception;

	List<EgovMap> selectUserChatList(String string) throws Exception;

	void insertMsgtoUser(TAB_QA_VO vo) throws Exception;

	
}
