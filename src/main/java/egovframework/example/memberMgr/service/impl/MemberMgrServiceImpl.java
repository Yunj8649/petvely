package egovframework.example.memberMgr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.memberMgr.service.MemberMgrService;
import egovframework.example.memberMgr.service.MemberMgrVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("memberMgrService")
public class MemberMgrServiceImpl implements MemberMgrService {

	@Resource(name="memberMgrMapper")
	private MemberMgrMapper memberMgrMapper;
	
	@Override
	public List<EgovMap> selectJqgridList(MemberMgrVO memberMgrVO) throws Exception {
		return memberMgrMapper.selectJqgridList(memberMgrVO);
	}

	@Override
	public EgovMap selectJqgridListCnt(MemberMgrVO memberMgrVO) throws Exception {
		return memberMgrMapper.selectJqgridListCnt(memberMgrVO);
	}

	@Override
	public void ctrlMemGridTx(JSONArray jsonArray) throws Exception {
		int iLength = jsonArray.length();
		
		try {
			for (int i = 0; i < iLength; i++) {
				// JSON 배열로 온 JSON 오브젝트를 뽑아내서
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				System.out.println("jsonOb" + jsonObject);
				
				// JSON 오브젝트를 -> String -> Map에 담아서 mapper로 던짐
				Map<String, Object> paramMap = JsonUtil.JsonToMap(jsonObject.toString());

				if("leave".equals(paramMap.get("ctrlType"))) {
					memberMgrMapper.leaveMember(paramMap);
				}
				else if("restore".equals(paramMap.get("ctrlType"))) {
					memberMgrMapper.restoreMember(paramMap);
				}	
				else if ("advAdmin".equals(paramMap.get("ctrlType"))) {
					paramMap.replace("accGrp", 9);
					memberMgrMapper.advMember(paramMap);
				}
				else if ("advCommonMem".equals(paramMap.get("ctrlType"))) {
					paramMap.replace("accGrp", 0);
					memberMgrMapper.advMember(paramMap);
				}
				else if ("modify".equals(paramMap.get("ctrlType"))) {
					memberMgrMapper.modifyMember(paramMap);
				}
			}
		} catch (Exception e) {
		}
	}

	@Override
	public EgovMap getSelSeqNoData(String param) throws Exception {
		return memberMgrMapper.getSelSeqNoData(param);
	}
}
