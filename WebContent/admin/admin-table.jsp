<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>知否后台管理系统</title>
<meta name="description" content="这是一个 table 页面">
<meta name="keywords" content="table">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/admin/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/admin/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/toastr/toastr.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/toastr/toastr.min.js"></script>
<style type="text/css">
	.toast-center-center {
    	top: 30%;
   		left: 70%;
   		margin-top: -25px;
    	margin-left: -150px;
	}
</style>
</head>
<style>
/* reset webkit search input browser style */
input {
	outline: none;
}
input[type=search] {
	-webkit-appearance: textfield;
	-webkit-box-sizing: content-box;
	font-family: inherit;
	font-size: 100%;
}
input::-webkit-search-decoration,
input::-webkit-search-cancel-button {
	display: none; /* remove the search and cancel icon */
}

/* search input field */
input[type=search] {
	background: #ededed url(admin/images/search-icon.png) no-repeat 9px center;
	border: solid 1px #ccc;
	padding: 9px 10px 9px 32px;
	width: 130px;
	margin-right: 100px;
	
	-webkit-border-radius: 10em;
	-moz-border-radius: 10em;
	border-radius: 10em;
	
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	transition: all .5s;
}
input[type=search]:focus {
	width: 130px;
	background-color: #fff;
	border-color: #6dcff6;
	
	-webkit-box-shadow: 0 0 5px rgba(109,207,246,.5);
	-moz-box-shadow: 0 0 5px rgba(109,207,246,.5);
	box-shadow: 0 0 5px rgba(109,207,246,.5);
}

/* placeholder */
input:-moz-placeholder {
	color: #999;
}
input::-webkit-input-placeholder {
	color: #999;
}

/* demo B */
#demo-b input[type=search] {
	width: 15px;
	padding-left: 10px;
	color: transparent;
	cursor: pointer;
}
#demo-b input[type=search]:hover {
	background-color: #fff;
}
#demo-b input[type=search]:focus {
	width: 130px;
	padding-left: 32px;
	color: #000;
	background-color: #fff;
	cursor: auto;
}
#demo-b input:-moz-placeholder {
	color: transparent;
}
#demo-b input::-webkit-input-placeholder {
	color: transparent;
}


