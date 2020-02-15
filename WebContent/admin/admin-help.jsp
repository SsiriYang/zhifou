<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>知否后台管理系统</title>
  <meta name="description" content="这是一个form页面">
  <meta name="keywords" content="form">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/admin/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/admin/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Zhifou" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
</head>
<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong></strong> <small>ZhiFou后台管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员:${admin.adminname}<span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="${pageContext.request.contextPath}/admin/admin-user.jsp"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="/zhifou/adminservlet?method=adminexit"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
<!-- sidebar start -->
<div class="admin-sidebar">
   <ul class="am-list admin-sidebar-list">
      <li><a href="${pageContext.request.contextPath}/admin/admin-index.jsp"><span class="am-icon-home"></span> 首页</a></li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 页面模块 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
          <li><a href="${pageContext.request.contextPath}/admin/admin-user.jsp" class="am-cf"><span class="am-icon-check"></span> 个人资料<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <li><a href="${pageContext.request.contextPath}/admin/admin-help.jsp"><span class="am-icon-puzzle-piece"></span> 帮助页</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/admin-gallery.jsp"><span class="am-icon-th"></span> 相册页面<span class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
          <li><a href="${pageContext.request.contextPath}/admin/admin-log.jsp"><span class="am-icon-calendar"></span> 系统日志</a></li>
        </ul>
      </li>
      <li><a href="${pageContext.request.contextPath}/adminservlet?method=questionmanage"><span class="am-icon-table"></span> 问题审核</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/admin-form.jsp"><span class="am-icon-pencil-square-o"></span>增加业务</a></li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span>最新公告</p>
        <p>&nbsp;&nbsp;${newnotice.noticetitle}</p>
        <p>&nbsp;&nbsp;${newnotice.noticecontent}</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${newnotice.noticerelease}</p>
      </div>
    </div>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-tag"></span> Zhifou</p>
        <p>Welcome to the Zhifou!</p>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">帮助页面</strong> / <small>Help Page</small></div>
    </div>

    <hr/>

    <div class="am-g">
      <div class="am-u-sm-12 am-u-sm-centered">
        <h2>Amaze Beta</h2>
        <p>对于 Amaze，我们不是创造者。</p>
        <p>Amaze的诞生，依托于 GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。</p>
        <p>感谢开源！感谢有你！</p>
        <hr/>
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <h3>Bug 反馈</h3>
        <p>感谢对 Amaze 的关注和支持，如遇到 Bug 或者使用问题，可以通过以下途径反馈给我们：</p>
        <ol>
          <li>在 GitHub 项目主页提交 <a href="">Issue</a>。</li>
          <li>在 GitHub 项目主页提交 <a href="">Issue</a>。</li>
        </ol>
        <p>反馈注意事项</p>
        <p>为了能最准确的传达所描述的问题， 建议你在反馈时附上演示，方便我们理解。</p>
        <p>下面的几个链接是我们在几个在线调试工具上建的页面， 已经引入了 Amaze UI 样式和脚本，你可以选择你喜欢的工具【Fork】一份， 把要有问题的场景粘在里面，反馈给我们。</p>
        <ol>
          <li><a href="http://jsbin.com/kijiqu/1/edit?html,output" target="_blank">JSBin</a> </li>
          <li><a href="http://jsfiddle.net/hegfirose/W22fV/" target="_blank">JSFiddle</a> </li>
          <li><a href="http://codepen.io/minwe/pen/AEeup" target="_blank">CodePen</a> </li>
        </ol>
      </div>
    </div>
  </div>
  <!-- content end -->

</div>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>

<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/admin/assets/js/app.js"></script>
</body>
</html>
