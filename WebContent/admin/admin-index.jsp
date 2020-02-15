<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>知否后台管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/admin/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/admin/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/assets/css/amazeui.min.css" />
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.minjs"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
</head>
<body>

	<header class="am-topbar admin-header">
	<div class="am-topbar-brand">
		<strong></strong> <small>ZhiFou后台管理系统</small>
	</div>

	<button
		class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
		data-am-collapse="{target: '#topbar-collapse'}">
		<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
	</button>

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

		<ul
			class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
			<li><a href="javascript:;"><span class="am-icon-envelope-o"></span>
					收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
			<li class="am-dropdown" data-am-dropdown><a
				class="am-dropdown-toggle" data-am-dropdown-toggle
				href="javascript:;"> <span class="am-icon-users"></span>
					管理员:${admin.adminname} <span class="am-icon-caret-down"></span>
			</a>
				<ul class="am-dropdown-content">
					<li><a
						href="${pageContext.request.contextPath}/admin/admin-user.jsp"><span
							class="am-icon-user"></span> 资料</a></li>
					<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
					<li><a href="/zhifou/adminservlet?method=adminexit"><span
							class="am-icon-power-off"></span> 退出</a></li>
				</ul></li>
		</ul>
	</div>
	</header>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<div class="admin-sidebar">
			<ul class="am-list admin-sidebar-list">
				<li><a
					href="${pageContext.request.contextPath}/admin/admin-index.jsp"><span
						class="am-icon-home"></span> 首页</a></li>
				<li class="admin-parent"><a class="am-cf"
					data-am-collapse="{target: '#collapse-nav'}"><span
						class="am-icon-file"></span> 页面模块 <span
						class="am-icon-angle-right am-fr am-margin-right"></span></a>
					<ul class="am-list am-collapse admin-sidebar-sub am-in"
						id="collapse-nav">
						<li><a
							href="${pageContext.request.contextPath}/admin/admin-user.jsp"
							class="am-cf"><span class="am-icon-check"></span> 个人资料<span
								class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
						<%-- <li><a
							href="${pageContext.request.contextPath}/admin/admin-help.jsp"><span
								class="am-icon-puzzle-piece"></span> 帮助页</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/admin-gallery.jsp"><span
								class="am-icon-th"></span> 相册页面<span
								class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/admin-log.jsp"><span
								class="am-icon-calendar"></span> 系统日志</a></li> --%>
					</ul></li>
				<li><a
					href="${pageContext.request.contextPath}/adminservlet?method=questionmanage"><span
						class="am-icon-table"></span> 问题审核</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/admin-form.jsp"><span
						class="am-icon-pencil-square-o"></span> 增加业务</a></li>
			</ul>

			<div class="am-panel am-panel-default admin-sidebar-panel">
				<div class="am-panel-bd">
					<p>
						<span class="am-icon-bookmark"></span>最新公告
					</p>
					<p>&nbsp;&nbsp;${newnotice.noticetitle}</p>
					<p>&nbsp;&nbsp;${newnotice.noticecontent}</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${newnotice.noticerelease}</p>
				</div>
			</div>

			<div class="am-panel am-panel-default admin-sidebar-panel">
				<div class="am-panel-bd">
					<p>
						<span class="am-icon-tag"></span> Zhifou
					</p>
					<p>Welcome to Zhifou!</p>
				</div>
			</div>
		</div>
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">首页</strong> / <small>一些常用模块</small>
				</div>


			</div>
			<div>
				<span style="font-size: x-large">知否当前在线人数:${onlineCount}</span>
			</div>
			<br> <br> <br>
			<!--  //折线图div-->
			<div "loadData()" id="myLineDiv"
				style="height: 300px; width: 830px; display: inline-block"></div>
		</div>
		<!-- content end -->
	</div>

	<footer>
	<hr>
	<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under
		MIT license.</p>
	</footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
	<!--这个是折现图-->
		function loadData(option) {
			$.ajax({
				type : 'post', //传输类型
				async : false, //同步执行
				url : '/zhifou/ActiveServlet',
				data : {"method":"quearys"},
				dataType : 'json', //返回数据形式为json
				success : function(result) {
					if (result) {
						//初始化xAxis[0]的data
						option.xAxis[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.xAxis[0].data.push(result[i].dateday);
						}
						//初始化series[0]的data
						option.series[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.series[0].data.push(result[i].num);
						}
					}
				},
				error : function(errorMsg) {
					alert("加载数据失败");
				}
			});//AJAX
		}//loadData()

		var myChart = echarts.init(document.getElementById('myLineDiv'));
		var option = {
			title : {
				text : '登陆人数统计'
			},

			tooltip : {
				show : true
			},
			legend : {
				data : [ '人数' ]
			},
			xAxis : [ {
				type : 'category'

			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [ {
				name : '人数',
				type : 'line'
			} ]
		};
		//加载数据到option
		loadData(option);
		//设置option
		myChart.setOption(option);
	</script>
	<script src="assets/js/app.js"></script>
</body>
</html>
