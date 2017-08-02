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
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>resource/adminlte/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Wake</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="js/jquery-2.1.1.js"></script>
</head>

<body>
<!-- 员工添加的模态框 -->
<div class="modal fade" id="addBookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addBookTitle">图书添加</h4>
            </div>
            <div class="modal-body">
                <form action="<%=basePath%>book/addBook" method="get" id="add_book_form" role="form">
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
                            <td><input name="bookPublicationDate" type="date" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <%--<td>更新时间:</td>--%>
                            <td><input name="bookUpdatetime" type="hidden" class="form-control" id="add_update_input"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input name="bookIslend" class="form-control" type="hidden" value="0"/>
                            </td>
                        </tr>
                        <%--                        <tr>
                                                    <td></td>
                                                    <td><input type="submit" class="btn btn-primary" id="modify" value="添加">&nbsp;&nbsp;
                                                        <input type="button" class="btn btn-primary" id="back" onclick="javascript:window.history.back();"
                                                               value="返回"/></td>
                                                </tr>--%>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="book_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 员工更新的模态框 -->
<div class="modal fade" id="updateBookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">信息更新</h4>
            </div>
            <div class="modal-body">
                <form action="<%=basePath%>book/addBook" method="get" id="update_book_form" role="form">
                    <table table table-condensed align="center" width="380px" height="360px">
                        <thead>
                        <tr>
                            <td colspan="2" align="center"><h3>添加图书信息</h3></td>
                        </tr>

                        </thead>

                        <tr>
                            <td>图书名称:</td>
                            <td><input name="bookName" id="update_bookName" class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>图书作者:</td>
                            <td><input name="bookAuthor" id="update_bookAuthor" class="form-control"/></td>
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
                            <td>是否可借</td>
                            <td><select name="bookIslend">
                                <option value="0">可借</option>
                                <option value="1">不可借</option>
                            </select>
                                <%--<input name="bookIslend" class="form-control" type="" value="0"/>--%>
                            </td>
                        </tr>
                        <%--                        <tr>
                                                    <td></td>
                                                    <td><input type="submit" class="btn btn-primary" id="modify" value="添加">&nbsp;&nbsp;
                                                        <input type="button" class="btn btn-primary" id="back" onclick="javascript:window.history.back();"
                                                               value="返回"/></td>
                                                </tr>--%>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="book_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="img/profile_small.jpg" width="50px" height="40px" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${sessionScope.currUser.username}</strong>
                             </span> <span class="text-muted text-xs block"><shiro:guest>欢迎游客访问</shiro:guest>
                    <shiro:authenticated>
                        <shiro:hasRole name="superadmin">超级管理员</shiro:hasRole>
                        <shiro:hasRole name="admin">管理员</shiro:hasRole>
                        <shiro:hasRole name="guest">游客</shiro:hasRole>
                        <shiro:hasRole name="register">注册用户</shiro:hasRole>
                        <%--<a href="<%=basePath%>user/logout">退出</a>--%></shiro:authenticated> <b class="caret"></b></span> </span> </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="profile.html">个人信息</a></li>
                                <li><a href="contacts.html">联系方式</a></li>
                                <li><a href="mailbox.html">邮箱</a></li>
                                <li class="divider"></li>
                                <li><a href="<%=basePath%>user/logout">退出登录</a></li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            IN+
                        </div>
                    </li>
                    <li class="active">
                        <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">图书管理</span> <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li class="active"><a href="javascript:location.reload();">图书列表</a></li>
                            <li><a href="dashboard_2.html">首页 v.2</a></li>

                        </ul>
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">用户管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="<%=basePath%>page/user">用户列表</a></li>

                        </ul>
                    </li>


                    <li>
                        <a href="grid_options.html"><i class="fa fa-laptop"></i> <span class="nav-label">网格</span></a>
                    </li>

                    <%--<li>
                        <a href="#"><i class="fa fa-sitemap"></i> <span class="nav-label">菜单 </span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li>
                                <a href="#">三级菜单 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">三级菜单标题</a>
                                    </li>
                                    <li>
                                        <a href="#">三级菜单标题</a>
                                    </li>
                                    <li>
                                        <a href="#">三级菜单标题</a>
                                    </li>

                                </ul>
                            </li>
                            <li><a href="#">二级菜单标题</a></li>
                            <li>
                                <a href="#">二级菜单标题</a></li>
                            <li>
                                <a href="#">二级菜单标题</a></li>
                        </ul>
                    </li>--%>

                </ul>

            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary "><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <shiro:guest>欢迎游客访问</shiro:guest>
                    <shiro:authenticated>欢迎&nbsp;&nbsp;${sessionScope.currUser.username}&nbsp;&nbsp;
                        <shiro:hasRole name="superadmin">超级管理员</shiro:hasRole>
                        <shiro:hasRole name="admin">管理员</shiro:hasRole>
                        <shiro:hasRole name="guest">游客</shiro:hasRole>
                        <shiro:hasRole name="register">注册用户</shiro:hasRole>
                        <%--<a href="<%=basePath%>user/logout">退出</a>--%></shiro:authenticated>
                    <shiro:hasRole name="superadmin"><button class="btn btn-danger" id="delete_all_book">删除</button></shiro:hasRole>

                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a7.jpg">
                                </a>
                                <div class="media-body">
                                    <small class="pull-right">46小时前</small>
                                    <strong>李文俊</strong> 关注了 <strong>刘海洋</strong>. <br>
                                    <small class="text-muted">3 天 前- 10.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a4.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">5小时前</small>
                                    <strong>王昆</strong> 关注了 <strong>李文俊</strong>. <br>
                                    <small class="text-muted">昨天下午1:21 - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/profile.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right">23小时前</small>
                                    <strong>张三</strong> 赞了 <strong>李四</strong>. <br>
                                    <small class="text-muted">2天前 - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="mailbox.html">
                                    <i class="fa fa-envelope"></i> <strong>查看更多消息</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> 您有 16 条未读通知
                                    <span class="pull-right text-muted small">4 分钟 前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="profile.html">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 个新粉丝
                                    <span class="pull-right text-muted small">12 分钟 前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="grid_options.html">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> 服务器重启
                                    <span class="pull-right text-muted small">4 分钟 前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="notifications.html">
                                    <strong>查看更多通知</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>


                <li>
                        <a href="<%=basePath%>user/logout">
                        <i class="fa fa-sign-out"></i> 退出登录
                    </a>
                </li>
            </ul>

        </nav>
        </div>
               <%-- <div class="row  border-bottom white-bg dashboard-header">




            </div>--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                        <div class="row">
                        <div class="col-lg-12" class="col-sm-10">
                            <div class="ibox float-e-margins">
                                <%--<div class="ibox-title" align="center">
                                    &lt;%&ndash;<shiro:guest>欢迎游客访问</shiro:guest>
                                    <shiro:authenticated>欢迎&nbsp;&nbsp;${sessionScope.currUser.username}&nbsp;&nbsp;
                                        <shiro:hasRole name="superadmin">超级管理员</shiro:hasRole>
                                        <shiro:hasRole name="admin">管理员</shiro:hasRole>
                                        <shiro:hasRole name="guest">游客</shiro:hasRole>
                                        <shiro:hasRole name="register">注册用户</shiro:hasRole>
                                        <a href="<%=basePath%>user/logout">退出</a></shiro:authenticated>
                                    <shiro:hasRole name="superadmin"><button class="btn btn-danger" id="delete_all_book">删除</button></shiro:hasRole>&ndash;%&gt;
                                </div>--%>
                                <div class="ibox-content">
                                    <div id="body">
                                        <form action="">
                                            <table id="bookTable" class="table table-hover table-responsive" width="100%">
                                                <thead>
                                                <tr>
                                                    <td colspan="8" align="center" style="font-size: 22px;">图书管理系统</td>
                                                    <%--<td width="300px"><shiro:guest>欢迎游客访问</shiro:guest>
                                                        <shiro:authenticated>欢迎&nbsp;&nbsp;${sessionScope.currUser.username}&nbsp;&nbsp;
                                                            <shiro:hasRole name="superadmin">超级管理员</shiro:hasRole>
                                                            <shiro:hasRole name="admin">管理员</shiro:hasRole>
                                                            <shiro:hasRole name="guest">游客</shiro:hasRole>
                                                            <shiro:hasRole name="register">注册用户</shiro:hasRole>
                                                            <a href="<%=basePath%>user/logout">退出</a></shiro:authenticated>
                                                        <shiro:hasRole name="superadmin"><button class="btn btn-danger" id="delete_all_book">删除</button></shiro:hasRole>
                                                    </td>--%>
                                                </tr>


                                                <tr>
                                                    <th><input type="checkbox" id="check_all"/></th>
                                                    <th align="center">图书编号</th>
                                                    <th>图书名称</th>
                                                    <th>图书作者</th>
                                                    <th>出版社</th>
                                                    <th>出版日期</th>
                                                    <th>更新时间</th>
                                                    <th>是否可借</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%--<c:forEach items="${pageInfo.list}" var="book" varStatus="status">
                                                    <tr>
                                                        <td>${book.id }</td>
                                                        <td>${book.bookName }</td>
                                                        <td>${book.bookAuthor }</td>
                                                        <td>${book.bookPublishing }</td>
                                                        <td><fmt:formatDate value="${book.bookPublicationDate }" type="date"/></td>
                                                        <td><fmt:formatDate value="${book.bookUpdatetime }" type="both"/></td>
                                                        <td><c:if test="${book.bookIslend == '1' }">已借出</c:if>
                                                            <c:if test="${book.bookIslend == '0' }">可借</c:if></td>
                                                        <td><input type="button" class="btn btn-info btn-s" value="修改"
                                                                   onclick="javascript:update(${book.id });"/>
                                                            <input type="button" class="btn btn-danger btn-s" value="删除" onclick="del(${book.id });"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>--%>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                    <div class="col-md-4" id="page_info">
                                        <%--当前${pageInfo.pageNum},总共${pageInfo.pages}页,总${pageInfo.total}条记录--%>
                                    </div>
                                    <div class="col-md-3">
                                        <shiro:hasRole name="superadmin">
                                            <%--<a href="<%=basePath%>page/addBook">--%>
                                            <button type="button" class="btn btn-info btn-s"
                                                    id="book_add_modal_btn">
                                                添加图书
                                            </button>
                                            <%--</a>--%>
                                        </shiro:hasRole>
                                        <a href="<%=basePath%>book/exportCurrPage">
                                            <input type=button class="btn btn-info btn-s" value="导出全部信息"/>
                                        </a>
                                        <a id="download">
                                            <input type=button class="btn btn-info btn-s" value="导出当前页" onclick="a()"/>
                                        </a>
                                    </div>
                                    <div class="col-md-4" id="page_info_nav">
                                        <%--<nav aria-label="Page navigation">
                                            <ul class="pagination">
                                                <li>
                                                    <a href="<%=basePath%>book/bookList?page=1&rows=${pageInfo.pageSize}">
                                                        首页
                                                    </a>
                                                </li>
                                                <!-- 如果有前一页才显示该标签 -->
                                                <c:if test="${pageInfo.hasPreviousPage}">
                                                    <li>
                                                        <a href="<%=basePath%>book/bookList?<c:if test="${pageInfo.prePage =='0'}">page=1</c:if>
                                                                        <c:if test="${pageInfo.prePage !='0'}">page=${pageInfo.prePage}</c:if>
                                                                        &rows=${pageInfo.pageSize}" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <c:forEach items="${pageInfo.navigatepageNums}" var="pageNums">

                                                    <!-- 如果显示的页码为当前页码，则高亮显示 -->
                                                    <c:if test="${pageInfo.pageNum == pageNums}">
                                                        <li class="active"><a
                                                                href="<%=basePath%>book/bookList?page=${pageNums}&rows=${pageInfo.pageSize}">${pageNums}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${pageInfo.pageNum != pageNums}">
                                                        <li><a href="<%=basePath%>book/bookList?page=${pageNums}&rows=${pageInfo.pageSize}">${pageNums}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${pageInfo.hasNextPage}">
                                                    <li>

                                                        <a href="<%=basePath%>book/bookList?
                                                        <c:if test="${pageInfo.isLastPage  == 'true'}">page=${pageInfo.lastPage }</c:if>
                                                        <c:if test="${pageInfo.isLastPage  == 'false'}">page=${pageInfo.nextPage }</c:if>
                                                        &rows=${pageInfo.pageSize}" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <li>
                                                    <a href="<%=basePath%>book/bookList?page=${pageInfo.pages }&rows=${pageInfo.pageSize}">
                                                        尾页
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>--%>
                                    </div>

                                    <script type="text/javascript">
                                        $(function () {
                                            to_page(1);

                                        });
                                        <!--相对应的Msg类没有写-->
                                        function build_emps_table(result) {
                                            $("#bookTable tbody").empty();
                                            var bookLists = result.extend.pageInfo.list;
                                            $.each(bookLists, function (index, item) {
                                                //时间戳转换为年月日
                                                var myDate = new Date(item.bookPublicationDate);
                                                var year = myDate.getFullYear();        //年
                                                var month = myDate.getMonth() + 1;        //月
                                                var day = myDate.getDate();             //日

                                                myDate = new Date(item.bookUpdatetime);
                                                var updateYear = myDate.getFullYear();        //年
                                                var updateMonth = myDate.getMonth() + 1;        //月
                                                var updateDay = myDate.getDate();             //日
                                                var hours = myDate.getHours();          //时
                                                var min = myDate.getMinutes();          //分
                                                var second = myDate.getSeconds();       //秒

                                                var checkBoxId = $("<td><input type='checkbox' class='check_item'/></td>");
                                                var id = $("<td></td>").append(item.id);
                                                var bookName = $("<td></td>").append(item.bookName);
                                                var bookAuthor = $("<td></td>").append(item.bookAuthor);
                                                var bookPublishing = $("<td></td>").append(item.bookPublishing);
                                                var bookPublicationDate = $("<td></td>").append(year + "年" + month + "月" + day + "日");
                                                var bookUpdatetime = $("<td></td>").append(updateYear + "年" + updateMonth + "月" + updateDay + "日&nbsp;&nbsp;" + hours + ":" + min + ":" + second);
                                                var bookIslend = $("<td></td>").append(item.bookIslend == 0 ? "可借" : "不可借");
                                                var editBtn = $("<shiro:hasRole name="superadmin"><button></button></shiro:hasRole>").addClass("btn btn-info btn-s edit_btn").append("编辑");
                                                var delBtn = $("<shiro:hasRole name="superadmin"><button></button></shiro:hasRole>").addClass("btn btn-danger btn-s delete_btn").append("删除");
                                                var btnTd = $("<td></td>").append(editBtn).append("&nbsp;&nbsp;").append(delBtn);
                                                $("<tr></tr>").append(checkBoxId)
                                                    .append(id)
                                                    .append(bookName)
                                                    .append(bookAuthor)
                                                    .append(bookPublishing)
                                                    .append(bookPublicationDate)
                                                    .append(bookUpdatetime)
                                                    .append(bookIslend)
                                                    .append(btnTd)
                                                    .appendTo("#bookTable tbody");
                                            });
                                        }
                                        ;
                                        //显示分页信息
                                        var totalRecord;
                                        function build_page_info(result) {
                                            $("#page_info").empty();
                                            $("#page_info").append("当前第" + result.extend.pageInfo.pageNum + "页，"
                                                + "总共" + result.extend.pageInfo.pages + "页，总共"
                                                + result.extend.pageInfo.total + "条记录");
                                            totalRecord = result.extend.pageInfo.pages;

                                        }
                                        //显示分页条信息
                                        function build_page_nav(result) {
                                            $("#page_info_nav").addClass(".col-md-4");
                                            $("#page_info_nav").empty();
                                            var ul = $("<ul></ul>").addClass("pagination");
                                            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
                                            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                                            if (result.extend.pageInfo.hasPreviousPage == false) {
                                                prePageLi.addClass("disabled");
                                                firstPageLi.addClass("disabled");
                                            }
                                            firstPageLi.click(function () {
                                                to_page(1);
                                            });
                                            prePageLi.click(function () {
                                                if (result.extend.pageInfo.hasPreviousPage == false) {
                                                    to_page(result.extend.pageInfo.pageNum);
                                                } else {
                                                    to_page(result.extend.pageInfo.pageNum - 1);
                                                }
                                            });

                                            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                                            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页"));
                                            if (result.extend.pageInfo.hasNextPage == false) {
                                                nextPageLi.addClass("disabled");
                                                lastPageLi.addClass("disabled");
                                            }
                                            nextPageLi.click(function () {
                                                if (result.extend.pageInfo.hasNextPage) {
                                                    to_page(result.extend.pageInfo.pageNum + 1);
                                                } else {
                                                    to_page(result.extend.pageInfo.pageNum);
                                                }

                                            });
                                            lastPageLi.click(function () {
                                                to_page(result.extend.pageInfo.pages);
                                            });
                                            //添加首页和前一页的提示
                                            ul.append(firstPageLi).append(prePageLi);
                                            //遍历页码
                                            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                                                var numLi = $("<li></li>").append($("<a></a>").append(item));
                                                if (result.extend.pageInfo.pageNum == item) {
                                                    numLi.addClass("active");
                                                }
                                                numLi.click(function () {
                                                    to_page(item);
                                                });
                                                ul.append(numLi);
                                            })
                                            //添加下一页和尾页的提示
                                            ul.append(nextPageLi).append(lastPageLi);
                                            var navEle = $("<nav></nav>").append(ul);
                                            navEle.appendTo("#page_info");
                                        }
                                        //跳转到指定页面
                                        function to_page(page) {
                                            $.ajax({
                                                url: "<%=basePath%>book/bookList",
                                                data: "page=" + page + "&rows=${pageInfo.pageSize}",
                                                type: "get",
                                                success: function (result) {
                                                    console.info(JSON.stringify(result));
                                                    //显示表格数据
                                                    build_emps_table(result);
                                                    //显示分页数据
                                                    build_page_info(result);
                                                    //显示分页条数据
                                                    build_page_nav(result);
                                                }
                                            });
                                        }
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
                                        //点击弹出添加信息的模态框
                                        $('#book_add_modal_btn').click(function () {
                                            $('#addBookModal').modal({
                                                    backdrop: "static"
                                                }
                                            );
                                        });

                                        $("#book_save_btn").click(function () {
                                            $.ajax({
                                                url: "<%=basePath%>book/addBook",
                                                type: "POST",
                                                data: $("#add_book_form").serialize(),
                                                success: function (result) {
                                                    $("#addBookModal").modal('hide');
                                                    to_page(totalRecord);
                                                },
                                                error: function (result) {

                                                }
                                            });
                                        });

                                        //完成全选/全不选功能
                                        $("#check_all").click(function () {
                                            //attr获取checked是undefined;
                                            //我们这些dom原生的属性，attr获取自定义属性的值
                                            //prop修改和读取dom原生属性的值
                                            $(".check_item").prop("checked", $(this).prop("checked"));
                                        });

                                        //check_item
                                        $(document).on('click', '.check_item', function () {
                                            //判断当前选择中的元素是否是10个
                                            var flag = $(".check_item:checked").length == $(".check_item").length;
                                            $("#check_all").prop("checked", flag);
                                        });

                                        //批量删除
                                        $("#delete_all_book").click(function(){
                                            var bookNames="";
                                            $.each($(".check_item:checked"),function () {
                                                bookNames+=$(this).parents("tr").find("td:eq(1)").text()+",";
                                            });
                                            bookNames = bookNames.substring(0,bookNames.length-1);
                                            if(bookNames.length==0){
                                                alert("请选择图书");
                                            }else{
                                                if(confirm("确认删除["+bookNames+"]吗？")){
                                                    //发送Ajax请求
                                                }
                                            }
                                        });
                                    </script>
                                </div>

                        </div>
                        </div>
                </div>
                <div class="footer" style="position: absolute;  bottom: -90px;">
                    <div class="pull-right">
                        10GB of <strong>250GB</strong> Free.
                    </div>
                    <div>
                        <strong>Copyright</strong> Example Company &copy; 2014-2015
                    </div>
                </div>
            </div>
        </div>

        </div>
        <div class="small-chat-box fadeInRight animated">

            <div class="heading" draggable="true">
                <small class="chat-date pull-right">
                    02.19.2015
                </small>
                Small chat
            </div>

            <div class="content">

                <div class="left">
                    <div class="author-name">
                        Monica Jackson <small class="chat-date">
                        10:02 am
                    </small>
                    </div>
                    <div class="chat-message active">
                        Lorem Ipsum is simply dummy text input.
                    </div>

                </div>
                <div class="right">
                    <div class="author-name">
                        Mick Smith
                        <small class="chat-date">
                            11:24 am
                        </small>
                    </div>
                    <div class="chat-message">
                        Lorem Ipsum is simpl.
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Alice Novak
                        <small class="chat-date">
                            08:45 pm
                        </small>
                    </div>
                    <div class="chat-message active">
                        Check this stock char.
                    </div>
                </div>
                <div class="right">
                    <div class="author-name">
                        Anna Lamson
                        <small class="chat-date">
                            11:24 am
                        </small>
                    </div>
                    <div class="chat-message">
                        The standard chunk of Lorem Ipsum
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Mick Lane
                        <small class="chat-date">
                            08:45 pm
                        </small>
                    </div>
                    <div class="chat-message active">
                        I belive that. Lorem Ipsum is simply dummy text.
                    </div>
                </div>


            </div>
            <div class="form-chat">
                <div class="input-group input-group-sm"><input type="text" class="form-control"> <span class="input-group-btn"> <button
                        class="btn btn-primary" type="button">Send
                </button> </span></div>
            </div>

        </div>
        <div id="small-chat">

            <span class="badge badge-warning pull-right">5</span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>

            </a>
        </div>
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active"><a data-toggle="tab" href="#tab-1">
                        Notes
                    </a></li>
                    <li><a data-toggle="tab" href="#tab-2">
                        Projects
                    </a></li>
                    <li class=""><a data-toggle="tab" href="#tab-3">
                        <i class="fa fa-gear"></i>
                    </a></li>
                </ul>

                <div class="tab-content">


                    <div id="tab-1" class="tab-pane active">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> Latest Notes</h3>
                            <small><i class="fa fa-tim"></i> You have 10 new message.</small>
                        </div>

                        <div>

                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a1.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">

                                        There are many variations of passages of Lorem Ipsum available.
                                        <br>
                                        <small class="text-muted">Today 4:21 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        The point of using Lorem Ipsum is that it has a more-or-less normal.
                                        <br>
                                        <small class="text-muted">Yesterday 2:45 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        Mevolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                        <br>
                                        <small class="text-muted">Yesterday 1:10 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg">
                                    </div>

                                    <div class="media-body">
                                        Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the
                                        <br>
                                        <small class="text-muted">Monday 8:37 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a8.jpg">
                                    </div>
                                    <div class="media-body">

                                        All the Lorem Ipsum generators on the Internet tend to repeat.
                                        <br>
                                        <small class="text-muted">Today 4:21 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
                                        <br>
                                        <small class="text-muted">Yesterday 2:45 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below.
                                        <br>
                                        <small class="text-muted">Yesterday 1:10 pm</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        Uncover many web sites still in their infancy. Various versions have.
                                        <br>
                                        <small class="text-muted">Monday 8:37 pm</small>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>

                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> Latest projects</h3>
                            <small><i class="fa fa-tim"></i> You have 14 projects. 10 not completed.</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Business valuation</h4>
                                    It is a long established fact that a reader will be distracted.

                                    <div class="small">Completion with: 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Contract with Company </h4>
                                    Many desktop publishing packages and web page editors.

                                    <div class="small">Completion with: 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Meeting</h4>
                                    By the readable content of a page when looking at its layout.

                                    <div class="small">Completion with: 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>The generated</h4>
                                    <!--<div class="small pull-right m-t-xs">9 hours ago</div>-->
                                    There are many variations of passages of Lorem Ipsum available.
                                    <div class="small">Completion with: 22%</div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Business valuation</h4>
                                    It is a long established fact that a reader will be distracted.

                                    <div class="small">Completion with: 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Contract with Company </h4>
                                    Many desktop publishing packages and web page editors.

                                    <div class="small">Completion with: 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9 hours ago</div>
                                    <h4>Meeting</h4>
                                    By the readable content of a page when looking at its layout.

                                    <div class="small">Completion with: 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>The generated</h4>
                                    <!--<div class="small pull-right m-t-xs">9 hours ago</div>-->
                                    There are many variations of passages of Lorem Ipsum available.
                                    <div class="small">Completion with: 22%</div>
                                    <div class="small text-muted m-t-xs">Project end: 4:00 pm - 12.06.2014</div>
                                </a>
                            </li>

                        </ul>

                    </div>

                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3><i class="fa fa-gears"></i> Settings</h3>
                            <small><i class="fa fa-tim"></i> You have 14 projects. 10 not completed.</small>
                        </div>

                        <div class="setings-item">
                    <span>
                        Show notifications
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example">
                                    <label class="onoffswitch-label" for="example">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Disable Chat
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" checked class="onoffswitch-checkbox" id="example2">
                                    <label class="onoffswitch-label" for="example2">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Enable history
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example3">
                                    <label class="onoffswitch-label" for="example3">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Show charts
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example4">
                                    <label class="onoffswitch-label" for="example4">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Offline users
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example5">
                                    <label class="onoffswitch-label" for="example5">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Global search
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example6">
                                    <label class="onoffswitch-label" for="example6">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                    <span>
                        Update everyday
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example7">
                                    <label class="onoffswitch-label" for="example7">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="sidebar-content">
                            <h4>Settings</h4>
                            <div class="small">
                                I belive that. Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                And typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                                Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                            </div>
                        </div>

                    </div>
                </div>

            </div>



        </div>
    </div>

    <!-- Mainly scripts -->

    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>

    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- jQuery UI -->
    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- GITTER -->
    <script src="js/plugins/gritter/jquery.gritter.min.js"></script>

    <!-- Sparkline -->
    <script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="js/demo/sparkline-demo.js"></script>

    <!-- ChartJS-->
    <script src="js/plugins/chartJs/Chart.min.js"></script>

    <!-- Toastr -->
    <script src="js/plugins/toastr/toastr.min.js"></script>


    <script>
        $(document).ready(function() {
            setTimeout(function() {
                toastr.options = {
                    closeButton: true,
                    progressBar: true,
                    showMethod: 'slideDown',
                    timeOut: 4000
                };
                toastr.success('Responsive Admin Theme', 'Welcome to INSPINIA');

            }, 1300);


            var data1 = [
                [0,4],[1,8],[2,5],[3,10],[4,4],[5,16],[6,5],[7,11],[8,6],[9,11],[10,30],[11,10],[12,13],[13,4],[14,3],[15,3],[16,6]
            ];
            var data2 = [
                [0,1],[1,0],[2,2],[3,0],[4,1],[5,3],[6,1],[7,5],[8,2],[9,3],[10,2],[11,1],[12,0],[13,2],[14,8],[15,0],[16,0]
            ];
            $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
                data1, data2
            ],
                    {
                        series: {
                            lines: {
                                show: false,
                                fill: true
                            },
                            splines: {
                                show: true,
                                tension: 0.4,
                                lineWidth: 1,
                                fill: 0.4
                            },
                            points: {
                                radius: 0,
                                show: true
                            },
                            shadowSize: 2
                        },
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: "#d5d5d5",
                            borderWidth: 1,
                            color: '#d5d5d5'
                        },
                        colors: ["#1ab394", "#1C84C6"],
                        xaxis:{
                        },
                        yaxis: {
                            ticks: 4
                        },
                        tooltip: false
                    }
            );

            var doughnutData = [
                {
                    value: 300,
                    color: "#a3e1d4",
                    highlight: "#1ab394",
                    label: "App"
                },
                {
                    value: 50,
                    color: "#dedede",
                    highlight: "#1ab394",
                    label: "Software"
                },
                {
                    value: 100,
                    color: "#A4CEE8",
                    highlight: "#1ab394",
                    label: "Laptop"
                }
            ];

            var doughnutOptions = {
                segmentShowStroke: true,
                segmentStrokeColor: "#fff",
                segmentStrokeWidth: 2,
                percentageInnerCutout: 45, // This is 0 for Pie charts
                animationSteps: 100,
                animationEasing: "easeOutBounce",
                animateRotate: true,
                animateScale: false
            };

            var ctx = document.getElementById("doughnutChart").getContext("2d");
            var DoughnutChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);

            var polarData = [
                {
                    value: 300,
                    color: "#a3e1d4",
                    highlight: "#1ab394",
                    label: "App"
                },
                {
                    value: 140,
                    color: "#dedede",
                    highlight: "#1ab394",
                    label: "Software"
                },
                {
                    value: 200,
                    color: "#A4CEE8",
                    highlight: "#1ab394",
                    label: "Laptop"
                }
            ];

            var polarOptions = {
                scaleShowLabelBackdrop: true,
                scaleBackdropColor: "rgba(255,255,255,0.75)",
                scaleBeginAtZero: true,
                scaleBackdropPaddingY: 1,
                scaleBackdropPaddingX: 1,
                scaleShowLine: true,
                segmentShowStroke: true,
                segmentStrokeColor: "#fff",
                segmentStrokeWidth: 2,
                animationSteps: 100,
                animationEasing: "easeOutBounce",
                animateRotate: true,
                animateScale: false
            };
            var ctx = document.getElementById("polarChart").getContext("2d");
            var Polarchart = new Chart(ctx).PolarArea(polarData, polarOptions);

        });
    </script>
        </script>
        <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-4625583-2', 'webapplayers.com');
        ga('send', 'pageview');

    </script>
</body>
</html>
