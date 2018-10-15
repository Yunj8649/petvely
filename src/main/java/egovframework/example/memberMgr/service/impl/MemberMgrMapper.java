package egovframework.example.memberMgr.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.memberMgr.service.MemberMgrVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("memberMgrMapper")
public interface MemberMgrMapper {

	List<EgovMap> selectJqgridList(MemberMgrVO memberMgrVO) throws Exception;

	EgovMap selectJqgridListCnt(MemberMgrVO memberMgrVO) throws Exception;

	void leaveMember(Map<String, Object> paramMap) throws Exception;

	void restoreMember(Map<String, Object> paramMap) throws Exception;
	
	void advMember(Map<String, Object> paramMap) throws Exception;

	EgovMap getSelSeqNoData(String param) throws Exception;

	void modifyMember(Map<String, Object> paramMap) throws Exception;
}
