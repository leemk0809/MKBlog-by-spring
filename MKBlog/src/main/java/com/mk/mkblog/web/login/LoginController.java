package com.mk.mkblog.web.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@RequestMapping(value = "/getLoginView", method = RequestMethod.GET)
	public String loginForm(Model model) throws Exception{
		return "/login/login";
	}
}
