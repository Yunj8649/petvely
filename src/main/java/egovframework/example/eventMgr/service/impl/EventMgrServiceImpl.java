package egovframework.example.eventMgr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.event.service.Event_Paging_VO;
import egovframework.example.event.service.TAB_EVENT_VO;
import egovframework.example.eventMgr.service.EventMgrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("eventMgrService")
public class EventMgrServiceImpl implements EventMgrService{
	@Resource(name = "eventMgrMapper")
	private EventMgrMapper eventMgrMapper;

	@Override
	public List<EgovMap> selectEventMgrList(Event_Paging_VO pagingVo) throws Exception {
		return eventMgrMapper.selectEventMgrList(pagingVo);
	}

	@Override
	public EgovMap selectPagingListCnt(Event_Paging_VO pagingVo) throws Exception {
		return eventMgrMapper.selectPagingListCnt(pagingVo);
	}

	@Override
	public void deleteEventList(String string) throws Exception {
		string = string.replaceAll("\"", "");
		
		eventMgrMapper.deleteEventList(string);
	}

	@Override
	public void reloadEventList(String string) throws Exception {
		string = string.replaceAll("\"", "");
		
		eventMgrMapper.reloadEventList(string);
	}

	@Override
	public void insertEventContent(TAB_EVENT_VO vo) throws Exception {
		vo.setEvCtt(vo.getEvCtt().replace("<img src=\"../", "<img src=\"./"));
		
		eventMgrMapper.insertEventContent(vo);
	}

	@Override
	public List<EgovMap> selectEventListevSeq(String parameter) throws Exception {
		System.out.println("selectEventListevSeq()");
		
		List<EgovMap> result = eventMgrMapper.selectEventListevSeq(parameter);
		
		String chg = result.get(0).getValue(2).toString().replace("<img src=\"./", "<img src=\"../");
		
		result.get(0).setValue(2, chg);
		
		System.out.println("result : " + result);
		
		return result;
	}

	@Override
	public void updateEventContent(TAB_EVENT_VO vo) throws Exception {
		vo.setEvCtt(vo.getEvCtt().replace("<img src=\"../", "<img src=\"./"));
		
		eventMgrMapper.updateEventContent(vo);
	}
	
/*	public boolean fileUpload(TAB_EVENT_VO vo, MultipartHttpServletRequest mRequest) {
		boolean isSuccess	= false;
		
		String uploadPath = "C:/eGovFrameDev-3.6.0-64bit/workspace/petvely/src/main/webapp";
		String uploadPathUser = "/assets/images/event";
		uploadPath += uploadPathUser;
		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Iterator<String> iter = mRequest.getFileNames();

		String uploadFileName = iter.next();
		MultipartFile mFile = mRequest.getFile(uploadFileName);

		String originalFileName = mFile.getOriginalFilename();
		String saveFileName = originalFileName;
		String extName = saveFileName.substring(saveFileName.lastIndexOf(".")+1 );

		if(saveFileName != null && !saveFileName.equals("")) {

			if(new File(uploadPath + "/"+ saveFileName).exists()) {
				saveFileName = saveFileName.substring(0,saveFileName.lastIndexOf(".")) 
						+ "_" + System.currentTimeMillis() + "." + extName;
			}
			
			try {
				System.out.println("원본 파일 이름:" + originalFileName);
				System.out.println("저장 파일 이름:" + saveFileName);
				
				mFile.transferTo(new File(uploadPath + "/" + saveFileName));
				
				String saveImage = "." + uploadPathUser + "/"+ saveFileName;
				
				vo.setEvFle(saveImage);
				
				isSuccess = true;
			} catch (IllegalStateException e) {
				e.printStackTrace();
				isSuccess = false;
			} catch (IOException e) {
				e.printStackTrace();
				isSuccess = false;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return isSuccess;
	}*/
}
