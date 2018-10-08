package egovframework.example.bannerMgr.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.bannerMgr.service.BannerMgrVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("bannerMgrMapper")
public interface BannerMgrMapper {

	List<EgovMap> getBannerLocationList() throws Exception;

	List<EgovMap> getBannerTypeList(String banTypeString) throws Exception;

	List<EgovMap> getAllBannerList() throws Exception;
	
	List<EgovMap> selectJqgridList(BannerMgrVO bannerMgrVO) throws Exception;

	EgovMap selectJqgridListCnt(BannerMgrVO bannerMgrVO) throws Exception;

	void setBanMgrRadio(Map<String, Object> resMap) throws Exception;

	void setBanMgrCheckBox(Map<String, Object> resMap) throws Exception;

	void clearRadioCheck(Map<String, Object> resMap) throws Exception;

	void insertBanners(BannerMgrVO bannerMgrVO) throws Exception;
	
}
