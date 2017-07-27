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

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>动态表格</title>

    <link href="../../../../../../../FrontTool/INSPINIA_v2.5/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../../../../../FrontTool/INSPINIA_v2.5/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="../../../../../../../FrontTool/INSPINIA_v2.5/css/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <link href="../../../../../../../FrontTool/INSPINIA_v2.5/css/animate.css" rel="stylesheet">
    <link href="../../../../../../../FrontTool/INSPINIA_v2.5/css/style.css" rel="stylesheet">

    <script type="text/JavaScript" src="<%=basePath%>resource/jquery//jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/css/style.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/css/datatables.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/fontawesome-webfont.svg">
    <link rel="stylesheet" href="<%=basePath%>resource/Font-Awesome/font/FontAwesome.otf">
    <link rel="stylesheet" href="<%=basePath%>resource/bootstrap/js/bootstrap.js">
</head>

<body>

    <div id="wrapper">

      <nav class="navbar-default navbar-static-side" role="navigation">
          <div class="sidebar-collapse">
              <ul class="nav metismenu" id="side-menu">
                  <li class="nav-header">
                      <div class="dropdown profile-element"> <span>
                          <img alt="image" class="img-circle" src="../../../../../../../FrontTool/INSPINIA_v2.5/img/profile_small.jpg" />
                           </span>
                          <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">王昆</strong>
                           </span> <span class="text-muted text-xs block">管理员 <b class="caret"></b></span> </span> </a>
                          <ul class="dropdown-menu animated fadeInRight m-t-xs">
                              <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/profile.html">个人信息</a></li>
                              <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/contacts.html">联系方式</a></li>
                              <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/mailbox.html">邮箱</a></li>
                              <li class="divider"></li>
                              <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/login.html">退出登录</a></li>
                          </ul>
                      </div>
                      <div class="logo-element">
                          IN+
                      </div>
                  </li>
                  <li>
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/index.html"><i class="fa fa-th-large"></i> <span class="nav-label">首页</span> <span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/index.html">首页 v.1</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/dashboard_2.html">首页 v.2</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/dashboard_3.html">首页 v.3</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/dashboard_4_1.html">首页 v.4</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/dashboard_5.html">首页 v.5 <span class="label label-primary pull-right">NEW</span></a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">布局</span></a>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">图表</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/graph_flot.html">Flot Charts</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/graph_morris.html">Morris.js Charts</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/graph_rickshaw.html">Rickshaw Charts</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/graph_chartjs.html">Chart.js</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/graph_chartist.html">Chartist</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/c3.html">c3 charts</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/graph_peity.html">Peity Charts</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/graph_sparkline.html">Sparkline Charts</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">邮箱 </span><span class="label label-warning pull-right">16/24</span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/mailbox.html">收件箱</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/mail_detail.html">邮件详情</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/mail_compose.html">发送邮件</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/email_template.html">邮件模板</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/metrics.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">指标</span>  </a>
                  </li>
                  <li>
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/widgets.html"><i class="fa fa-flask"></i> <span class="nav-label">组件</span></a>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/form_basic.html">基本表单</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/form_advanced.html">高级插件</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/form_wizard.html">分步引导</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/form_file_upload.html">文件上传</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/form_editors.html">富文本编辑</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/form_markdown.html">Markdown</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">APP视图</span>  <span class="pull-right label label-primary">SPECIAL</span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/contacts.html">联系方式</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/profile.html">个人信息</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/profile_2.html">个人信息 v.2</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/contacts_2.html">联系方式 v.2</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/projects.html">项目列表</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/project_detail.html">项目详情</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/teams_board.html">团队面板</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/social_feed.html">订阅</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/clients.html">客户信息</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/full_height.html">Outlook</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/vote_list.html">投票</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/file_manager.html">文件管理</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/calendar.html">日历</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/issue_tracker.html">Issue</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/blog.html">博客</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/article.html">文章</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/faq.html">FAQ</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/timeline.html">时间轴</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/pin_board.html">Pin board</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">其他</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/search_results.html">搜索结果</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/lockscreen.html">锁屏</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/invoice.html">发票</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/login.html">登录</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/login_two_columns.html">登录 v.2</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/forgot_password.html">忘记密码</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/register.html">注册</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/404.html">404</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/500.html">500</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/empty_page.html">空白页面</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-globe"></i> <span class="nav-label">杂七杂八</span><span class="label label-info pull-right">NEW</span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/toastr_notifications.html">通知</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/nestable_list.html">嵌套列表</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/agile_board.html">TO-DO LIST</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/timeline_2.html">时间轴 v.2</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/diff.html">文件对比</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/i18support.html">国际化</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/sweetalert.html">弹出框</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/idle_timer.html">计时器</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/truncate.html">截断...</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/spinners.html">菊花</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/tinycon.html">favicon</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/google_maps.html">谷歌地图</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/code_editor.html">代码</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/modal_window.html">模态对话框</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/clipboard.html">剪贴板</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/forum_main.html">论坛</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/validation.html">JS验证</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/tree_view.html">树</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/loading_buttons.html">加载按钮</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/chat_view.html">聊天</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/masonry.html">瀑布流</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/tour.html">教程</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">UI</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/typography.html">段落</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/icons.html">Icons</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/draggable_panels.html">拖拽面板</a></li> <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/resizeable_panels.html">调整大小面板</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/buttons.html">按钮</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/video.html">视频</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/tabs_panels.html">面板</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/tabs.html">Tabs</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/notifications.html">通知 & Tooltips</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/badges_labels.html">徽章, Labels, 进度条</a></li>
                      </ul>
                  </li>

                  <li>
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/grid_options.html"><i class="fa fa-laptop"></i> <span class="nav-label">网格</span></a>
                  </li>
                  <li class="active">
                      <a href="#"><i class="fa fa-table"></i> <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/table_basic.html">静态表格</a></li>
                          <li class="active"><a href="table.jsp">动态表格</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/table_foo_table.html">高级表格</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/jq_grid.html">jqGrid</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i> <span class="nav-label">电子商务</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/ecommerce_products_grid.html">产品-网格</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/ecommerce_product_list.html">产品-列表</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/ecommerce_product.html">产品-编辑</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/ecommerce_product_detail.html">产品-详情</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/ecommerce-cart.html">购物车</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/ecommerce-orders.html">订单</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/ecommerce_payments.html">信用卡</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">画廊</span><span class="fa arrow"></span></a>
                      <ul class="nav nav-second-level collapse">
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/basic_gallery.html">灯箱</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/slick_carousel.html">旋转木马</a></li>
                          <li><a href="../../../../../../../FrontTool/INSPINIA_v2.5/carousel.html">Bootstrap 轮播</a></li>

                      </ul>
                  </li>
                  <li>
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
                  </li>
                  <li>
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画 </span><span class="label label-info pull-right">62</span></a>
                  </li>
                  <li class="landing_link">
                      <a target="_blank" href="../../../../../../../FrontTool/INSPINIA_v2.5/landing.html"><i class="fa fa-star"></i> <span class="nav-label">着陆页</span> <span class="label label-warning pull-right">NEW</span></a>
                  </li>
                  <li class="special_link">
                      <a href="../../../../../../../FrontTool/INSPINIA_v2.5/package.html"><i class="fa fa-database"></i> <span class="nav-label">框架</span></a>
                  </li>
              </ul>

          </div>
      </nav>

  <div id="page-wrapper" class="gray-bg">
  <div class="row border-bottom">
    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="../../../../../../../FrontTool/INSPINIA_v2.5/search_results.html">
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
                            <a href="../../../../../../../FrontTool/INSPINIA_v2.5/profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="../../../../../../../FrontTool/INSPINIA_v2.5/img/a7.jpg">
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
                            <a href="../../../../../../../FrontTool/INSPINIA_v2.5/profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="../../../../../../../FrontTool/INSPINIA_v2.5/img/a4.jpg">
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
                            <a href="../../../../../../../FrontTool/INSPINIA_v2.5/profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="../../../../../../../FrontTool/INSPINIA_v2.5/img/profile.jpg">
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
                            <a href="../../../../../../../FrontTool/INSPINIA_v2.5/mailbox.html">
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
                        <a href="../../../../../../../FrontTool/INSPINIA_v2.5/mailbox.html">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> 您有 16 条未读通知
                                <span class="pull-right text-muted small">4 分钟 前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="../../../../../../../FrontTool/INSPINIA_v2.5/profile.html">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 个新粉丝
                                <span class="pull-right text-muted small">12 分钟 前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="../../../../../../../FrontTool/INSPINIA_v2.5/grid_options.html">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> 服务器重启
                                <span class="pull-right text-muted small">4 分钟 前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block">
                            <a href="../../../../../../../FrontTool/INSPINIA_v2.5/notifications.html">
                                <strong>查看更多通知</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </li>
                </ul>
            </li>


            <li>
                <a href="../../../../../../../FrontTool/INSPINIA_v2.5/login.html">
                    <i class="fa fa-sign-out"></i> 退出登录
                </a>
            </li>
    </ul>
 </nav>
        </div>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>动态表格</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="../../../../../../../FrontTool/INSPINIA_v2.5/index.html">首页</a>
                        </li>
                        <li>
                            <a>表格</a>
                        </li>
                        <li class="active">
                            <strong>动态表格</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>具有响应插件的基本数据表示例</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">配置选项 1</a>
                                </li>
                                <li><a href="#">配置选项 2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    <thead>
                    <tr>
                        <th>渲染引擎</th>
                        <th>浏览器</th>
                        <th>平台</th>
                        <th>引擎版本</th>
                        <th>CSS级</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="gradeX">
                        <td>Trident</td>
                        <td>Internet
                            Explorer 4.0
                        </td>
                        <td>Win 95+</td>
                        <td class="center">4</td>
                        <td class="center">X</td>
                    </tr>
                    <tr class="gradeC">
                        <td>Trident</td>
                        <td>Internet
                            Explorer 5.0
                        </td>
                        <td>Win 95+</td>
                        <td class="center">5</td>
                        <td class="center">C</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Trident</td>
                        <td>Internet
                            Explorer 5.5
                        </td>
                        <td>Win 95+</td>
                        <td class="center">5.5</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Trident</td>
                        <td>Internet
                            Explorer 6
                        </td>
                        <td>Win 98+</td>
                        <td class="center">6</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Trident</td>
                        <td>Internet Explorer 7</td>
                        <td>Win XP SP2+</td>
                        <td class="center">7</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Trident</td>
                        <td>AOL browser (AOL desktop)</td>
                        <td>Win XP</td>
                        <td class="center">6</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Firefox 1.0</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Firefox 1.5</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Firefox 2.0</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Firefox 3.0</td>
                        <td>Win 2k+ / OSX.3+</td>
                        <td class="center">1.9</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Camino 1.0</td>
                        <td>OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Camino 1.5</td>
                        <td>OSX.3+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Netscape 7.2</td>
                        <td>Win 95+ / Mac OS 8.6-9.2</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Netscape Browser 8</td>
                        <td>Win 98SE+</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Netscape Navigator 9</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.0</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.1</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.1</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.2</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.2</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.3</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.3</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.4</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.4</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.5</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.5</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.6</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.6</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.7</td>
                        <td>Win 98+ / OSX.1+</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Mozilla 1.8</td>
                        <td>Win 98+ / OSX.1+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Seamonkey 1.1</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Gecko</td>
                        <td>Epiphany 2.20</td>
                        <td>Gnome</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Webkit</td>
                        <td>Safari 1.2</td>
                        <td>OSX.3</td>
                        <td class="center">125.5</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Webkit</td>
                        <td>Safari 1.3</td>
                        <td>OSX.3</td>
                        <td class="center">312.8</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Webkit</td>
                        <td>Safari 2.0</td>
                        <td>OSX.4+</td>
                        <td class="center">419.3</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Webkit</td>
                        <td>Safari 3.0</td>
                        <td>OSX.4+</td>
                        <td class="center">522.1</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Webkit</td>
                        <td>OmniWeb 5.5</td>
                        <td>OSX.4+</td>
                        <td class="center">420</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Webkit</td>
                        <td>iPod Touch / iPhone</td>
                        <td>iPod</td>
                        <td class="center">420.1</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Webkit</td>
                        <td>S60</td>
                        <td>S60</td>
                        <td class="center">413</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera 7.0</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera 7.5</td>
                        <td>Win 95+ / OSX.2+</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera 8.0</td>
                        <td>Win 95+ / OSX.2+</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera 8.5</td>
                        <td>Win 95+ / OSX.2+</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera 9.0</td>
                        <td>Win 95+ / OSX.3+</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera 9.2</td>
                        <td>Win 88+ / OSX.3+</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera 9.5</td>
                        <td>Win 88+ / OSX.3+</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Opera for Wii</td>
                        <td>Wii</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Nokia N800</td>
                        <td>N800</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Presto</td>
                        <td>Nintendo DS browser</td>
                        <td>Nintendo DS</td>
                        <td class="center">8.5</td>
                        <td class="center">C/A<sup>1</sup></td>
                    </tr>
                    <tr class="gradeC">
                        <td>KHTML</td>
                        <td>Konqureror 3.1</td>
                        <td>KDE 3.1</td>
                        <td class="center">3.1</td>
                        <td class="center">C</td>
                    </tr>
                    <tr class="gradeA">
                        <td>KHTML</td>
                        <td>Konqureror 3.3</td>
                        <td>KDE 3.3</td>
                        <td class="center">3.3</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeA">
                        <td>KHTML</td>
                        <td>Konqureror 3.5</td>
                        <td>KDE 3.5</td>
                        <td class="center">3.5</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeX">
                        <td>Tasman</td>
                        <td>Internet Explorer 4.5</td>
                        <td>Mac OS 8-9</td>
                        <td class="center">-</td>
                        <td class="center">X</td>
                    </tr>
                    <tr class="gradeC">
                        <td>Tasman</td>
                        <td>Internet Explorer 5.1</td>
                        <td>Mac OS 7.6-9</td>
                        <td class="center">1</td>
                        <td class="center">C</td>
                    </tr>
                    <tr class="gradeC">
                        <td>Tasman</td>
                        <td>Internet Explorer 5.2</td>
                        <td>Mac OS 8-X</td>
                        <td class="center">1</td>
                        <td class="center">C</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Misc</td>
                        <td>NetFront 3.1</td>
                        <td>Embedded devices</td>
                        <td class="center">-</td>
                        <td class="center">C</td>
                    </tr>
                    <tr class="gradeA">
                        <td>Misc</td>
                        <td>NetFront 3.4</td>
                        <td>Embedded devices</td>
                        <td class="center">-</td>
                        <td class="center">A</td>
                    </tr>
                    <tr class="gradeX">
                        <td>Misc</td>
                        <td>Dillo 0.8</td>
                        <td>Embedded devices</td>
                        <td class="center">-</td>
                        <td class="center">X</td>
                    </tr>
                    <tr class="gradeX">
                        <td>Misc</td>
                        <td>Links</td>
                        <td>Text only</td>
                        <td class="center">-</td>
                        <td class="center">X</td>
                    </tr>
                    <tr class="gradeX">
                        <td>Misc</td>
                        <td>Lynx</td>
                        <td>Text only</td>
                        <td class="center">-</td>
                        <td class="center">X</td>
                    </tr>
                    <tr class="gradeC">
                        <td>Misc</td>
                        <td>IE Mobile</td>
                        <td>Windows Mobile 6</td>
                        <td class="center">-</td>
                        <td class="center">C</td>
                    </tr>
                    <tr class="gradeC">
                        <td>Misc</td>
                        <td>PSP browser</td>
                        <td>PSP</td>
                        <td class="center">-</td>
                        <td class="center">C</td>
                    </tr>
                    <tr class="gradeU">
                        <td>Other browsers</td>
                        <td>All others</td>
                        <td>-</td>
                        <td class="center">-</td>
                        <td class="center">U</td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                      <th>渲染引擎</th>
                      <th>浏览器</th>
                      <th>平台</th>
                      <th>引擎版本</th>
                      <th>CSS级</th>
                    </tr>
                    </tfoot>
                    </table>
                        </div>

                    </div>
                </div>
            </div>
            </div>
            <div class="row">
            <div class="col-lg-12">
            <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>可编辑的表格在结合Jeditable</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#">配置选项 1</a>
                        </li>
                        <li><a href="#">配置选项 2</a>
                        </li>
                    </ul>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
            <div class="">
            <a onclick="fnClickAddRow();" href="javascript:void(0);" class="btn btn-primary ">添加一个新的行</a>
            </div>
            <table class="table table-striped table-bordered table-hover " id="editable" >
            <thead>
            <tr>
              <th>渲染引擎</th>
              <th>浏览器</th>
              <th>平台</th>
              <th>引擎版本</th>
              <th>CSS级</th>
            </tr>
            </thead>
            <tbody>
            <tr class="gradeX">
                <td>Trident</td>
                <td>Internet
                    Explorer 4.0
                </td>
                <td>Win 95+</td>
                <td class="center">4</td>
                <td class="center">X</td>
            </tr>
            <tr class="gradeC">
                <td>Trident</td>
                <td>Internet
                    Explorer 5.0
                </td>
                <td>Win 95+</td>
                <td class="center">5</td>
                <td class="center">C</td>
            </tr>
            <tr class="gradeA">
                <td>Trident</td>
                <td>Internet
                    Explorer 5.5
                </td>
                <td>Win 95+</td>
                <td class="center">5.5</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Trident</td>
                <td>Internet
                    Explorer 6
                </td>
                <td>Win 98+</td>
                <td class="center">6</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Trident</td>
                <td>Internet Explorer 7</td>
                <td>Win XP SP2+</td>
                <td class="center">7</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Trident</td>
                <td>AOL browser (AOL desktop)</td>
                <td>Win XP</td>
                <td class="center">6</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Firefox 1.0</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="center">1.7</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Firefox 1.5</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Firefox 2.0</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Firefox 3.0</td>
                <td>Win 2k+ / OSX.3+</td>
                <td class="center">1.9</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Camino 1.0</td>
                <td>OSX.2+</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Camino 1.5</td>
                <td>OSX.3+</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Netscape 7.2</td>
                <td>Win 95+ / Mac OS 8.6-9.2</td>
                <td class="center">1.7</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Netscape Browser 8</td>
                <td>Win 98SE+</td>
                <td class="center">1.7</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Netscape Navigator 9</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.0</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">1</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.1</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">1.1</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.2</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">1.2</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.3</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">1.3</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.4</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">1.4</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.5</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">1.5</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.6</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">1.6</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.7</td>
                <td>Win 98+ / OSX.1+</td>
                <td class="center">1.7</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Mozilla 1.8</td>
                <td>Win 98+ / OSX.1+</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Seamonkey 1.1</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Gecko</td>
                <td>Epiphany 2.20</td>
                <td>Gnome</td>
                <td class="center">1.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Webkit</td>
                <td>Safari 1.2</td>
                <td>OSX.3</td>
                <td class="center">125.5</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Webkit</td>
                <td>Safari 1.3</td>
                <td>OSX.3</td>
                <td class="center">312.8</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Webkit</td>
                <td>Safari 2.0</td>
                <td>OSX.4+</td>
                <td class="center">419.3</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Webkit</td>
                <td>Safari 3.0</td>
                <td>OSX.4+</td>
                <td class="center">522.1</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Webkit</td>
                <td>OmniWeb 5.5</td>
                <td>OSX.4+</td>
                <td class="center">420</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Webkit</td>
                <td>iPod Touch / iPhone</td>
                <td>iPod</td>
                <td class="center">420.1</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Webkit</td>
                <td>S60</td>
                <td>S60</td>
                <td class="center">413</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera 7.0</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera 7.5</td>
                <td>Win 95+ / OSX.2+</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera 8.0</td>
                <td>Win 95+ / OSX.2+</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera 8.5</td>
                <td>Win 95+ / OSX.2+</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera 9.0</td>
                <td>Win 95+ / OSX.3+</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera 9.2</td>
                <td>Win 88+ / OSX.3+</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera 9.5</td>
                <td>Win 88+ / OSX.3+</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Opera for Wii</td>
                <td>Wii</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Nokia N800</td>
                <td>N800</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>Presto</td>
                <td>Nintendo DS browser</td>
                <td>Nintendo DS</td>
                <td class="center">8.5</td>
                <td class="center">C/A<sup>1</sup></td>
            </tr>
            <tr class="gradeC">
                <td>KHTML</td>
                <td>Konqureror 3.1</td>
                <td>KDE 3.1</td>
                <td class="center">3.1</td>
                <td class="center">C</td>
            </tr>
            <tr class="gradeA">
                <td>KHTML</td>
                <td>Konqureror 3.3</td>
                <td>KDE 3.3</td>
                <td class="center">3.3</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeA">
                <td>KHTML</td>
                <td>Konqureror 3.5</td>
                <td>KDE 3.5</td>
                <td class="center">3.5</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeX">
                <td>Tasman</td>
                <td>Internet Explorer 4.5</td>
                <td>Mac OS 8-9</td>
                <td class="center">-</td>
                <td class="center">X</td>
            </tr>
            <tr class="gradeC">
                <td>Tasman</td>
                <td>Internet Explorer 5.1</td>
                <td>Mac OS 7.6-9</td>
                <td class="center">1</td>
                <td class="center">C</td>
            </tr>
            <tr class="gradeC">
                <td>Tasman</td>
                <td>Internet Explorer 5.2</td>
                <td>Mac OS 8-X</td>
                <td class="center">1</td>
                <td class="center">C</td>
            </tr>
            <tr class="gradeA">
                <td>Misc</td>
                <td>NetFront 3.1</td>
                <td>Embedded devices</td>
                <td class="center">-</td>
                <td class="center">C</td>
            </tr>
            <tr class="gradeA">
                <td>Misc</td>
                <td>NetFront 3.4</td>
                <td>Embedded devices</td>
                <td class="center">-</td>
                <td class="center">A</td>
            </tr>
            <tr class="gradeX">
                <td>Misc</td>
                <td>Dillo 0.8</td>
                <td>Embedded devices</td>
                <td class="center">-</td>
                <td class="center">X</td>
            </tr>
            <tr class="gradeX">
                <td>Misc</td>
                <td>Links</td>
                <td>Text only</td>
                <td class="center">-</td>
                <td class="center">X</td>
            </tr>
            <tr class="gradeX">
                <td>Misc</td>
                <td>Lynx</td>
                <td>Text only</td>
                <td class="center">-</td>
                <td class="center">X</td>
            </tr>
            <tr class="gradeC">
                <td>Misc</td>
                <td>IE Mobile</td>
                <td>Windows Mobile 6</td>
                <td class="center">-</td>
                <td class="center">C</td>
            </tr>
            <tr class="gradeC">
                <td>Misc</td>
                <td>PSP browser</td>
                <td>PSP</td>
                <td class="center">-</td>
                <td class="center">C</td>
            </tr>
            <tr class="gradeU">
                <td>Other browsers</td>
                <td>All others</td>
                <td>-</td>
                <td class="center">-</td>
                <td class="center">U</td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
              <th>渲染引擎</th>
              <th>浏览器</th>
              <th>平台</th>
              <th>引擎版本</th>
              <th>CSS级</th>
            </tr>
            </tfoot>
            </table>

            </div>
            </div>
            </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2015
            </div>
        </div>

        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/jquery-2.1.1.js"></script>
    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/bootstrap.min.js"></script>
    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/plugins/jeditable/jquery.jeditable.js"></script>

    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/plugins/dataTables/datatables.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/inspinia.js"></script>
    <script src="../../../../../../../FrontTool/INSPINIA_v2.5/js/plugins/pace/pace.min.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function(){
            $('.dataTables-example').DataTable({
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},

                    {extend: 'print',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                    }
                    }
                ]

            });

            /* Init DataTables */
            var oTable = $('#editable').DataTable();

            /* Apply the jEditable handlers to the table */
            oTable.$('td').editable( '../example_ajax.php', {
                "callback": function( sValue, y ) {
                    var aPos = oTable.fnGetPosition( this );
                    oTable.fnUpdate( sValue, aPos[0], aPos[1] );
                },
                "submitdata": function ( value, settings ) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition( this )[2]
                    };
                },

                "width": "90%",
                "height": "100%"
            } );


        });

        function fnClickAddRow() {
            $('#editable').dataTable().fnAddData( [
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row" ] );

        }
    </script>

</body>

</html>
