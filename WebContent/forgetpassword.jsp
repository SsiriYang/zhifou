<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<title>忘记密码 - 知否</title>
<link rel="stylesheet" type="text/css" href="styles/register-login.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/css/bootstrap.css">
 <script src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
 <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/toastr/toastr.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/toastr/toastr.min.js"></script>
<style type="text/css">
	.toast-center-center {
    	top: 50%;
   		left: 50%;
   		margin-top: -25px;
    	margin-left: -150px;
	}
</style>
</head>
<body>
<div id="box"></div>
<div class="cent-box register-box">
	<div class="cent-box-header">
		<h1>密码找回</h1>
	</div>

	<div class="cont-main clearfix" style="margin-top: 50px">
	<div class="index-tab">
			<div class="index-slide-nav">
				<a href="login.jsp">返回登录</a>
				<a href="register.jsp">注册</a>
								
			</div>
		</div>
		<form action="userservlet" method="post" onsubmit="return checkall()">
			<div class="login form">
				<div class="group">
					<div class="group-ipt email"><!-- onfocus="check_mail(this)" -->
						<input type="text" name="usermail" id="email" class="ipt" autocomplete="off" value=""   placeholder="邮箱地址" required>
						<input type="hidden" name="method" value="forgetpassword" />
						<input type="hidden" name="code" value="0" />
					</div>

					<div class="group-ipt password">
						<input type="password" name="password" id="password" class="ipt" autocomplete="off"  onblur="check_password(this)" value="" placeholder="输入新密码" required>
					</div>
					
<!-- 					<div class="group-ipt password">
						<input type="password" id="password2" class="ipt" autocomplete="off" onblur="check_password2(this)" value="" placeholder="确认新密码" required>
					</div>	 -->	
				</div>
			</div>
			<div class="button">
			<button type="submit" class="login-btn register-btn" id="button">提交</button>
			</div>			
		</form>		

	</div>
</div>

<div class="footer">
	<p>知否 - ZhiFou</p>
	<p>Designed By ZhiFou & <a href="zrong.me">mycodes.net</a> 2019</p>
</div>

<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/css/bootstrap.css">
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
	//邮箱
	function check_mail(e){
		var email = e.value;
		var emailReg=/^\w+@\w+\.[A-Za-z]{2,3}$/;
		if(!emailReg.test(email)){
			toastr.error('邮箱格式不正确！');
			return false;
		}else{
			$.ajax({
				url:"/zhifou/userservlet",
				async:true,
				type:"POST",
				data:{"usermail":email,"method":"usermailcheck"},
				success:function(data){
					if (data == 0) {
						toastr.error('邮箱不存在！');
						return false;
					}else{
						return true;
					}
				},
				error:function(){
					alert("请求失败");
				},
				dataType:"json"				
			}); 
		}
	}
	//密码
	function check_password(e){
		var password = e.value;
		var passReg = /\w{6,18}/;
		if(!passReg.test(password)){
			toastr.error('密码格式不正确！');
			return false;
		}else{
			return true;
		}
	}
	//判断提交条件
	function checkall(){	
		var usermail = check_mail(document.getElementById("email"));
		var password = check_password(document.getElementById("password"));
		if(usermail&&password){
			return true;
		}
		return false;
	} 
	//确认密码
/* 	function check_password2(e){
		var passReg = /\w{6,18}/;
		var password = document.getElementsByName("password")[0].value;
		var checkpassword = e.value;
		if(password!=checkpassword){
			toastr.error('密码不一致！');
		}
	} */

	
</script>

</body>
</html>