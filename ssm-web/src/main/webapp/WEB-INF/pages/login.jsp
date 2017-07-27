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

    <title>登录</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script type="text/JavaScript" src="<%=basePath%>resource/jquery//jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/style.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/fontawesome-webfont.svg">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/FontAwesome.otf">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap.js">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">IN+</h1>

            </div>
            <h3>欢迎进入+</h3>
            <p>完美的设计和精确的管理主题与超过50页的新的网络应用程序视图。
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <p>登录进去。在行动中看到它。</p>
            <form class="m-t" role="form" action="<%=basePath%>user/login">
                <div class="form-group">
                    <input name="username"class="form-control" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder="密码" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登录</button>

                <a href="#"><small>忘记密码?</small></a>
                <p class="text-muted text-center"><small>没有账户?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="register.html">创建账户</a>
            </form>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
