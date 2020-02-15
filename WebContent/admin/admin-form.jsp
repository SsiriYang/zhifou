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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/css/bootstrap.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/toastr/toastr.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/toastr/toastr.min.js"></script>
</head>
<body>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

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
					管理员:${admin.adminname}<span class="am-icon-caret-down"></span>
			</a>
				<ul class="am-dropdown-content">
					<li><a href="${pageContext.request.contextPath}/admin/admin-user.jsp"><span class="am-icon-user"></span> 资料</a></li>
					<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
					<li><a href="/zhifou/adminservlet?method=adminexit"><span class="am-icon-power-off"></span> 退出</a></li>
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
						class="am-icon-table"></span> 待审核问题</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/admin-form.jsp"><span
						class="am-icon-pencil-square-o"></span> 增加业务</a></li>
			</ul>

			<div class="am-panel am-panel-default admin-sidebar-panel">
				<div class="am-panel-bd">
					<p>
						<span class="am-icon-bookmark"></span> 最新公告
					</p>
					<p id="noticet">&nbsp;&nbsp;${newnotice.noticetitle}</p>
					<p id="noticec">&nbsp;&nbsp;${newnotice.noticecontent}</p>
					<p id="noticep">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${newnotice.noticerelease}</p>
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
					<strong class="am-text-primary am-text-lg">业务</strong> / <small>Business</small>
				</div>
			</div>

			<div class="am-tabs am-margin" data-am-tabs>
				<ul class="am-tabs-nav am-nav am-nav-tabs">
					<li><a href="#tab2">发布公告</a></li>
					<li><a href="#tab3" onclick="categorymanage()">类型管理</a></li>
				</ul>

				<div class="am-tabs-bd">
					<div class="am-tab-panel am-fade" id="tab2">
						<form class="am-form">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">公告标题*</div>
								<div class="am-u-sm-4">
									<input  id="noticetitle" onblur="checktitle(this)"  type="text" class="am-input-sm" value=""
										name="noticetitle">
									<input type="hidden" value="method" name="notice">
								</div>
								<div id="titlemassage" class="am-u-sm-6"></div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">管理员*</div>
								<div class="am-u-sm-4">
									<input id="noticeproposer" onfocus="focustitle()" onblur="checkproposer(this)" type="text" class="am-input-sm" name="noticeproposer" value="">
								</div>
								<div id="proposermassage" class="am-u-sm-6"></div>
							</div>

							<div class="am-g am-margin-top-sm">
								<div class="am-u-sm-2 am-text-right">内容描述*</div>
								<div class="am-u-sm-10">
									<textarea name="noticecontent" onfocus="focustitlepro()" id="noticecontent" onblur="checkcontent(this)"  rows="10" placeholder="请使用富文本编辑插件" ></textarea>
								</div>
							</div>
							<div class="am-margin" style="margin-left: 140px">
								<!-- <input type="submit" class="am-btn am-btn-primary am-btn-xs" onclick="addnotice(this)" value="提交保存" /> -->
								<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="addnotice()">提交保存</button>
    							<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="noaddnotice()">放弃保存</button>
							</div>
						</form>	
					</div>

					<div class="am-tab-panel am-fade" id="tab3">
							<div class="am-g am-margin-top-sm">
								<div class="am-u-sm-2 am-text-right">新增类型:</div>
								<div class="am-u-sm-4 am-u-end">
									<input type="text" class="am-input-sm" onkeyup="checknewcategory(this)" id="addcategory" value="" name="newcategory">
								</div>
								<div id="categorymassage" class="am-u-sm-6"></div>
							</div>
							<div class="am-g am-margin-top-sm" style="width:500px;margin-left: 125px;height: 400px;overflow:scroll; ">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>序号</th>
											<th>问题类型</th>
										</tr>
									</thead>
									<tbody id="tbody">
										
									</tbody>
								</table>
								
							</div>
							<div class="am-margin" style="margin-left: 125px">
									<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="addcategory()">提交保存</button>
    								<button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="cancel()">放弃保存</button>
								</div>
					</div>				
				</div>
			</div>


		</div>
		<!-- content end -->

	</div>


	<footer>
	<hr>
	<p class="am-padding-left">© 2019 AllMobilize, Inc. Licensed under
		MIT license.</p>
	</footer>

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/amazeui.min.js"></script>
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
/* 	toastr.options.positionClass = 'toast-top-center'; */
</script>
<script type="text/javascript">
//发布公告
	function addnotice(){
		var noticetitle = document.getElementById("noticetitle").value;
		var noticeproposer = document.getElementById("noticeproposer").value;
		var noticecontent = document.getElementById("noticecontent").value;
		if(checkall()){
			$.ajax({
				url:"/zhifou/adminservlet",
				async:true,
				type:"POST",
				data:{"method":"notice","noticetitle":noticetitle,"noticecontent":noticecontent,"noticeproposer":noticeproposer},
				success:function(data){
					if (data!=null) {
						document.getElementById("noticet").innerHTML="&nbsp;&nbsp;"+data.noticetitle;
						document.getElementById("noticec").innerHTML="&nbsp;&nbsp;"+data.noticecontent;
						document.getElementById("noticep").innerHTML="&nbsp;&nbsp;"+noticeproposer+"----"+data.noticerelease;
						
						document.getElementById("noticetitle").value = "";
						document.getElementById("noticeproposer").value = "";
						document.getElementById("noticecontent").value = "";
						document.getElementById("proposermassage").innerHTML = "";
						document.getElementById("titlemassage").innerHTML = "";
						toastr.success('公告发布成功');
					}
				},
				error:function(){
					alert("请求失败");
				},
				dataType:"json"				
			});  
		}else{
			checktitle(document.getElementsByName("noticetitle")[0]);
			checkproposer(document.getElementsByName("noticeproposer")[0]);
			checkcontent(document.getElementByName("noticecontent")[0]);
			toastr.warning('公告发布失败');
		}
		
	}
	//放弃发布公告
	function noaddnotice(){
		document.getElementById("noticetitle").value = "";
		document.getElementById("noticeproposer").value = "";
		document.getElementById("noticecontent").value = "";
		document.getElementById("proposermassage").innerHTML = "";
		document.getElementById("titlemassage").innerHTML = "";
	}
	//问题类型管理
	function categorymanage(){
		var content = "";  
		$.ajax({
			url:"/zhifou/adminservlet",
			async:true,
			type:"POST",
			data:{"method":"categorymanage"},
			success:function(data){
				if (data.length > 0) {
					for (var i = 0; i < data.length; i++) {
						content += "<tr><th>"+(i+1)+"</th><th>"+data[i].categoryname+"</th></tr>";
					}
					$("#tbody").html(content);
					document.getElementById("addcategory").value = "";
					document.getElementById("categorymassage").innerHTML = "";
				}
			},
			error:function(){
				alert("请求失败");
			},
			dataType:"json"				
		});
	}
	//添加问题类型
	function addcategory(){
		if(checknewcategory(document.getElementsByName("newcategory")[0])){
			var content = "";
			$.ajax({
				url:"/zhifou/adminservlet",
				async:false,
				type:"POST",
				data:{"method":"addcategory","newcategory":document.getElementById("addcategory").value},
				success:function(data){
					document.getElementById("addcategory").value = "";
					document.getElementById("categorymassage").innerHTML = "";
					categorymanage();
/* 					content += "<tr><th name='number'>"+document.getElementById("number").innerHTML+"</th><th>"+data[i].categoryname+"</th></tr>";
 */				toastr.success('问题类型添加成功');
 				},
				error:function(){
					alert("请求失败");
				},
				dataType:"text"				
			});
		}else{
			checknewcategory(document.getElementsByName("newcategory")[0]);
			toastr.warning('问题类型添加失败');
		}
		
	}
	//检查问题类型（表单）
	function checknewcategory(e){
		var newcategory = e.value;
		if(newcategory == null || newcategory.trim() == ""){
			document.getElementById("categorymassage").innerHTML = "请填写新加类型！";
			document.getElementById("categorymassage").style.color = "red";
			return false;
		}else{
			$.ajax({
				url:"/zhifou/adminservlet",
				async:true,
				type:"POST",
				data:{"newcategory":newcategory,"method":"checknewcategory"},
				success:function(data){
					if (data == 1) {
						document.getElementById("categorymassage").innerHTML = "该类型已存在！";
						document.getElementById("categorymassage").style.color = "red";
						toastr.warning('请检查字段');
					} else {
						document.getElementById("categorymassage").innerHTML = "✔";
						document.getElementById("categorymassage").style.color = "green";
					}
				},
				error:function(){
					alert("请求失败");
				},
				dataType:"json"				
			});
			return true;
		}
	}
	//放弃问题类型添加
	function cancel() {
		document.getElementById("addcategory").value = "";
		document.getElementById("categorymassage").innerHTML = "";
	}
	
	
	
	
	//检查公告标题
	function checktitle(e){
		var title = e.value;
		if(title == null || title.trim() == ""){
			document.getElementById("titlemassage").innerHTML = "用户名不能为空！";
			toastr.warning('请检查字段');
			document.getElementById("titlemassage").style.color = "red";
			return false;
		}else{
			$.ajax({
				url:"/zhifou/adminservlet",
				async:true,
				type:"POST",
				data:{"title":title,"method":"checktitle"},
				success:function(data){
					if (data == 1) {
						document.getElementById("titlemassage").innerHTML = "该标题已存在！";
						toastr.warning('请检查字段');
						document.getElementById("titlemassage").style.color = "red";
					} else {
						document.getElementById("titlemassage").innerHTML = "✔";
						document.getElementById("titlemassage").style.color = "green";
					}
				},
				error:function(){
					alert("请求失败");
				},
				dataType:"json"				
			});
			return true;
		}
	}
	//检查公告管理员
	function checkproposer(e){
		var proposer = e.value;
		if(proposer == null || proposer.trim() == ""){
			document.getElementById("proposermassage").innerHTML = "管理员不能为空！";
			toastr.warning('请检查字段');
			document.getElementById("proposermassage").style.color = "red";
			return false;
		}else{
			$.ajax({
				url:"/zhifou/adminservlet",
				async:true,
				type:"POST",
				data:{"proposer":proposer,"method":"checkproposer"},
				success:function(data){
					if (data == 1) {
						document.getElementById("proposermassage").innerHTML = "✔";
						document.getElementById("proposermassage").style.color = "green";
					} else {
						document.getElementById("proposermassage").innerHTML = "管理员不存在";
						toastr.warning('请检查字段');
						document.getElementById("proposermassage").style.color = "red";
					}
				},
				error:function(){
					alert("请求失败");
				},
				dataType:"json"				
			});
			return true;
		}
		
	}
	function focustitle(){
		checktitle(document.getElementsByName("noticetitle")[0]);
	}
	//检查公告内容
	function checkcontent(e){
		var content = e.value;
		if(content == null || content.trim() == ""){
			document.getElementById("noticecontent").placeholder = "公告内容不能为空！";
			toastr.warning('请检查字段');
			
			return false;
		}
		return true;
		checktitle(document.getElementsByName("noticetitle")[0]);
		checkproposer(document.getElementsByName("noticeproposer")[0]);
	}
	function focustitlepro(){
		checktitle(document.getElementsByName("noticetitle")[0]);
		checkproposer(document.getElementsByName("noticeproposer")[0]);
	}
	//判断提交条件
	function checkall(){
		var title = checktitle(document.getElementsByName("noticetitle")[0]);
		var proposer = checkproposer(document.getElementsByName("noticeproposer")[0]);
		var content = checkcontent(document.getElementsByName("noticecontent")[0]);
		if(title && proposer && content){
			return true;
		}
		return false;
	}
</script>
</html>
