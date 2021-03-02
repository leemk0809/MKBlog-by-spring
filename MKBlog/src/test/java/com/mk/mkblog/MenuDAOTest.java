package com.mk.mkblog;

import java.util.List;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mk.mkblog.web.menu.dao.MenuDAO;
import com.mk.mkblog.web.menu.model.MenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/root-context.xml", "classpath:spring/dataSource-context.xml"})
public class MenuDAOTest {

	private Logger logger = LoggerFactory.getLogger(MenuDAOTest.class);
	
	@Inject
	private MenuDAO menuDAO;
	
	@Test
	public void testGetMenuList() throws Exception {
		List<MenuVO> menuList = menuDAO.getMenuList();
		
		logger.info("menuListSize : " + menuList.size());
	}
	
	@Test @Ignore 
	public void testInsertMenu() throws Exception {
		MenuVO menuVO = new MenuVO();
		
		menuVO.setCode("board");
		menuVO.setCodename("board");
		menuVO.setSort_num(1);
		menuVO.setComment("normal board");
		menuVO.setReg_id("22");
		
		int result = menuDAO.saveMenu(menuVO);
		
		if(result == 1) {
			logger.info("成功");
		}
	}
}
