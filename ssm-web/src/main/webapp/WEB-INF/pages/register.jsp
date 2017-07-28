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

    <script type="text/javascript" src="<%=basePath%>resource/bootstrap/js/bootstrap.js"></script>

</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">IN+</h1>

        </div>
        <h3>欢迎进入+</h3>

        <p>注册进去。在行动中看到它。</p>
        <form class="m-t" role="form" action="<%=basePath%>user/register">
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

            <div class="row" id="msg" style="text-align: center"><font size="1" color="red">${requestScope.msg }</font></div>
            <button type="submit" class="btn btn-primary block full-width m-b">注册</button>

        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>

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
</html>
