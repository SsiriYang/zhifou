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
<title>个人中心</title>
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
<link href="styles/styles.css" rel="stylesheet">
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
	<br /><br />
 <div class="mainContent">
    <aside>
     
      <div class="avatar">
      <img src="${otherUser.userphoto}" width="160px" height="160px"/>    
                 
      </div>
    
      <section class="topspaceinfo">
      <c:if test="${user.userid==otherUser.userid }">
      		<h1 ><a style="color:white" href="/zhifou/ModifyData.jsp">修改资料</a></h1>
      	</c:if>
        <h1>个人签名</h1>
        <p>${otherUser.usermeans }</p>
      </section>
      
     
    </aside>
    <div class="blogitem">
      <article>
        <h2 class="title"><a href="personalmessageservlet?method=personalAnswer" }>我回答的问题：</a></h2>
        <c:forEach items="${answers}" varStatus="status" var="item">
										<div class="feed-main">
											
											<div class="feed-content" data-za-module="AnswerItem">
												<h2 class="feed-title" style="font-size: 25px">
													<a class="question_link" target="_blank"
														href="/zhifou/recommend?method=showQuestionDetail&questionid=${item.questionid }">${item.questiontitle }</a>
												</h2>
												<div class="feed-question-detail-item">
													<div class="question-description-plain zm-editable-content"></div>
												</div>
												<div class="expandable entry-body">
													<!-- <link itemprop="url" href="/question/19857995/answer/13174385">
		                                            <meta itemprop="answer-id" content="389034">
		                                            <meta itemprop="answer-url-token" content="13174385"> -->
													
											
													<div class="zm-item-answer-author-info">
														<a class="author-link" data-tip="p$b$amuro1230"
															target="_blank"
															>${item.username }</a>
														<span title="${item.usermeans }" class="bio">，${item.usermeans }</span>
													</div>
						 					
													<div class="zm-item-rich-text expandable js-collapse-body"
														data-resourceid="123114" data-action="/answer/content"
														data-author-name="${item.username }"
														data-entry-url="/question/19857995/answer/13174385">
														<textarea hidden="" class="content"></textarea>
														<div class="zh-summary summary clearfix">
														<p class="answercontent">${item.answercontent}</p> 
															<a href="/zhifou/recommend?method=showAnswerDetail&answerid=${item.answerid }"
																class="toggle-expand">显示全部</a>
														</div>
														<p class="visible-expanded">
															<a  class="answer-date-link meta-item"
																data-tip="s$t$发布于 2011-09-23" target="_blank">编辑于
																${item.answertime }</a>
														</p>
													</div>
												</div>
												
											</div>
										</div>
									</c:forEach>
      </article> 
    
    </div>
 </div>
</body>	
</html>