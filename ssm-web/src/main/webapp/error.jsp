<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<script type="text/javascript" src="<%=basePath%>resource/jquery/jquery-2.1.1.min.js"></script>
<body>
<h2>error</h2>
请先登录,3秒后跳到登录页面
<script type="text/javascript">
    $(function(){
        setTimeout(function(){window.location="<%=basePath%>page/login";},3000);
    });
</script>
</body>
</html>
