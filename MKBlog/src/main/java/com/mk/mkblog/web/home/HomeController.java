package com.mk.mkblog.web.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mk.mkblog.web.user.model.UserVO;

@Controller
public class HomeController {
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	String getHome(Model model) throws Exception{
		model.addAttribute("userVO", new UserVO());
		return "login/home";
	}
}
