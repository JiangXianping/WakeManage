package com.jiang.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiang.model.User;
import com.jiang.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 登录
	 * @return 登录成功后返回到相对应页面
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String login(HttpServletRequest request){
		String name = request.getParameter("username");
		User user = userService.findByName(name);
		if(user!=null){
			System.out.println(user.getUsername()+""+user.getPassword());
			return "book/bookList";
		}
		return "bb";
	}
}
