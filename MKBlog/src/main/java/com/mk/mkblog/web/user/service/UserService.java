package com.mk.mkblog.web.user.service;

import java.util.List;

import com.mk.mkblog.web.user.model.UserVO;

public interface UserService {
	public List<UserVO> getUserList() throws Exception;
	public UserVO getUserInfo(String uid) throws Exception;
	public int insertUser(UserVO userVO) throws Exception;
	public int updateUser(UserVO userVO) throws Exception;
	public int deleteUser(String uid) throws Exception;
}
