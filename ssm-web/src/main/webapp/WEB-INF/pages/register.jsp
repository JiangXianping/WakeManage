<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>注册</title>
    <script type="text/JavaScript" src="<%=basePath%>resource/jquery/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/style.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">

    <script type="text/javascript" src="<%=basePath%>resource/bootstrap/js/bootstrap.min.js"></script>

</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">IN+</h1>

        </div>
        <h3>欢迎进入+</h3>

        <p>注册进去。在行动中看到它。</p>
        <form class="m-t" role="form" id="user_register_from">
            <div class="form-group">
                <input name="username" id="register_username" class="form-control" placeholder="用户名" onblur="checkName()" required="" value="">
            </div>
            <div class="form-group">
                <input name="password" type="password" class="form-control" id="password" value="" placeholder="密码" required="">
            </div>
            <div class="form-group">
                <input name="repassword" type="password" class="form-control" id="repassword" value="" placeholder="确认密码" onblur="checkPassword()" required="">
                <span id="passwordError" style="color: #cf0300;font-size: 14px;"></span>
                <input name="roleId" type="hidden" value="3">
            </div>
            <%--<label>完成验证：</label>--%>
            <div id="captcha2">
                <%--<p id="wait2" class="show">正在加载验证码......</p>--%>
            </div>
            <div style="height: 20px; width: 100%;">
                <p id="notice" style="display: none; font-size: 12px;color: red; ">请先通过验证</p>
            </div>
            <div class="row" id="msg" style="text-align: center"><font size="1" color="red">${requestScope.msg }</font></div>
            <button type="submit" id="submit" class="btn btn-primary block full-width m-b">注册</button>
            <p class="text-muted text-center"><small>已有账户？</small></p>
            <a class="btn btn-sm btn-white btn-block" href="<%=basePath%>/page/login">登录账户</a>

        </form>
    </div>
</div>

<script src="<%=basePath%>resource/jquery/jquery-2.1.1.min.js"></script>
<!-- 引入 gt.js，既可以使用其中提供的 initGeetest 初始化函数 -->
<script src="<%=basePath%>resource/plugins/js/gt.js"></script>
</body>
<script type="text/javascript">
    var flag;
    function checkName(){
        var name = document.getElementById("register_username").value;
        $.ajax({
            url: "<%=basePath%>user/checkName/"+name,
            type: "get",
            success: function (result) {
                if (result == 1) {
                    alert("用户名已存在，请重新输入");
                }
            }
        })
    }
    function checkPassword(){
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;

        if(password!=repassword){
            document.getElementById("passwordError").innerText="两次密码不一致，请重新输入";
            flag=false;
        }
        if(password==repassword){
            document.getElementById("passwordError").innerText="";
            flag = true;
        }
    }
    $("form").submit(function(){
        if(flag==false) {
            document.getElementById("passwordError").innerText="请验证表单信息";
            return flag;
        }
    });
</script>
<script>
    var handler2 = function (captchaObj) {
        $("#submit").click(function (e) {
            var result = captchaObj.getValidate();
            //没有经过验证
            if (!result) {
                $("#notice").show();
                setTimeout(function () {
                    $("#notice").hide();
                }, 2000);
            } else {
                //验证之后
                $.ajax({
                    url: '<%=basePath%>gt/VerifyLogin',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        username: $('#username').val(),
                        password: $('#password').val(),
                        geetest_challenge: result.geetest_challenge,
                        geetest_validate: result.geetest_validate,
                        geetest_seccode: result.geetest_seccode
                    },
                    success: function (data) {
                        if (data.status === 'success') {
                            $.ajax({
                                url: "<%=basePath%>user/ajaxRegister",
                                type: "POST",
                                data: $('#user_register_from').serialize(),        //将整个表单序列化提交到controller
                                success: function (result) {
                                    if (result == 1) {
                                        window.location = "<%=basePath%>page/login";
                                    } else {
                                        window.location = "<%=basePath%>page/register";
                                    }
                                }
                            });
//
                        } else if (data.status === 'fail') {
                            //验证失败
                            alert("验证失败！");
                            <%--window.location = "<%=basePath%>/page/register";--%>
//                              alert('登录失败');
                        }
                    }
                })
            }
            e.preventDefault();
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha2");
        captchaObj.onReady(function () {
            $("#wait2").hide();
        });
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
    $.ajax({
        url: "<%=basePath%>gt/startCaptcha?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 调用 initGeetest 初始化参数
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "popup", // 产品形式，包括：float，popup
                width: "100%"
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handler2);
        }
    });
</script>
</html>
