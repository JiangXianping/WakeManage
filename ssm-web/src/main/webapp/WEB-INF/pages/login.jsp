<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script type="text/JavaScript" src="<%=basePath%>resource/jquery//jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/fontawesome-webfont.svg">
<link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/FontAwesome.otf">
<link rel="stylesheet" href="<%=basePath%>resource/userjs/bookList.js">
<link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap.js">
<style>
    input {
        opacity: 0.4;
        width: 300px;
        z-index: 1;
        background-color: yellow;
    }

</style>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
</head>
<body>
<div style="width: 100%; margin-top: 50px;">
<form action="<%=basePath%>user/login">

    <table align="center" style="height: 150px; ">
        <tr>

            <td><input name="username" value="" class="form-control" placeholder="用户名" required/></td>
        </tr>
        <tr>

            <td><input name="password" value="" class="form-control" placeholder="密码" required></td>
        </tr>
        <tr>

            <td><input type="submit" class="btn btn-primary" value="登录"></td>
        </tr>

    </table>
</form>
</div>
</body>
</html>