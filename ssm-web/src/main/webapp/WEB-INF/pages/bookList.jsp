<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>webapp/resource/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title id="title">图书列表</title>
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/fontawesome-webfont.svg">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/FontAwesome.otf">
    <link rel="stylesheet" href="<%=basePath%>resource/usercss/bookList.css">
    <link rel="stylesheet" href="<%=basePath%>resource/userjs/bookList.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap-table.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap-editable.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap-table-editable.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap-table-export.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap-table-zh-CN.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/tableExport.js">
</head>
<body>
<div id="body">
    <form action="">
        <table id="bookTable" class="table table-hover table-responsive" width="100%">
            <thead>
            <tr>
                <td colspan="7" align="center" style="font-size: 22px;">图书管理系统</td>
                <td width="200px"><shiro:guest>欢迎游客访问</shiro:guest>
                    <shiro:authenticated>欢迎&nbsp;&nbsp;${sessionScope.currUser.username}&nbsp;&nbsp;
                        <shiro:hasRole name="superadmin">超级管理员</shiro:hasRole>
                        <shiro:hasRole name="admin">管理员</shiro:hasRole>
                        <shiro:hasRole name="guest">游客</shiro:hasRole>
                        <a href="<%=basePath%>user/logout">退出</a></shiro:authenticated>
                </td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th align="center">图书编号</th>
                <th>图书名称</th>
                <th>图书作者</th>
                <th>出版社</th>
                <th>出版日期</th>
                <th>更新时间</th>
                <th>是否可借</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="book" varStatus="status">
                <tr>
                    <td>${book.id }</td>
                    <td>${book.bookName }</td>
                    <td>${book.bookAuthor }</td>
                    <td>${book.bookPublishing }</td>
                    <td><fmt:formatDate value="${book.bookPublicationDate }" type="date"/></td>
                    <td><fmt:formatDate value="${book.bookUpdatetime }" type="both"/></td>
                    <td><c:if test="${book.bookIslend == '1' }">已借出</c:if>
                        <c:if test="${book.bookIslend == '0' }">可借</c:if></td>
                    <td><input type="button" class="btn btn-info btn-xs" value="修改"
                               onclick="javascript:update(${book.id });"/>
                        <input type="button" class="btn btn-info btn-xs" value="删除" onclick="del(${book.id });"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>
<div id="add" style="margin-left: 5%;padding-top: 2%;">
    <a href="<%=basePath%>page/addBook">
        <input type=button class="btn btn-info btn-xs" value="添加图书"/>
    </a>
    <a href="<%=basePath%>book/exportCurrPage">
        <input type=button class="btn btn-info btn-xs" value="导出全部信息"/>
    </a>
    <a id="download">
        <input type=button class="btn btn-info btn-xs" value="导出当前页" onclick="a()"/>
    </a>
</div>
<div id="foot">
    <a href="<%=basePath%>book/bookList?page=${pageInfo.firstPage }&rows=${pageInfo.pageSize}">
        <input type=button class="btn btn-info btn-xs" value="首页"/>
    </a>
    <a href="<%=basePath%>book/bookList?<c:if test="${pageInfo.prePage =='0'}">page=1</c:if>
									<c:if test="${pageInfo.prePage !='0'}">page=${pageInfo.prePage}</c:if>
									&rows=${pageInfo.pageSize}">
        <input type=button class="btn btn-info btn-xs" value="前一页"/>
    </a>
    <a href="<%=basePath%>book/bookList?
					<c:if test="${pageInfo.isLastPage  == 'true'}">page=${pageInfo.lastPage }</c:if>
					<c:if test="${pageInfo.isLastPage  == 'false'}">page=${pageInfo.nextPage }</c:if>
					&rows=${pageInfo.pageSize}">
        <input type=button class="btn btn-info btn-xs" value="下一页"/>
    </a>
    <a href="<%=basePath%>book/bookList?page=${pageInfo.lastPage }&rows=${pageInfo.pageSize}">
        <input type=button class="btn btn-info btn-xs" value="尾页"/>
    </a>
</div>
<script type="application/javascript">
    function del(id) {
        var flag = confirm("确定删除吗？");
        if (flag == true) {
            window.location = "<%=basePath%>book/del/" + id;
        }
    }
    function update(id) {
        window.location = "<%=basePath%>book/findBookById/" + id;
    }
    function a() {
        //获取图书标题
        var s = document.getElementById("title").innerText;
        // 使用outerHTML属性获取整个table元素的HTML代码（包括<table>标签），然后包装成一个完整的HTML文档，设置charset为urf-8以防止中文乱码
        var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementById("bookTable").outerHTML + "</body></html>";
        // 实例化一个Blob对象，其构造函数的第一个参数是包含文件内容的数组，第二个参数是包含文件类型属性的对象
        var blob = new Blob([html], {type: "application/vnd.ms-excel"});
        var a = document.getElementById("download");

        // 利用URL.createObjectURL()方法为a元素生成blob URL
        a.href = URL.createObjectURL(blob);
        // 设置文件名，目前只有Chrome和FireFox支持此属性
        a.download = s + ".xls";
    }
</script>
</body>
</html>