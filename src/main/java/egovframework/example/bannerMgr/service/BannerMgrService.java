package egovframework.example.bannerMgr.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface BannerMgrService {

	List<EgovMap> getBannerLocationList() throws Exception;

	List<EgovMap> getBannerTypeList(String banTypeString) throws Exception;

	List<EgovMap> selectJqgridList(BannerMgrVO bannerMgrVO) throws Exception;

	List<EgovMap> getAllBannerList() throws Exception;
	
	EgovMap selectJqgridListCnt(BannerMgrVO bannerMgrVO) throws Exception;

	void setBanMgrRadio(Map<String, Object> resMap) throws Exception;

	void setBanMgrCheckBox(Map<String, Object> resMap) throws Exception;

	void updateBanners(MultipartHttpServletRequest mRequest) throws Exception;

	void insertBanners(MultipartHttpServletRequest mRequest, BannerMgrVO bannerMgrVO) throws Exception;

	void banImageUpload(MultipartHttpServletRequest mRequest, BannerMgrVO bannerMgrVO) throws Exception;

}
