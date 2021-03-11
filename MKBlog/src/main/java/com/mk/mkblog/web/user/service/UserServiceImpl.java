package com.mk.mkblog.web.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mk.mkblog.web.user.dao.UserDAO;
import com.mk.mkblog.web.user.model.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Inject 
	private UserDAO userDAO;
	
	@Override
	public List<UserVO> getUserList() throws Exception {
		return userDAO.getUserList();
	}

	@Override
	public UserVO getUserInfo(String uid) throws Exception {
		return userDAO.getUserInfo(uid);
	}

	@Override
	public int insertUser(UserVO userVO) throws Exception {
		return userDAO.insertUser(userVO);
	}

	@Override
	public int updateUser(UserVO userVO) throws Exception {
		return userDAO.updateUser(userVO);
	}

	@Override
	public int deleteUser(String uid) throws Exception {
		return userDAO.deleteUser(uid);
	}

}
