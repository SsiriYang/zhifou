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
<title>问题列表</title>
<meta name="apple-itunes-app" content="app-id=432274380">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="mobile-agent"
	content="format=html5;url=https://nowcoder.com/">
<meta id="znonce" name="znonce"
	content="d3edc464cf014708819feffde7ddd01e">
<link rel="search" type="application/opensearchdescription+xml"
	href="https://nowcoder.com/static/search.xml" title="知否">
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
	<div class="zg-wrap zu-main clearfix " role="main">
		<div class="zu-main-content">
			<div class="zu-main-content-inner">
				<div class="zg-section" id="zh-home-list-title">
					<i class="zg-icon zg-icon-feedlist"></i>最新问题<input type="hidden"
						id="is-topstory">
				</div>
				<div class="zu-main-feed-con navigable" data-feedtype="topstory"
					id="zh-question-list" data-widget="navigable"
					data-navigable-options="{&quot;items&quot;:&quot;&gt; .zh-general-list .feed-content&quot;,&quot;offsetTop&quot;:-82}">
					<a href="javascript:;" class="zu-main-feed-fresh-button"
						id="zh-main-feed-fresh-button" style="display: none"></a>
					<div id="js-home-feed-list"
						class="zh-general-list topstory clearfix"
						data-init="{&quot;params&quot;: {}, &quot;nodename&quot;: &quot;TopStory2FeedList&quot;}"
						data-delayed="true" data-za-module="TopStoryFeedList">

						<div
							class="feed-item folding feed-item-hook feed-item-2" data-type="a" id="feed-2"
							data-za-module="FeedItem" data-za-index="">
							<div id="showAll" class="feed-item-inner">
								<c:forEach items="${questions}" varStatus="status" var="item">
										
										<div class="feed-main">
							
											<div class="feed-content" data-za-module="AnswerItem">
												<h2 class="feed-title" style="font-size: 25px">
													<a class="question_link" target="_blank"
														href="/zhifou/recommend?method=showQuestionDetail&questionid=${item.questionid }">${item.questiontitle }</a>
												</h2>
												<div class="feed-question-detail-item">
													<div class="question-description-plain zm-editable-content"></div>
												</div>
											</div>
										</div>
									</c:forEach>
							</div>					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="copyright-notification">
		<div class="user-image-container">
			
		</div>
		<div class="tooltip right noty-tooltip">
			<div class="tooltip-arrow arrow"></div>
			<div class="tooltip-inner inner">如需转载，请通过私信或评论联系我</div>
		</div>
	</div>
<!-- 	公告 -->
	<div class="side-bar2"> 
		<div style="height: 320px;width: 220px;">
			<p style="font-size: 30px;text-align: center;color: #FFFFFF;">最新公告</p>
			<p style="font-size: 20px;color: #FFFFFF;line-height: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;${newnotice.noticetitle}</p>	
			<p style="font-size: 20px;color: #FFFFFF;line-height: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;${newnotice.noticecontent}</p>
        	<p style="font-size: 20px;text-align: right;color: #FFFFFF;line-height: 30px;">${newnotice.noticerelease}</p>
		</div>
		
	</div>
	<!-- 右侧悬浮 -->
	<div class="side-bar"> 
		<a href="#" class="icon-qq">QQ在线咨询</a> 
		<a href="" class="icon-chat">微信<div class="chat-tips"><i></i><img style="width:138px;height:138px;" src="images/code.jpg" alt="微信订阅号"></div></a> 
		<a target="_blank" href="" class="icon-blog">微博</a> 
		<a href="mailto:admin@admin.com" class="icon-mail">mail</a> 
	</div>
</body>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

<script type="text/javascript">
	function contentLoad(){
		$(".zh-summary").each(function(i){
		    var divH = $(this).height();
		    var $p = $("p", $(this)).eq(0);
		    while ($p.outerHeight() > divH) {
		        $p.text($p.text().replace(/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/, "..."));
		    };
		});
	}
	$(function(){
		if('${user}'=='' && '${userindexs}'=='')
		window.location.href="/zhifou/recommend?method=searchQuestionIndex";
	});
	
</script>
</html>