<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>知否后台管理系统</title>
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/admin/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/admin/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/toastr/toastr.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/toastr/toastr.min.js"></script>
</head>
<body>

<header class="am-topbar ${pageContext.request.contextPath}/admin/admin-header">
  <div class="am-topbar-brand">
    <strong></strong> <small>ZhiFou后台管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right ${pageContext.request.contextPath}/admin/admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span><span id = "newadminname">管理员:${admin.adminname}</span><span class="am-icon-caret-down"></span>
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
         <%--  <li><a href="${pageContext.request.contextPath}/admin/admin-help.jsp"><span class="am-icon-puzzle-piece"></span> 帮助页</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/admin-gallery.jsp"><span class="am-icon-th"></span> 相册页面<span class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
          <li><a href="${pageContext.request.contextPath}/admin/admin-log.jsp"><span class="am-icon-calendar"></span> 系统日志</a></li> --%>
        </ul>
      </li>
      <li><a href="${pageContext.request.contextPath}/adminservlet?method=questionmanage"><span class="am-icon-table"></span> 问题审核</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/admin-form.jsp"><span class="am-icon-pencil-square-o"></span> 增加业务</a></li>
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
        <p>Welcome to Zhifou!</p>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        <%-- <div class="am-panel am-panel-default">
          <div class="am-panel-bd">
            <div class="am-g">
              <div class="am-u-md-4">
                <img id="adminphoto" class="am-img-circle am-img-thumbnail" src="${pageContext.request.contextPath}/images/logo.png" alt=""/>
              </div>
              <div class="am-u-md-8">
                <p>你可以使用<a href="#">gravatar.com</a>提供的头像或者使用本地上传头像。 </p>
                <form class="am-form">
                  <div class="am-form-group">
                    <input type="file" id="user-pic">
                    <p class="am-form-help">请选择要上传的文件...</p>
                    <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="changeadmininformation()">保存</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div> --%>

        <!-- <div class="am-panel am-panel-default">
          <div class="am-panel-bd">
            <div class="user-info">
              <p>等级信息</p>
              <div class="am-progress am-progress-sm">
                <div class="am-progress-bar" style="width: 60%"></div>
              </div>
              <p class="user-info-order">当前等级：<strong>LV8</strong> 活跃天数：<strong>587</strong> 距离下一级别：<strong>160</strong></p>
            </div>
            <div class="user-info">
              <p>信用信息</p>
              <div class="am-progress am-progress-sm">
                <div class="am-progress-bar am-progress-bar-success" style="width: 80%"></div>
              </div>
              <p class="user-info-order">信用等级：正常当前 信用积分：<strong>80</strong></p>
            </div>
          </div>
        </div> -->

      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal">
          <div class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
            <div class="am-u-sm-9">
              <input type="text" id="adminname" placeholder="姓名 / Name" value="${admin.adminname}">
              <small>输入你的名字，让我们记住你。</small>
            </div>
            <div id="adminnamemassage" class="am-u-sm-6"></div>
          </div>

          <div class="am-form-group">
            <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
            <div class="am-u-sm-9">
              <input type="email" id="adminmail" placeholder="输入你的电子邮件 / Email" value="${admin.adminmail}">
              <small>邮箱你懂得...</small>
            </div>
            <div id="adminmailmassage" class="am-u-sm-6"></div>
          </div>

          <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">密码 / Password</label>
            <div class="am-u-sm-9">
              <input type="password" id="adminpassword" placeholder="输入你的密码 / Password" value="${admin.adminpassword}">
            </div>
            <div id="adminpasswordmassage" class="am-u-sm-6"></div>
          </div>

          <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
            <div class="am-u-sm-9">
              <textarea class="" rows="5" id="adminintro" placeholder="输入个人简介"></textarea>
              <small>250字以内写出你的一生...</small>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="changeadmininformation()">保存修改</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end -->

</div>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/assets/js/amazeui.min.js"></script>
	<!--<![endif]-->
	<script src="${pageContext.request.contextPath}/admin/assets/js/app.js"></script>
</body>
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
	//修改管理员信息
	function changeadmininformation(){
		var adminname = document.getElementById("adminname").value;
		var adminpassword = document.getElementById("adminpassword").value;
		var adminmail = document.getElementById("adminmail").value;
		$.ajax({
			url:"/zhifou/adminservlet",
			async:true,
			type:"POST",
			data:{"method":"changeadmininformation","adminname":adminname,"adminpassword":adminpassword,"adminmail":adminmail},
			success:function(data){
				if (data==1){
					document.getElementById("newadminname").innerHTML = "管理员:"+adminname;
				 	alert("修改成功");		 	
					/* toastr.success('修改成功'); */
				}else{
					alert("修改失败");
					/* toastr.error('修改失败'); */
				}
			},
			error:function(){
				toastr.warning('请求失败');
			},
			dataType:"text"				
		}); 
		
	}
</script>
</html>
