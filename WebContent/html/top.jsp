<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div role="navigation" class="zu-top">
	<div class="zg-wrap modal-shifting clearfix" id="zh-top-inner">
		<a href="/zhifou/recommend?method=searchQuestionIndex"
			class="zu-top-link-logo" id="zh-top-link-logo" data-za-c="view_home"
			data-za-a="visit_home" data-za-l="top_navigation_zhihu_logo">知否</a>
		<div class="top-nav-profile">
			<a href="/zhifou/recommend?method=searchQuestionIndex"
				class="zu-top-nav-userinfo " id=":0" role="button"
				aria-haspopup="true" aria-activedescendant=""> <span
				class="name">知否</span> <img class="Avatar" src="${user.userphoto }"
				alt="知否"> <span id="zh-top-nav-new-pm"
				class="zg-noti-number zu-top-nav-pm-count"
				style="visibility: hidden" data-count="0"> </span>
			</a>
			<ul class="top-nav-dropdown" id="top-nav-profile-dropdown"
				aria-labelledby=":0">
				<li><a
					href="/zhifou/personalmessageservlet?method=personalAnswer"
					tabindex="-1" id=":1"> <i class="zg-icon zg-icon-dd-home"></i>我的主页
				</a></li>

				<li><a href="/zhifou/msgServlet?method=findMsgByUserId"
					tabindex="-1" id=":2"> <i class="zg-icon zg-icon-dd-pm"></i>收件箱
				</a></li>
				<li><a href="/zhifou/msgServlet?method=findMsgBytoUserId"
					tabindex="-1" id=":2"> <i class="zg-icon zg-icon-dd-pm"></i>发件箱
				</a></li>
				<li><a href="/zhifou/collection?method=getMyCollection"
					tabindex="-1" id=":3"> <i class="zg-icon zg-icon-dd-settings"></i>我的收藏
				</a></li>
				<li><a href="/zhifou/login.jsp" tabindex="-1" id=":4"> <i
						class="zg-icon zg-icon-dd-logout"></i>退出
				</a></li>
			</ul>
		</div>

		<!--提问-->
		<a onclick="searchcategory()" id="modal-578824 zu-top-add-question"
			href="#modal-container-57882" role="button"
			class="zu-top-add-question btn" data-toggle="modal">提问</a>

		<div role="search" id="zh-top-search" class="zu-top-search">
			<form method="get" action="/zhifou/recommend" id="zh-top-search-form"
				class="zu-top-search-form">
				<input type="hidden" name="method" value="searchLikeQuestion">
				<label for="q" class="hide-text">知否搜索</label><input type="text"
					onkeyup="searchWord(this)" class="zu-top-search-input" id="search"
					name="search" autocomplete="off" value=""
					placeholder="搜索你感兴趣的内容..." role="combobox" aria-autocomplete="list">
				<div id="showDiv"
					style="display: none; position: absolute; z-index: 1000; background: #fff; width: 350px; border: 1px solid #6dcff6;">
				</div>
				<button type="submit" class="zu-top-search-button">
					<span class="hide-text">搜索</span><span
						class="sprite-global-icon-magnifier-dark"></span>
				</button>
			</form>
		</div>
		<div id="zg-top-nav" class="zu-top-nav">
			<ul class="zu-top-nav-ul zg-clear">
				<li class="zu-top-nav-li current" id="zh-top-nav-home"><a
					class="zu-top-nav-link"
					href="/zhifou/recommend?method=searchQuestionIndex"
					id="zh-top-link-home" data-za-c="view_home" data-za-a="visit_home"
					data-za-l="top_navigation_home">首页</a></li>

				<li class="top-nav-noti zu-top-nav-li "><a
					class="zu-top-nav-link"
					href="/zhifou/msgServlet?method=findMsgByUserId" role="button"><span></span>消息</a>
				</li>

				<li class="top-nav-noti zu-top-nav-li "><a
					class="zu-top-nav-link"
					href="/zhifou/recommend?method=getAllQuestions" role="button"><span
						class="mobi-arrow"></span>问题</a></li>
			</ul>
			<div class="zu-top-nav-live zu-noti7-popup zg-r5px no-hovercard"
				id="zh-top-nav-live-new" role="popup" tabindex="0">
				<div class="zu-top-nav-live-inner zg-r5px">
					<div class="zu-top-live-icon">&nbsp;</div>
					<div class="zu-home-noti-inner" id="zh-top-nav-live-new-inner">
						<div class="zm-noti7-popup-tab-container clearfix" tabindex="0"
							role="tablist">
							<button class="zm-noti7-popup-tab-item message" role="tab">
								<span class="icon">消息</span>
							</button>
							<button class="zm-noti7-popup-tab-item user" role="tab">
								<span class="icon">用户</span>
							</button>
							<button class="zm-noti7-popup-tab-item thanks" role="tab">
								<span class="icon">赞同和感谢</span>
							</button>
						</div>
					</div>
					<div class="zm-noti7-frame-border top"></div>
					<div class="zm-noti7-frame">
						<div class="zm-noti7-content message zh-scroller"
							style="position: relative; overflow: hidden;">
							<div class="zh-scroller-inner"
								style="height: 100%; width: 150%; overflow: auto;">
								<div class="zh-scroller-content"
									style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
									<div class="zm-noti7-content-inner">
										<div class="zm-noti7-content-body">
											<div class="zm-noti7-popup-loading">
												<span class="noti-spinner-loading"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="zh-scroller-bar-container"
								style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);">
								<div style="-webkit-user-select: none;"></div>
							</div>
							<div class="zh-scroller-bar"
								style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div>
						</div>
						<div class="zm-noti7-content user zh-scroller"
							style="display: none; position: relative; overflow: hidden;">
							<div class="zh-scroller-inner"
								style="height: 100%; width: 150%; overflow: auto;">
								<div class="zh-scroller-content"
									style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
									<div class="zm-noti7-content-inner">
										<div class="zm-noti7-content-body">
											<div class="zm-noti7-popup-loading">
												<span class="noti-spinner-loading"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="zh-scroller-bar-container"
								style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);">
								<div style="-webkit-user-select: none;"></div>
							</div>
							<div class="zh-scroller-bar"
								style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div>
						</div>
						<div class="zm-noti7-content thanks zh-scroller"
							style="display: none; position: relative; overflow: hidden;">
							<div class="zh-scroller-inner"
								style="height: 100%; width: 150%; overflow: auto;">
								<div class="zh-scroller-content"
									style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
									<div class="zm-noti7-content-inner">
										<div class="zm-noti7-content-body">
											<div class="zm-noti7-popup-loading">
												<span class="noti-spinner-loading"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="zh-scroller-bar-container"
								style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -webkit-user-select: none; background: rgb(102, 102, 102);">
								<div style="-webkit-user-select: none;"></div>
							</div>
							<div class="zh-scroller-bar"
								style="position: absolute; right: 2px; top: 2px; opacity: 0.5; width: 6px; border-radius: 3px; cursor: default; -webkit-user-select: none; display: none; background: rgb(0, 0, 0);"></div>
						</div>
					</div>
					<div class="zm-noti7-frame-border bottom"></div>
					<div class="zm-noti7-popup-footer">
						<a href="https://nowcoder.com/notifications"
							class="zm-noti7-popup-footer-all zg-right">查看全部 »</a> <a
							href="https://nowcoder.com/settings/notification"
							class="zm-noti7-popup-footer-set" title="通知设置"><i
							class="zg-icon zg-icon-settings"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!--
            	作者：chenfang
            	时间：2019-06-29
            	描述：弹出层提问
            -->
