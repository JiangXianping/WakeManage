<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<table width="90%" style="margin: 0px auto; " >
			<thead>
				<tr>
					<td colspan="6" align="center" style="font-size: 20px;">图书管理系统</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>图书名称</th>
					<th>图书作者</th>
					<th>出版社</th>
					<th>出版日期</th>
					<th>更新时间</th>
					<th>是否借出</th>
				</tr>
				<c:forEach items="${pageInfo.list}" var="book" varStatus="status">
					<tr>
						<td>${book.bookName }</td>
						<td>${book.bookAuthor }</td>
						<td>${book.bookPublishing }</td>
						<td>${book.bookPublicationDate }</td>
						<td>${book.bookUpdatetime }</td>
						<td>${book.bookIslend }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<a href="bookList?page=${pageInfo.prePage }&rows=${pageInfo.pageSize}">
				<input type=button class="btn btn-info btn-xs" value="前一页"/>
			</a> 
			<a href="bookList?page=${pageInfo.nextPage }&rows=${pageInfo.pageSize}">
				<input type=button class="btn btn-info btn-xs" value="下一页"/>
			</a> 
			<a href="bookList?page=${pageInfo.lastPage }&rows=${pageInfo.pageSize}">
				<input type=button class="btn btn-info btn-xs" value="尾页"/>
			</a> 
			</tfoot>
		</table>
	</form>
</body>
</html>