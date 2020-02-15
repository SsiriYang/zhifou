<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.zhifou.bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN" 
	class="js is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile"
	style="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="X-ZA-Response-Id"
	content="46acde5c53db46f2806ccad726de9826">
<title>个人资料修改</title>
<meta name="apple-itunes-app" content="app-id=432274380">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="mobile-agent"
	content="format=html5;url=https://nowcoder.com/">
<meta id="znonce" name="znonce"
	content="d3edc464cf014708819feffde7ddd01e">
<link rel="search" type="application/opensearchdescription+xml"
	href="https://nowcoder.com/static/search.xml" title="牛客">
<link rel="stylesheet" href="styles/index.css">
<link rel="stylesheet" href="styles/gdt-style.css">
<link rel="stylesheet"  href="bootstrap-3.3.7/css/bootstrap.css"/>
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.js"></script>
<style>
.zm-item-answer-author-info a.collapse {
	margin-top: 0
}
</style>

</head>
<body class="zhi ">
	<%@ include file="top.jsp"%>
	
    <p class="lead">
				<strong>个人信息修改：</strong> 
			</p>
			<!--表单开始-->
			<form class="form-horizontal" role="form" action="personalmessageservlet?method=modifyData" method="post" enctype="multipart/form-data" >
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label" >用户名</label>
					
					<div class="col-sm-4">
						<input type="text" class="form-control" id="username" name="username" value="${user.username}"
							   placeholder="用户名">
					</div>
				</div>
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="userpassword" name="userpassword"  value="${user.userpassword}"
							   placeholder="张三">
					</div>
				</div>

				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="usermail" name="usermail"  value="${user.usermail}">
					</div>				
				</div> 
				
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">个人签名</label>
					<div class="col-sm-4">
						<textarea rows="3" cols="50"  name="usermeans" id="usermeans" >${user.usermeans}</textarea>
					</div>			
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">更换头像</label>
					<div class="col-sm-4">
						<input type="file" id="userphoto" name="file" />
					</div>			
				</div>
   
				
 
				<div class="form-group">	
					<button style="margin-left: 210px " type="submit" class="btn btn-primary"  value="确认修改">确认修改</button>				
				</div>  			
		    </form>	
		</div>
	</div>
</div>
			<!--弹出层-->
            <div class="modal fade" id="modal-container-751906" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										修改个人信息
									</h4>
								</div>
								<div class="modal-body">
									<form  action="" method="post">
					                    <div class="form-group">
					                        <label for="recipient-name" class="control-label">字段1:</label>
					                        <input type="text" class="form-control" id="recipient-name">
					                    </div>
					                    <div class="form-group">
					                        <label for="message-text" class="control-label">字段2:</label>
					                        <input type="text" class="form-control" id="recipient-name">
					                    </div>
					                    <div class="form-group">
					                        <label for="message-text" class="control-label">字段3:</label>
					                        <input type="text" class="form-control" id="recipient-name">
					                    </div>
					                    <div class="form-group">
					                        <label for="message-text" class="control-label">字段4:</label>
					                        <input type="text" class="form-control" id="recipient-name">
					                    </div>
					                </form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> 
									<button type="submit" class="btn btn-primary">修改</button>
								</div>
								</form>
							</div>
		
						</div>
		
		    </div>
 			<!--弹出层结束-->

   
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
 function upload(){ 
	var username = document.getElementById("username").value;
	var userpassword = document.getElementById("userpassword").value;
	var usermail = document.getElementById("usermail").value;
	var userphoto = document.getElementById("userphoto").value;
	var usermeans = document.getElementById("usermeans").value; */
	 $.ajax({
		url:"/zhifou/personalmessageservlet",
		async:true,
		type:"POST",
		data:{"username":username,"userpassword":userpassword,"usermail":usermail,"userphoto":userphoto,"usermeans":usermeans,"method":"uploadpersonalmessage"},
		success:function(data){
			if (data == 1) {
				alert("信息修改成功");
			} else {
				alert("信息修改失败");
			}
		},
		error:function(){
			alert("请求失败");
		},
		dataType:"text"				
	});  
} 

</script>
</html>