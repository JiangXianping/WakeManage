/*
package com.jiang.controller;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

*/
/**
 * Created by jiang on 2017/6/19.
 *//*

@Controller
@RequestMapping("/Msg")
public class MsgController {

    @RequestMapping("/registerMsg")
    public String register() throws ApiException {
        String url = "http://gw.api.taobao.com/router/rest";
        String appKey = "24441955";
        String appSecret = "e8b1e802740f85a8c64a3f35fb6bb6b6";
        TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
        AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
        req.setExtend("123456");
        req.setSmsType("normal");
        req.setSmsFreeSignName("维客");                        //申请的签名名称
//		req.setSmsParamString("{\"code\":\"8763\"}");		//发送验证码时的相关配置  变量中的值
        req.setRecNum("17816873653");                        //发送对方的手机号码
        req.setSmsTemplateCode("SMS_71165901");                //申请的模板ID
        AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
        return "SUCCESS";
    }
}
*/
