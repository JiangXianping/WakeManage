<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/5/12
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<style>
    td {
        font-size: 16px;

    }

    #body {
        width: 1365px;
        height: 100%;
        z-index: 0;
        /*        background: -webkit-linear-gradient(darkorange,blue); !* Safari 5.1 - 6.0 *!*/
        -webkit-filter: blur(10px);
    }

    form {
        position: absolute;
        top: 10px;
        left: 35%;
        z-index: 1;
    }
</style>
<head>
    <title>修改图书信息</title>
    <script type="text/JavaScript" src="<%=basePath%>resource/jquery//jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/fontawesome-webfont.svg">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/FontAwesome.otf">
    <link rel="stylesheet" href="<%=basePath%>resource/userjs/bookList.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap.js">

</head>
<body>
<div id="body"></div>
<form action="<%=basePath%>book/addBook" method="get" role="form">
    <table table table-condensed align="center" width="380px" height="360px">
        <thead>
        <tr>
            <td colspan="2" align="center"><h3>添加图书信息</h3></td>
        </tr>

        </thead>

        <tr>
            <td>图书名称:</td>
            <td><input name="bookName" id="bookName" class="form-control"/></td>
        </tr>
        <tr>
            <td>图书作者:</td>
            <td><input name="bookAuthor" id="bookAuthor" class="form-control"/></td>
        </tr>
        <tr>
            <td>出版社:</td>
            <td><input name="bookPublishing" class="form-control"/></td>
        </tr>
        <tr>
            <td>出版时间:</td>
            <td><input name="bookPublicationDate" class="form-control"/>
            </td>
        </tr>
        <tr>
            <td>更新时间:</td>
            <td><input name="bookUpdatetime" class="form-control" placeholder="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" class="btn btn-primary" id="modify" value="添加">&nbsp;&nbsp;
                <input type="button" class="btn btn-primary" id="back" onclick="javascript:window.history.back();"
                       value="返回"/></td>
        </tr>
    </table>
</form>
</body>
<script>
    $(function () {
        /*$("#modify").click(function () {
         alert($("#bookName").val());
         $.ajax({
         url: '
        <%=basePath%>book/modify',
         type: 'GET',
         data: $("#updateBook").serialize(), /!*序列化表单提交整个表单数据*!/
         success: function (data) {
         alert(data)
         if (data == 1) {
         alert("修改成功!");
         window.location.href = "book/bookList";
         } else {
         alert("修改失败!");
         }
         },
         error: function (data) {
         alert(data[i] + "操作失败!");
         }
         });
         });*/
    });
</script>
</html>
