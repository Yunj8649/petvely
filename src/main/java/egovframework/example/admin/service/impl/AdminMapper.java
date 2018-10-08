package egovframework.example.admin.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("adminMapper")
public interface AdminMapper {

	List<EgovMap> selectCategoryCnt() throws Exception;

}
