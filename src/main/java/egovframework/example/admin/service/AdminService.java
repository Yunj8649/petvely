package egovframework.example.admin.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface AdminService {

	List<EgovMap> selectCategoryCnt() throws Exception;

}
