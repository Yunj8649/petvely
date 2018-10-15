package egovframework.example.noticeMgr.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.memberMgr.service.impl.MemberMgrMapper;
import egovframework.example.notice.service.TAB_NOTICE_VO;
import egovframework.example.noticeMgr.service.NoticeMgrService;
import egovframework.example.noticeMgr.service.NoticeMgrVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("noticeMgrService")
public class NoticeMgrServiceImpl implements NoticeMgrService {
	@Resource(name="noticeMgrMapper")
	private NoticeMgrMapper noticeMgrMapper;

	@Override
	public List<EgovMap> selectNoticeList(NoticeMgrVO noticeMgrVO) throws Exception {
		return noticeMgrMapper.selectNoticeList(noticeMgrVO);
	}

	@Override
	public void ctrlJqgridTx(JSONArray jsonArray) throws Exception {
		int iLength = jsonArray.length();
		
		try {
			for (int i = 0; i < iLength; i++) {
				
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				
				Map<String, Object> paramMap = JsonUtil.JsonToMap(jsonObject.toString());
				
				if("del".equals(paramMap.get("ctrlType"))) {
					noticeMgrMapper.fnDelNoticeMgr(paramMap);
				} else if("modify".equals(paramMap.get("ctrlType"))) {
					System.out.println("dd");
					noticeMgrMapper.modifyNoticeDetail(paramMap);
				}
			}
		} catch (Exception e) {
		}
	}

	@Override
	public List<EgovMap> noticeDetailList(TAB_NOTICE_VO vo) throws Exception {
		return noticeMgrMapper.noticeDetailList(vo);
	}

	@Override
	public EgovMap getSelSeqNoData(String param) throws Exception {
		return noticeMgrMapper.getSelSeqNoData(param);
	}

	@Override
	public EgovMap selectNoticeListCnt(NoticeMgrVO noticeMgrVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