<div class="container" style="margin: 0 auto">
	<div class="row clearfix">
		<div class="modal fade" id="modal-container-57882" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="/zhifou/ask?method=ask" method="post">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								问题:<input class="form-control" name="questiontitle" type="text" />
							</h4>
						</div>
						<div class="modal-body">
							<div class="add-question-section-title">问题说明（可选）：</div>
							<div id="zh-question-suggest-detail-container"
								class="zm-editable-status-editing">
								<div class="zm-editable-editor-wrap no-toolbar" style="">
									<div class="zm-editable-editor-outer">
										<div class="zm-editable-editor-field-wrap">

											<textarea name="questioncontent" style="width: 100%; height: 100%;" placeholder="问题说明"></textarea>

										</div>
									</div>
								</div>
							</div>
							<!--下拉 列表 -->
							问题类型<br /> <select id="searchcategory" name="categoryid"
								style="border: 1px solid #869FB1; background-color: #FFFFFF; width: 150px; height: 30px; border-radius: 3px;">
								<option value="请选择">请选择</option>
							</select> <br /> <br />
							<!--选择文件-->
							<!-- <input name="questionphoto" type="file" style="border: 1px solid #869FB1;background-color: #FFFFFF;width: 565px;height: 30px;border-radius:3px;"/> -->

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<input type="submit"
								class="zg-r5px zu-question-form-add zg-btn-blue" value="发布" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function searchcategory() {
		$.ajax({
			url : "/zhifou/recommend",
			type : "POST",
			data : {
				"method" : "SearchCategory"
			},
			dataType : "json",
			success : function(data) {
				if (data.length > 0) {
					var content = "";

					$.each(data, function(index, obj) {

						content += "<option value='"+obj.categoryid+"'>"
								+ obj.categoryname + "</option>"
					});
					$("#searchcategory").append(content);
				}
			},
			error : function() {
				alert("请求失败");
			}
		});
	}
	function searchWord(e) {
		$("#showDiv").html("");
		var content = "";
		if (e.value != "" || e.value != null) {
			$
					.ajax({
						url : "/zhifou/recommend",
						async : true,
						type : "POST",
						data : {
							"word" : e.value,
							"method" : "searchword"
						},
						success : function(data) {
							if (data.length > 0) {
								for (var i = 0; i < data.length; i++) {
									content += "<div style='border-color: #6dcff6;width:348px;height:25px;padding:5px;cursor:pointer;overflow: hidden;' onclick='clickFn(this)' onmouseover='overFn(this)' onmouseout='outFn(this)'>"
											+ data[i] + "</div>";
								}
								$("#showDiv").html(content);
								$("#showDiv").css("display", "block");
							}
						},
						error : function() {
							alert("请求失败");
						},
						dataType : "json"
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
		searchLikeQuestion($(e).html());
	}
	//模糊查找
	function searchLikeQuestion(e) {
		location.href = "/zhifou/recommend?method=searchLikeQuestion&search="
				+ e;
	}
</script>

