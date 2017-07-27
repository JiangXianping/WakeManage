package com.jiang.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通用的返回的类
 * Created by jiang on 2017/7/26.
 */
public class MsgUtil {
    //状态码 100-成功   200-失败
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String,Object>();

    public static MsgUtil success(){
        MsgUtil msgUtil = new MsgUtil();
        msgUtil.setCode(100);
        msgUtil.setMsg("处理成功");
        return msgUtil;
    }
    public static MsgUtil fail(){
        MsgUtil msgUtil = new MsgUtil();
        msgUtil.setCode(200);
        msgUtil.setMsg("处理失败");
        return msgUtil;
    }

    public MsgUtil add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
