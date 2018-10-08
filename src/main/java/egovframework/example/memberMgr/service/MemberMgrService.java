package egovframework.example.memberMgr.service;

import java.util.List;

import org.json.JSONArray;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MemberMgrService {

	List<EgovMap> selectJqgridList(MemberMgrVO memberMgrVO) throws Exception;

	EgovMap selectJqgridListCnt(MemberMgrVO memberMgrVO) throws Exception;

	void ctrlMemGridTx(JSONArray jsonArray) throws Exception;

	EgovMap getSelSeqNoData(String param) throws Exception;

}
