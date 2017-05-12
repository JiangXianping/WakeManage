<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>webapp/resource/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF">
    <title>图书列表</title>
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/fontawesome-webfont.svg">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/FontAwesome.otf">
    <link rel="stylesheet" href="<%=basePath%>resource/usercss/bookList.css">
    <link rel="stylesheet" href="<%=basePath%>resource/userjs/bookList.js">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap.js">
</head>
<body>
<div id="body">
    <form action="">
        <table class="table table-hover table-responsive" width="100%">
            <thead>
            <tr>
                <td colspan="7" align="center" style="font-size: 22px;">图书管理系统</td>
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
</script>
</body>
</html>