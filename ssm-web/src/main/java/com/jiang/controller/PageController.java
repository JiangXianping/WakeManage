package com.jiang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by jiang on 2017/5/16.
 * 控制页面跳转
 */
@Controller
@RequestMapping("/page")
public class PageController {

    //跳转到addBook.jsp页面
    @RequestMapping("/addBook")
    public String addBook() {
        return "addBook.jsp";
    }

    //跳转到登录页面
    @RequestMapping("/login")
    public String login() {
        return "login.jsp";
    }


}
