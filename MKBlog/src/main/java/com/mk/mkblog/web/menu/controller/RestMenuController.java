package com.mk.mkblog.web.menu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mk.mkblog.web.menu.model.MenuVO;
import com.mk.mkblog.web.menu.service.MenuService;

@Controller
@RequestMapping("/restMenu")
public class RestMenuController {
	
	private Logger logger = LoggerFactory.getLogger(RestMenuController.class);
	
	@Inject 
	private MenuService menuService;
	
	@RequestMapping(value="/getMenuList", method=RequestMethod.POST)
	public Map<String, Object> getMenuList() throws Exception{
		Map<String,Object> result = new HashMap<String, Object>();
		
		try {
			result.put("menuList", menuService.getMenuList());
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value="/saveMenu", method=RequestMethod.POST)
	public Map<String, Object> saveMenu(MenuVO menuVO) throws Exception{
		Map<String,Object> result = new HashMap<String, Object>();
		
		try {
			menuService.saveMenu(menuVO);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value="/updateMenu", method=RequestMethod.POST)
	public Map<String, Object> updateMenu(MenuVO menuVO) throws Exception{
		Map<String,Object> result = new HashMap<String, Object>();
		
		try {
			menuService.updateMenu(menuVO);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value="/deleteMenu", method=RequestMethod.POST)
	public Map<String, Object> deleteMenu(@RequestParam("code")String code) throws Exception{
		Map<String,Object> result = new HashMap<String, Object>();
		
		try {
			menuService.deleteMenu(code);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
			logger.info(e.getMessage());
		}
		return result;
	}
}
