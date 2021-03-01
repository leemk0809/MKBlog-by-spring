package com.mk.mkblog.web.menu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mk.mkblog.web.menu.model.MenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MenuVO> getMenuList() throws Exception {
		return sqlSession.selectList("com.mk.mkblog.web.menu.menuMapper.getMenuList");
	}

	@Override
	public int saveMenu(MenuVO menuVO) throws Exception {
		return sqlSession.insert("com.mk.mkblog.web.menu.menuMapper.insertMenu", menuVO);
	}

	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		return sqlSession.update("com.mk.mkblog.web.menu.menuMapper.updateMenu", menuVO);
	}

	@Override
	public int deleteMenu(String code) throws Exception {
		return sqlSession.delete("com.mk.mkblog.web.menu.menuMapper.deleteMenu", code);
	}

}
