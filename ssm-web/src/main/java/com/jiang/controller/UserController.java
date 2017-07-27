package com.jiang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jiang.model.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import com.jiang.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author jiang
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;

    /**
     * 执行登录操作
     * @param user
     * @param request
     * @return
     */
    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})

    public ModelAndView login(User user, HttpServletRequest request, boolean rememberme) {
        logger.info("进入controller:" + user.getUsername() + "\t" + user.getPassword());
//        user.setPassword(EncryptionUtil.Md5Str(user.getPassword()));
        Subject subject = SecurityUtils.getSubject();
        logger.info("是否选中记住我:" + rememberme);
        //subject
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
        //设置remember是否开启
        token.setRememberMe(rememberme);
        ModelAndView m = new ModelAndView();
        try {
            subject.login(token);

            HttpSession session = request.getSession();
            logger.info("用户对象:" + userService.findByName(user.getUsername()));
            session.setAttribute("currUser", userService.findByName(user.getUsername()));
            session.setMaxInactiveInterval(30 * 60 * 1000);
            m.setViewName("redirect:/page/bookList");
        } catch (Exception e) {
            e.printStackTrace();
            m.setViewName("redirect:/page/login");
        }
        return m;
    }

    /**
     * 注销操作
     *
     * @return
     */
    @RequestMapping("/logout")
    public String doLogout(SessionStatus session) {
        session.setComplete();
        Subject subject = SecurityUtils.getSubject();
        subject.logout();

        return "redirect:/page/login";
    }
}
