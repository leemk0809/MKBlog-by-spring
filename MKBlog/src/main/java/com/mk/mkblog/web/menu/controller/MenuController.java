package com.mk.mkblog.web.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mk.mkblog.web.menu.model.MenuVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@RequestMapping(value="/getMenuList", method=RequestMethod.GET)
	public String getMenuList(Model model) throws Exception{
		model.addAttribute("menuVO", new MenuVO());
		return "/menu/menu";
	}
}
