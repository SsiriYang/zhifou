<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录 - 知否</title>
 <script src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
 <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="styles/register-login.css">
</head>
<body>
	<div id="box"></div>
	<div class="cent-box register-box">
		<div class="cent-box-header">
			<h1 class="main-title hide">知否</h1>
			<h2 class="sub-title">生活热爱分享</h2>
		</div>

		<div class="cont-main clearfix">
			<div class="index-tab">
				<div class="index-slide-nav">
					<a href="login.jsp" class="active">登录</a> <a href="register.jsp">注册</a>
					<div class="slide-bar"></div>
				</div>
			</div>
			<form action="userservlet" method="post" ><!-- onsubmit="return checkall();" -->
				<div class="login form" style="width: 500px; height: 160px;">
					<div class="group" style="width: 500px; height: 160px; border-width: 0px; border-style: solid; border-color: white; border-image: initial; border-radius: 3px;">
						<!-- 邮箱 -->
						<div class="group-ipt email" style="float: left; width: 300px; border-width: 1px; border-style: solid; border-color: rgb(213, 213, 213); border-image: initial; border-radius: 3px;">
							<input required onblur="check_mail(this)" type="text" name="mail" id="email" class="ipt" autocomplete="off" value="" placeholder="邮箱地址" >
							<!-- servlet方法提交 -->	
							<input type="hidden" name="method" value="login" />
						</div>
						<!-- 邮箱验证 -->
						<div style="width: 188px; float: left; height: 50px;line-height: 50px;padding-left: 10px;"
							id="mail_message"></div>
						<!-- 密码 -->	
						<div class="group-ipt password" style="float: left; width: 300px; border-width: 1px; border-style: solid; border-color: rgb(213, 213, 213); border-image: initial; border-radius: 3px;">
							<input required onblur="check_password(this)" type="password" name="password" id="userpassword" class="ipt" autocomplete="off" value="" placeholder="输入您的登录密码" >
						</div>
						<!-- 密码验证 -->
						<div style="width: 188px; float: left; height: 50px;line-height: 50px;padding-left: 10px;"
							id="password_message"></div>
						<!-- 验证码 -->	
						<div class="group-ipt code" style="float: left; width: 300px; border-width: 1px; border-style: solid; border-color: rgb(213, 213, 213); border-image: initial; border-radius: 3px;">
							<input required style="border-top: 0px" onblur="check_checkcode(this)" type="text" name="checkcode" id="code" class="ipt" autocomplete="off" value="" placeholder="输入验证码" > 
							<img src="checkimageservlet" class="imgcode" />
						</div>
						<!-- 验证码验证 -->
						<div style="width: 188px; float: left; height: 50px;line-height: 50px;padding-left: 10px;"
							id="checkcode_message"></div>
					</div>
				</div>
				<div class="button">
					<button type="submit" class="login-btn register-btn" id="button">登录</button>
				</div>
				<div class="remember clearfix">
					<input type="checkbox" name="remember" id="remember" value="true"
						class="pass_status">记住我</label> <label class="forgot-password">
						<a href="javascript:;" onclick="forgetpassword()">忘记密码？</a>
					</label>
				</div>
			</form>
		</div>
	</div>

	<div class="footer">
		<p>知否 - ZhiFou</p>
		<p>
			Designed By ZhiFou & <a href="zrong.me">mycodes.net</a> 2019
		</p>
	</div>
<script>
	var remember = $.cookie("remember");
	if (remember == "true") {//说明 cookie里有用户信息
		var mail = $.cookie("mail");
		var password = $.cookie("password");
		//回填数据到输入框
		$("#email").val(mail);
		$("#userpassword").val(password);
		$("#remember").prop("checked", true);
	} 
</script>
<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>

