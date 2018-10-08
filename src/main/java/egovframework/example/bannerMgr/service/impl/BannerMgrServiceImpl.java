package egovframework.example.bannerMgr.service.impl;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.bannerMgr.service.BannerMgrService;
import egovframework.example.bannerMgr.service.BannerMgrVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("bannerMgrService")
public class BannerMgrServiceImpl implements BannerMgrService {
	@Resource(name = "bannerMgrMapper")
	private BannerMgrMapper bannerMgrMapper;
	
	@Override
	public List<EgovMap> getBannerLocationList() throws Exception {
		return bannerMgrMapper.getBannerLocationList();
	}

	@Override
	public List<EgovMap> getBannerTypeList(String banTypeString) throws Exception {
		return bannerMgrMapper.getBannerTypeList(banTypeString);
	}

	@Override
	public List<EgovMap> selectJqgridList(BannerMgrVO bannerMgrVO) throws Exception {
		return bannerMgrMapper.selectJqgridList(bannerMgrVO);
	}

	@Override
	public EgovMap selectJqgridListCnt(BannerMgrVO bannerMgrVO) throws Exception {
		return bannerMgrMapper.selectJqgridListCnt(bannerMgrVO);
	}

	@Override
	public void setBanMgrRadio(Map<String, Object> resMap) throws Exception {
		bannerMgrMapper.clearRadioCheck(resMap);
		bannerMgrMapper.setBanMgrRadio(resMap);
	}

	@Override
	public void setBanMgrCheckBox(Map<String, Object> resMap) throws Exception {
		bannerMgrMapper.setBanMgrCheckBox(resMap);
	}

	@Override
	public void banImageUpload(MultipartHttpServletRequest mRequest, BannerMgrVO bannerMgrVO) throws Exception {
		// 주소 기준 webapp
		// 프론트단에 띄워야 할 주소 ./assets/images/banner/~~~.jpg.png...etc
		
		// if 신규 + 파일 업로드
		String uploadPath = "C:/eGovFrameDev-3.6.0-64bit/workspace/petvely/src/main/webapp";
		String uploadPathUser = "/assets/images/banner";
		uploadPath += uploadPathUser;
		
		Iterator<String> iter = mRequest.getFileNames();
		
		MultipartFile multiPartFile = mRequest.getFile(iter.next());
		
		String uploadFileName = multiPartFile.getOriginalFilename();
		
		// 풀경로
		// System.out.println(uploadPath + "/" + uploadFileName);
		
		multiPartFile.transferTo(new File(uploadPath + "/" 
								+ uploadFileName));
		
		String imageSaveSrc = "." + uploadPathUser + "/" + uploadFileName;
		
		// System.out.println(imageSaveSrc);
		
		// banImg1Src
		bannerMgrVO.setBanImg1Src(imageSaveSrc);
	}

	@Override
	public void updateBanners(MultipartHttpServletRequest mRequest) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBanners(MultipartHttpServletRequest mRequest, BannerMgrVO bannerMgrVO) throws Exception {
		// 파일 업로드
		banImageUpload(mRequest,bannerMgrVO);
		
		System.out.println( "vo : " + ToStringBuilder.reflectionToString(bannerMgrVO) );
		
		bannerMgrMapper.insertBanners(bannerMgrVO);
	}

	@Override
	public List<EgovMap> getAllBannerList() throws Exception {
		return bannerMgrMapper.getAllBannerList();
	}

}
