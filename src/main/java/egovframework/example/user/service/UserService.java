package egovframework.example.user.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface UserService {

	void user_register(TAB_ACCOUNT_VO vo) throws Exception;

	List<EgovMap> id_check(String id) throws Exception;

	List<EgovMap> user_login(TAB_ACCOUNT_VO vo) throws Exception;

	List<EgovMap> find_idpw(TAB_ACCOUNT_VO vo) throws Exception;

	List<EgovMap> Email(String param) throws Exception;

	void user_pw(TAB_ACCOUNT_VO vo) throws Exception;

}
