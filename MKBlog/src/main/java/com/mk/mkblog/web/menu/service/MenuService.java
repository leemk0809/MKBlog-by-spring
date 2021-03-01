package com.mk.mkblog.web.menu.service;

import java.util.List;

import com.mk.mkblog.web.menu.model.MenuVO;

public interface MenuService {
	public List<MenuVO> getMenuList() throws Exception;
	public int saveMenu(MenuVO menuVO) throws Exception;
	public int updateMenu(MenuVO menuVO) throws Exception;
	public int deleteMenu(String code) throws Exception;
}
