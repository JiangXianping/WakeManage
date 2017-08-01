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
<html>

<head>
    <base href="<%=basePath%>webapp/resource/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>首页</title>
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
    <!-- Toastr style -->
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/toastr.min.css">
    <!-- Gritter -->
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/jquery.gritter.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/style.css">

</head>

<body>
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="img/profile_small.jpg" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">王昆</strong>
                             </span> <span class="text-muted text-xs block">管理员 <b class="caret"></b></span> </span> </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="profile.html">个人信息</a></li>
                                <li><a href="contacts.html">联系方式</a></li>
                                <li><a href="mailbox.html">邮箱</a></li>
                                <li class="divider"></li>
                                <li><a href="login.html">退出登录</a></li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            IN+
                        </div>
                    </li>
                    <li class="active">
                        <a href=""><i class="fa fa-th-large"></i> <span class="nav-label">用户管理</span> <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li class="active"><a href="">新增用户</a></li>
                            <li><a href="">权限管理</a></li>
                        </ul>
                    </li>
                  
                    <li class="active">
                        <a href=""><i class="fa fa-th-large"></i> <span class="nav-label">图书管理</span> <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li class="active"><a href="">图书列表</a></li>
                            <li><a href="">新增图书</a></li>
                            <li><a href="">预约图书</a></li>
                        </ul>
                    </li>
                    
                </ul>

            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">欢迎来到goopay</span>
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
                    <a href="login.html">
                        <i class="fa fa-sign-out"></i> 退出登录
                    </a>
                </li>
            </ul>

        </nav>
        </div>
                <div class="row  border-bottom white-bg dashboard-header">row  border-bottom white-bg dashboard-header
                    <div class="col-sm-6">
                        
                    </div>
            	</div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                        <div class="row">
                        
                            <div class="col-lg-4">
                                <div class="ibox float-e-margins">
                                    
                                    <div class="ibox-content">

                                        <div>
                                            


                                        </div>

                                    </div>
                                </div>

                            </div>
                        <div class="col-lg-4">
                            <div class="ibox float-e-margins">
                                
                            </div>
                        </div>
                        </div>
                </div>
                <div class="footer">
                    <div class="pull-right">
                        10GB of <strong>250GB</strong> Free.
                    </div>
                    <div>
                        <strong>Copyright</strong> Example Company &copy; 2014-2018
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    <!-- Mainly scripts -->
    <script type="text/javascript" src="<%=basePath%>resource/jquery/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/flot/jquery.flot.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/flot/jquery.flot.spline.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/flot/jquery.flot.resize.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/flot/jquery.flot.pie.js"></script>
    <!-- Peity -->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/jquery.peity.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/inspinia.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/pace.min.js"></script>


    <!-- jQuery UI -->
    <script type="text/javascript" src="<%=basePath%>resource/jquery/jquery-ui.min.js"></script>

    <!-- GITTER -->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/jquery.gritter.min.js"></script>

    <!-- Sparkline -->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/sparkline-demo.js"></script>

    <!-- ChartJS-->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/Chart.min.js"></script>

    <!-- Toastr -->
    <script type="text/javascript" src="<%=basePath%>resource/plugins/js/toastr.min.js"></script>

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
