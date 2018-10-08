package egovframework.example.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.user.service.TAB_ACCOUNT_VO;
import egovframework.example.user.service.UserService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource(name = "userMapper")
	private UserMapper userMapper;

	@Override
	public void user_register(TAB_ACCOUNT_VO vo) throws Exception {
		userMapper.user_register(vo);
	}

	@Override
	public List<EgovMap> id_check(String id) throws Exception {
		return userMapper.id_check(id);
	}

	@Override
	public List<EgovMap> user_login(TAB_ACCOUNT_VO vo) throws Exception {
		return userMapper.user_login(vo);
	}

	@Override
	public List<EgovMap> find_idpw(TAB_ACCOUNT_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.find_idpw(vo);
	}

	@Override
	public List<EgovMap> Email(String param) throws Exception{
		// TODO Auto-generated method stub
		return userMapper.Email(param);
	}

	@Override
	public void user_pw(TAB_ACCOUNT_VO vo) throws Exception {
		System.out.println("accEm :: " + vo.getAccEm());
		System.out.println("AccPwNew :: " + vo.getAccPwNew());
		System.out.println("AccPwOld :: " + vo.getAccPwOld());
		System.out.println("SeqNo :: " + vo.getSeqNo());
		
		
		
		userMapper.user_pw(vo);
		
	}
}
