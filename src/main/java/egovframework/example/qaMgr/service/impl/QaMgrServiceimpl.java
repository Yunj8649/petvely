package egovframework.example.qaMgr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.qaMgr.service.QaMgrService;
import egovframework.example.qaMgr.service.Qa_Paging_Vo;
import egovframework.example.qaMgr.service.TAB_QA_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("qaMgrService")
public class QaMgrServiceimpl implements QaMgrService{
	@Resource(name = "qaMgrMapper")
	private QaMgrMapper qaMgrMapper;
	
	@Override
	public List<EgovMap> selectEventMgrList(Qa_Paging_Vo pagingVo)  throws Exception{
		return qaMgrMapper.selectEventMgrList(pagingVo);
	}

	@Override
	public EgovMap selectPagingListCnt(Qa_Paging_Vo pagingVo)  throws Exception{
		return qaMgrMapper.selectPagingListCnt(pagingVo);
	}

	@Override
	public List<EgovMap> selectUserChatList(String string)  throws Exception{
		return qaMgrMapper.selectUserChatList(string);
	}

	@Override
	public void insertMsgtoUser(TAB_QA_VO vo) throws Exception {
		System.out.println("imple : : " + vo.getQaCtt());
		qaMgrMapper.insertMsgtoUser(vo);
	}

}
