package com.jiang.util;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * 加密工具类
 *
 * @author jiang
 */
public class EncryptionUtil {


    /**
     * base64加密
     *
     * @param str
     * @return
     */
    public static String encBase64(String str) {
        return Base64.encodeToString(str.getBytes());
    }

    /**
     * base64解密
     *
     * @param str
     * @return
     */
    public static String decBase64(String str) {
        return Base64.decodeToString(str);
    }

    /**
     * Md5加密
     *
     * @param str
     * @param salt
     * @return
     */
    public static String md5(String str, String salt) {
        return new Md5Hash(str, salt).toString();
    }


    /**
     * 采用自定义盐值进行MD5加密
     *
     * @param str 要加密的数据
     * @return 成功返回就加密后的数据，失败返回null
     */
    public static String Md5Str(String str) {
        PropertiesUtil propertiesUtil;
        try {
            //密码加密验证
            propertiesUtil = new PropertiesUtil("project.properties");
            String salt = propertiesUtil.getValue("salt");
            return EncryptionUtil.md5(str, salt);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }

    public static void main(String[] args) {
        System.out.println(EncryptionUtil.md5("zzzzzzzz", "echo"));
    }

}
