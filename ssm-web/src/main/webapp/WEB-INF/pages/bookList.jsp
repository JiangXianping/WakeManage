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
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/usercss/bookList.css">
    <script type="text/javascript" src="<%=basePath%>resource/userjs/bookList.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/jquery/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var myDate = new Date().toLocaleString();
//            var year = myDate.getFullYear();        //年
//            var month = myDate.getMonth() + 1;        //月
//            var day = myDate.getDate();             //日
//
//            var hours = myDate.getHours();          //时
//            var min = myDate.getMinutes();          //分
//            if(min<10){
//                min = 0+""+min;
//            }
//            var second = myDate.getSeconds();       //秒
//            document.getElementById('add_update_input').value=year+"-"+month+"-"+day+" "+hours+":"+min+":"+second;
            document.getElementById('add_update_input').value = myDate;
        })
    </script>
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

<div id="body">
    <form action="">
        <table id="bookTable" class="table table-hover table-responsive" width="100%">
            <thead>
            <tr>
                <td colspan="7" align="center" style="font-size: 22px;">图书管理系统</td>
                <td width="300px"><shiro:guest>欢迎游客访问</shiro:guest>
                    <shiro:authenticated>欢迎&nbsp;&nbsp;${sessionScope.currUser.username}&nbsp;&nbsp;
                        <shiro:hasRole name="superadmin">超级管理员</shiro:hasRole>
                        <shiro:hasRole name="admin">管理员</shiro:hasRole>
                        <shiro:hasRole name="guest">游客</shiro:hasRole>
                        <a href="<%=basePath%>user/logout">退出</a></shiro:authenticated>
                    <shiro:hasRole name="superadmin"><button class="btn btn-danger" id="delete_all_book">删除</button></shiro:hasRole>
                </td>
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
        <button type="button" class="btn btn-info btn-s" data-toggle="modal" data-target="#myModal"
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
</body>
</html>