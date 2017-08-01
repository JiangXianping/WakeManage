package com.jiang.controller;

import com.jiang.util.GeetestConfig;
import com.jiang.util.GeetestLib;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by jiang on 2017/7/31.
 * 使用Get的方式返回challenge和capthca_id,此方式以实现前后端完全分离的开发模式
 */
@Controller
@RequestMapping("/gt")
public class StartCaptchaController {

    @RequestMapping(value = "/startCaptcha",method = RequestMethod.GET)
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
                GeetestConfig.isnewfailback());

        String resStr = "{}";

        //自定义userid
        String userid = "WakeManage";

        //进行验证预处理
        int gtServerStatus = gtSdk.preProcess(userid);

        //将服务器状态设置到session中
        request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
        //将userid设置到session中
        request.getSession().setAttribute("userid", userid);

        resStr = gtSdk.getResponseStr();

        PrintWriter out = response.getWriter();
        out.println(resStr);

    }
}
