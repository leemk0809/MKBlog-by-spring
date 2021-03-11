package com.mk.mkblog.web.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mk.mkblog.web.user.model.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<UserVO> getUserList() throws Exception {
		return sqlSession.selectList("com.mk.mkblog.web.user.userMapper.getUserList");
	}

	@Override
	public UserVO getUserInfo(String uid) throws Exception {
		return sqlSession.selectOne("com.mk.mkblog.web.user.userMapper.getUserInfo", uid);
	}

	@Override
	public int insertUser(UserVO userVO) throws Exception {
		return sqlSession.insert("com.mk.mkblog.web.user.userMapper.insertUser", userVO);
	}

	@Override
	public int updateUser(UserVO userVO) throws Exception {
		return sqlSession.update("com.mk.mkblog.web.user.userMapper.updateUser", userVO);
	}

	@Override
	public int deleteUser(String uid) throws Exception {
		return sqlSession.delete("com.mk.mkblog.web.user.userMapper.deleteUser", uid);
	}

}