</style>
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
				href="javascript:;"> <span class="am-icon-users"></span> 管理员${admin.adminname}<span
					class="am-icon-caret-down"></span>
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
				<li><a href="${pageContext.request.contextPath}/admin/admin-index.jsp"><span class="am-icon-home"></span>
						首页</a></li>
				<li class="admin-parent"><a class="am-cf"
					data-am-collapse="{target: '#collapse-nav'}"><span
						class="am-icon-file"></span> 页面模块 <span
						class="am-icon-angle-right am-fr am-margin-right"></span></a>
					<ul class="am-list am-collapse admin-sidebar-sub am-in"
						id="collapse-nav">
						<li><a href="${pageContext.request.contextPath}/admin/admin-user.jsp" class="am-cf"><span
								class="am-icon-check"></span> 个人资料<span
								class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
						<%-- <li><a href="${pageContext.request.contextPath}/admin/admin-help.jsp"><span
								class="am-icon-puzzle-piece"></span> 帮助</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/admin-gallery.jsp"><span class="am-icon-th"></span>
								相册<span
								class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
						<li><a href="${pageContext.request.contextPath}/admin/admin-log.jsp"><span
								class="am-icon-calendar"></span> 系统日志</a></li> --%>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/adminservlet?method=questionmanage"><span class="am-icon-table"></span>
						待审核问题</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/admin-form.jsp"><span
						class="am-icon-pencil-square-o"></span> 增加业务</a></li>
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
					<p>
						<span class="am-icon-tag"></span> ZhiFou
					</p>
					<p>Welcome to the ZhiFou</p>
				</div>
			</div>
		</div>
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">问题审核</strong> / <small>Question</small>
				</div>
			</div>

			<div class="am-g">
				<div class="am-u-md-6 am-cf">
					<div class="am-fl am-cf">
						<div class="am-btn-toolbar am-fl">
							<div class="am-btn-group am-btn-group-xs">
								<!-- <button type="button" class="am-btn am-btn-default">
									<span class="am-icon-plus"></span> 新增
								</button>
								<button type="button" class="am-btn am-btn-default">
									<span class="am-icon-save"></span> 保存
								</button> -->
								<button type="button" class="am-btn am-btn-default" onclick="checksome(this)">
									<span class="am-icon-archive"></span> 审核
								</button>
								<button type="button" class="am-btn am-btn-default" onclick="nochecksome(this)">
									<span class="am-icon-trash-o"></span> 删除
								</button>
							</div>

							<div class="am-form-group am-margin-left am-fl" style="margin-top: 5px">
								<select  onchange="issearched(this)" style="font-size: 17px" >
								<option value="" >问题类型</option>
								<c:forEach items="${categorylist}" var="item">
									<option value="${item.categoryid}">${item.categoryname}</option>
								</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm" style="position: relative">
							<input id="search" type="search" placeholder="Search" onkeyup="searchWord(this)" value=""  autocomplete="off" />						
							<div id="showDiv"
								style="display: none; position: absolute; z-index: 1000; background: #fff; width: 170px; border: 1px solid #6dcff6;">
							</div>
							<!-- <input type="text" class="am-form-field" > <span
								class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button">搜索</button>
							</span> -->
						</div>
					</div>
				</div>
			</div>

			<div class="am-g">
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-check"><input onclick="checkall(this)" type="checkbox" /></th>
									<th class="table-id">ID</th>
									<th class="table-title">问题标题</th>
									<th class="table-type">类别</th>
									<th class="table-author">提出者</th>
									<th class="table-date">提出日期</th>
									<th class="table-date">审核状态</th>
									<th class="table-set">操作</th>
								</tr>
							</thead>

							<c:forEach items="${list}" var="items" varStatus="pageid">
								<tbody>
									<tr>
										<td style="vertical-align: middle;"><input name="check" value="${items.questionid}" onclick="checkone(this)" type="checkbox" /></td>
										<td style="vertical-align: middle;" id="questionid">${pageid.count+(currentpage-1)*15}</td>
										<td style="vertical-align: middle;"><a href="#">${items.questiontitle}</a></td>
										<td style="vertical-align: middle;">
											<c:forEach items="${categorylist}" var="item">
												<c:if test="${item.categoryid==items.categoryid}">${item.categoryname}</c:if>
											</c:forEach>
										</td>
										<td style="vertical-align: middle;">
											<c:forEach items="${userlist}" var="item">
												<c:if test="${item.userid==items.questionproposer}">${item.username}</c:if>
											</c:forEach>
										</td>
										<td style="vertical-align: middle;">${items.questionmadetime}</td>
										<c:if test="${items.ispassaudit==1}">
											<td style="color: green;vertical-align: middle;" id="${items.questionid}"><span class="label label-success">通过</span></td>
										</c:if>
										<c:if test="${items.ispassaudit==0}">
											<td style="color: red;vertical-align: middle;" id="${items.questionid}"><span class="label label-danger">未通过</span></td>
										</c:if>
										<td style="vertical-align: middle;">
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<!-- <button
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-pencil-square-o"></span> 编辑
													</button> -->
													<button onclick="ispassaudit(${items.questionid})" type="button"
														class="am-btn am-btn-default am-btn-xs">
														<span class="am-icon-copy"></span>通过
													</button>
													<button onclick="nopassaudit(${items.questionid})" type="button"
														class="am-btn am-btn-default am-btn-xs am-text-danger">
														<span class="am-icon-trash-o"></span> 退回
													</button>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</c:forEach>



						</table>
						<div class="am-cf">
							共${totalquestion}条记录
							<div class="am-fr" style="margin-right: 100px;">
								<ul class="pagination">
									<c:if test="${currentpage==1 }">
										<li class="disabled"><a href="javascript:;">上一页</a></li>
									</c:if>
									<c:if test="${currentpage!=1 }">
										<li><a
											href="${pageContext.request.contextPath}/adminservlet?method=${method}&currentpage=${currentpage==1?1:currentpage-1}&categoryid=${categoryid}&fuzzy=${fuzzy}">上一页</a></li>
									</c:if>
									<c:forEach var="i" begin="1" end="${page}">
										<c:if test="${currentpage==i}">
											<li class="active">
<%-- 											<a href="${pageContext.request.contextPath}/adminservlet?method=${method}&currentpage=${i}&categoryid=${categoryid}">${i}</a>
 --%>											<a><span aria-hidden="true">${i}</span></a>	
											</li>
										</c:if>
										<c:if test="${currentpage!=i}">
											<li><a href="${pageContext.request.contextPath}/adminservlet?method=${method}&currentpage=${i}&categoryid=${categoryid}&fuzzy=${fuzzy}">${i}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${currentpage==page }">
										<li class="disabled"><a href="javascript:;">下一页</a></li>
									</c:if>
									<c:if test="${currentpage!=page }">
										<li><a
											href="${pageContext.request.contextPath}/adminservlet?method=${method}&currentpage=${currentpage==page?page:currentpage+1}&categoryid=${categoryid}&fuzzy=${fuzzy}">下一页</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<hr />
						<p>注: 啊~~~五环，你比四环多一环。啊~~~五环，你比六环多一环。终于有一天，你会修到七环，修到七环，怎么办，你比五环多两环。</p>
					</form>
				</div>

			</div>
		</div>
		<!-- content end -->
	</div>

	<footer>
	<hr>
	<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under
		MIT license.</p>
	</footer>
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/assets/js/amazeui.min.js"></script>
	<!--<![endif]-->
	<script src="${pageContext.request.contextPath}/admin/assets/js/app.js"></script>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": false,
		  "positionClass": "toast-top-center",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "3000",
		  "hideDuration": "1000",
		  "timeOut": "1000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
