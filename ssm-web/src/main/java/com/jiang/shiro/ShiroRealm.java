package com.jiang.shiro;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

/**
 * Created by jiang on 2017/5/16.
 */
public class ShiroRealm extends AuthorizingRealm {
    /**
     * 验证当前登录的用户
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
            throws AuthenticationException {
        //1.把AuthenticationToken 转换为 UsernamePasswordToken
        UsernamePasswordToken uptoken = (UsernamePasswordToken) token;

        //2.从UsernamePasswordToken中获取username
        String username = uptoken.getUsername();

        //3.调用数据库的方法，从数据库中查询username对应的用户记录
        System.out.print("从数据库中获取username:" + username + "所对应的用户信息");
        //4.若用户不存在，则可以抛出UnknownAccountException
        if ("unknown".equals(username)) {
            throw new UnknownAccountException("用户不存在");
        }

        //5.根据用户信息情况，决定是否需要抛出其他异常
        if ("monster".equals(username)) {
            throw new LockedAccountException("用户被锁定");
        }


        //6.根据用户的情况，来构建AuthenticationInfo对象并返回,通常使用的实现类为:SimpleAuthenticationInfo
        //以下信息是从数据库中获取的
        // 1)：principal：认证的实体信息，可以是username，也可以是数据库对应的用户的实体类信息
        Object principal = username;
        // 2)：credentials：密码
        Object credentials = null;
        if ("admin".equals(username)) {
            credentials = "038bdaf98f2037b31f1e75b5b4c9b26e";
        } else if ("user".equals(username)) {
            credentials = "098d2c478e9c11555ce2823231e02ec1";
        }
        // 3)：realmName ：当前realm对象的name，调用父类的 getName() 方法即可
        String realmName = getName();

        // 4)：盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(username);


        SimpleAuthenticationInfo info = null; //new SimpleAuthenticationInfo(principal,credentials,realmName);
        info = new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);
        return info;
    }

    /**
     * 为当前登录的用户授权
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
       /* String username=(String)principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();*/

        return null;
    }

    public static void main(String[] args) {
        String hashAlgorithmName = "MD5";
        Object credentials = "123";
        Object salt = ByteSource.Util.bytes("");
        int hashIterations = 1024;
        Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
//        Object result = new SimpleHash(hashAlgorithmName,credentials,hashIterations);
        System.out.print(result);
    }

}
