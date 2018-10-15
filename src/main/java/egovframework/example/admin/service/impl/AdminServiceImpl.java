package egovframework.example.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.admin.service.AdminService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Resource(name = "adminMapper")
	private AdminMapper adminMapper;
	
	@Override
	public List<EgovMap> selectCategoryCnt() throws Exception {
		return adminMapper.selectCategoryCnt();
	}

}
