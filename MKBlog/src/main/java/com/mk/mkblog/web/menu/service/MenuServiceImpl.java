package com.mk.mkblog.web.menu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mk.mkblog.web.menu.dao.MenuDAO;
import com.mk.mkblog.web.menu.model.MenuVO;

@Service
public class MenuServiceImpl implements MenuService{

	@Inject
	private MenuDAO menuDAO;
	
	@Override
	public List<MenuVO> getMenuList() throws Exception {
		return menuDAO.getMenuList();
	}

	@Override
	public int saveMenu(MenuVO menuVO) throws Exception {
		return menuDAO.saveMenu(menuVO);
	}

	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		return menuDAO.updateMenu(menuVO);
	}

	@Override
	public int deleteMenu(String code) throws Exception {
		return menuDAO.deleteMenu(code);
	}

}