/* 	toastr.options.positionClass = 'toast-top-center';
	toastr.success('审核成功');
	toastr.warning('审核失败');*/
</script>
<script type="text/javascript">
	function ispassaudit(e){
		$.ajax({
			url:"/zhifou/adminservlet",
			async:true,
			type:"POST",
			data:{"questionid":e,"method":"ispassaudit"},
			success:function(data){
				if (data == 1) {
					document.getElementById(""+e+"").innerHTML="";
					var spa2 = document.createElement("span");
					var pass2 = document.createTextNode("通过");
					spa2.appendChild(pass2);
					spa2.setAttribute("class","label label-success");
					document.getElementById(""+e+"").appendChild(spa2);
					toastr.success('审核成功');
				} else {
					document.getElementById(""+e+"").innerHTML="";
					var spa = document.createElement("span");
					var pass = document.createTextNode("未通过");
					spa.appendChild(pass);
					spa.setAttribute("class","label label-danger");
					document.getElementById(""+e+"").appendChild(spa);
					toastr.warning('审核失败');
				}
			},
			error:function(){
				alert("请求失败");
			},
			dataType:"text"				
		});  
	}
	function nopassaudit(e){
		$.ajax({
			url:"/zhifou/adminservlet",
			async:true,
			type:"POST",
			data:{"questionid":e,"method":"nopassaudit"},
			success:function(data){
				if (data == 1) {
					document.getElementById(""+e+"").innerHTML="";
					var spa = document.createElement("span");
					var pass = document.createTextNode("未通过");
					spa.appendChild(pass);
					spa.setAttribute("class","label label-danger");
					document.getElementById(""+e+"").appendChild(spa);
					toastr.error('退回成功');
				} else {
					document.getElementById(""+e+"").innerHTML="";
					var spa2 = document.createElement("span");
					var pass2 = document.createTextNode("通过");
					spa2.appendChild(pass2);
					spa2.setAttribute("class","label label-success");
					document.getElementById(""+e+"").appendChild(spa2);
					toastr.warning('退回失败');
				}
			},
			error:function(){
				alert("请求失败");
			},
			dataType:"text"				
		});  
	}
	//问题类型选择
	function issearched(e){
		location.href="/zhifou/adminservlet?method=issearched&categoryid="+e.value;
	}
	//全选事件
	function checkall(e){
		var checks = document.getElementsByName("check");
		if(e.checked){
			for (var i = 0; i < checks.length; i++) {
				checks[i].checked = true;			
			}
		}else{
			for (var i = 0; i < checks.length; i++) {
				checks[i].checked = false;			
			}
		}
	}
	//单选事件
	function checkone(e){
		if(e.checked){
			e.checked=true;	
		}else{
			e.checked=false;
		}
		
	}
	//多选通过
	function checksome(e){
		var checks = document.getElementsByName("check");
		for (var i = 0; i < checks.length; i++) {
			if(checks[i].checked){
				ispassaudit(checks[i].value	);
			}
		}
	}
	//多选删除
	function nochecksome(e){
		var checks = document.getElementsByName("check");
		for (var i = 0; i < checks.length; i++) {
			if(checks[i].checked){
				nopassaudit(checks[i].value	);
			}
		}
	}
	//字段检索
	function searchWord(e) {
		$("#showDiv").html("");
		var content = "";
		if(e.value!="" || e.value!=null){
			$.ajax({
				url:"/zhifou/adminservlet",
				async:true,
				type:"POST",
				data:{"word":e.value,"method":"searchword"},
				success:function(data){
					if (data.length > 0) {
						for (var i = 0; i < data.length; i++) {
							content += "<div style='border-color: #6dcff6;width:168px;height:25px;padding:5px;cursor:pointer;overflow: hidden;' onclick='clickFn(this)' onmouseover='overFn(this)' onmouseout='outFn(this)'>"
									+ data[i] + "</div>";
						}
						$("#showDiv").html(content);
						$("#showDiv").css("display", "block");
					}
				},
				error:function(){
					alert("请求失败");
				},
				dataType:"json"				
			});  
		}
	}
	function overFn(obj) {
		$(obj).css("background", "#DBEAF9");
	}
	function outFn(obj) {
		$(obj).css("background", "#fff");
	}

	function clickFn(e) {
		$("#search").val($(e).html());
		$("#showDiv").css("display", "none");
		fuzzysearch($(e).html());
	}
	//模糊查找
	function fuzzysearch(e){
		location.href="/zhifou/adminservlet?method=fuzzysearch&fuzzy="+e;
	}
	
	
/* 	function deleteDiv(e){
		$("#showDiv").css("display", "none");
 		$("#search").val(""); 
	} */
</script>
</html>