<script>
	$('.imgcode').hover(function() {
		layer.tips("看不清？点击更换", '.code', {
			time : 6000,
			tips : [ 2, "#3c3c3c" ]
		})
	}, function() {
		layer.closeAll('tips');
	}).click(
			function() {
				$(this).attr('src',
						'checkimageservlet?time=' + new Date().getTime());
			});
	$("#remember-me").click(function() {
		var n = document.getElementById("remember-me").checked;
		if (n) {
			$(".zt").show();
		} else {
			$(".zt").hide();
		}
	});
</script>
	<script>
		/* 更改验证码 */
		/* 	function changeImg(e){
		 e.src="checkimageservlet?time="+new Date().getTime();
		 } */
		function forgetpassword() {
			location.href = "/zhifou/forgetpassword.jsp";

		}
		//邮箱
		function check_mail(e) {
			var email = e.value;
			var emailReg = /^\w+@\w+\.[A-Za-z]{2,3}$/;
			if(email==null || email==""){
				document.getElementById("mail_message").innerHTML = "邮箱不能为空！";
				document.getElementById("mail_message").style.color = "red";
				return false;
			}
			else if(!emailReg.test(email)) {
				document.getElementById("mail_message").innerHTML = "邮箱格式不正确，请检查！";
				document.getElementById("mail_message").style.color = "red";
				return false;
			} else {
				document.getElementById("mail_message").innerHTML = "✔";
				document.getElementById("mail_message").style.color = "green";
				return true;
			}
			
		}
		//密码
		function check_password(e) {
			var password = e.value;
			var passReg = /\w{6,18}/;
			if(password==null || password==""){
				document.getElementById("password_message").innerHTML = "密码不能为空！";
				document.getElementById("password_message").style.color = "red";
				return false;
			}
			else if (!passReg.test(password)) {
				document.getElementById("password_message").innerHTML = "密码格式不正确(6-18位)！";
				document.getElementById("password_message").style.color = "red";
				return false;
			} else {
				document.getElementById("password_message").innerHTML = "✔";
				document.getElementById("password_message").style.color = "green";
				return true;
			}
		}
		document.getElementsByName("password")[0].onfocus = function() {
			check_mail(document.getElementById("email"));
		}

		//验证码
		function check_checkcode(e) {
			var checkcode = e.value;
			if (checkcode == null || checkcode.trim() == "") {
				document.getElementById("checkcode_message").innerHTML = "请输入验证码!";
				document.getElementById("checkcode_message").style.cssText = "color:red;width: 188px; float: left; height: 50px;line-height: 50px;padding-left: 10px;";
				return false;
			} else {
				$.ajax({
					url : "/zhifou/userservlet",
					async : true,
					type : "POST",
					data : {
						"checkcode" : checkcode,
						"method" : "codeCheck"
					},
					success : function(data) {
						if (data == 0) {
							document.getElementById("checkcode_message").innerHTML = "验证码不正确!";
							document.getElementById("checkcode_message").style.cssText = "color:red;width: 188px; float: left; height: 50px;line-height: 50px;padding-left: 10px;";
							return false;
						} else {
							document.getElementById("checkcode_message").innerHTML = "✔";
							document.getElementById("checkcode_message").style.color = "green";
							return true;
						}
					},
					error : function() {
						alert("请求失败");
					},
					dataType : "json"
				});
			}
		}
		document.getElementsByName("checkcode")[0].onfocus = function() {
			var userpassword = document.getElementById("userpassword");
			var email = document.getElementById("email");
			check_mail(email);	
			check_password(userpassword);
		}

		//判断提交条件
 		function checkall() {
			
			//check_password(document.getElementsById("userpassword"));
			//check_mail(document.getElementsById("email"));
			//check_checkcode(document.getElementsById("code"));
			var password = check_password(document.getElementsById("userpassword"));
			//var mail = check_mail(document.getElementsById("email"));
			//var checkcode = check_checkcode(document.getElementsById("code"));		
			if (password) {
				return true;
			}else {
				check_password(document.getElementsById("userpassword"));
				check_mail(document.getElementsById("email"));
				check_checkcode(document.getElementsById("code"));
				return false;
			} 	
		} 
	</script>
</body>
</html>