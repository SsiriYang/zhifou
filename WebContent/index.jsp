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
<title>首页 - 知否</title>
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
					<i class="zg-icon zg-icon-feedlist"></i>最新动态 <input type="hidden"
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
								<c:forEach items="${userindexs}" varStatus="status" var="item">
										<div class="avatar">
											<a title="${item.username }" data-tip="p$t$amuro1230"
												class="zm-item-link-avatar" target="_blank"
												href="/zhifou/recommend?method=findUserCenter&userid=${item.userid }"> <img
												src="${item.userphoto }"
												class="zm-item-img-avatar"></a>
										</div>
										<div class="feed-main">
											<div class="feed-source" data-za-module="FeedSource">
												热门回答，来自 <a 
													data-tip="t$t$19562033" data-token="19562033"
													data-topicid="3946" >${item.categoryname }</a>
												
											</div>
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
															href="/zhifou/recommend?method=findUserCenter&userid=${item.userid }">${item.username }</a>
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
												<div class="feed-meta">
													<div
														class="zm-item-meta answer-actions clearfix js-contentActions">
														<div class="zm-meta-panel">
														<c:if test="${item.status==0 }">
															<a onclick="setCollection('${item.answerid}','${item.questionid }')" class="meta-item js-thank"
																	data-thanked="false"> <i class="z-icon-thank"></i>收藏
															</a>
														</c:if>
															<c:if test="${item.status==1 }">
															<a style="color: #337AB7" onclick="setCollection('${item.answerid}','${item.questionid }')" class="meta-item js-thank"
																	data-thanked="false"> <i class="z-icon-thank"></i>已收藏
															</a>
														</c:if>
															
														</div>
													</div>
													
												</div>
											</div>
										</div>
									</c:forEach>
							</div>
							<div class="undo-dislike-options" data-item_id="2">
								此内容将不会在动态中再次显示 <span class="zg-bull">•</span> <a href="#"
									class="meta-item revert">撤销</a> <a href="#"
									class="ignore zu-autohide close"></a>
							</div>
						</div>
					</div>
					<a onclick="showmore()" id="zh-load-more" data-method="next"
						class="zg-btn-white zg-r3px zu-button-more" style="">更多</a>
				</div>
			</div>
		</div>
	</div>
	
	
	<input type="hidden" name="_xsrf"
		value="21aa1c8d254df2899b23ab9afbd62a53">

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

	function showmore(){
		var content="";
		var usermeans = "";
		$.ajax({
			url:"/zhifou/recommend",
			async:false,
			type:"POST",	
			dataType:"json",
			data:{"method":"searchQuestionByPage"},
			success:function(data){
				if(data.length>0){
					 $.each(data,function(index,obj){
						 if(obj.usermeans!=null){
							 usermeans=obj.usermeans;
						 }
						if(obj.status==0){
							content+="<div class='avatar'>"
								+"		<a title='"+obj.username+"' data-tip='p$t$amuro1230'"
								+"			class='zm-item-link-avatar' target='_blank' href='/zhifou/recommend?method=findUserCenter&userid="+obj.userid+"'> <img"
								+"			src='"+obj.userphoto+"'"
								+"			class='zm-item-img-avatar'></a>"
								+"	</div>"
								+"	<div class='feed-main'>"
								+"		<div class='feed-source' data-za-module='FeedSource'>"
								+"			热门回答，来自 <a "
								+"				data-tip='t$t$19562033' data-token='19562033'"
								+"				data-topicid='3946' target='_blank'>"+obj.categoryname+"</a>"
								+"		</div>"
								+"		<div class='feed-content' data-za-module='AnswerItem'>"
								+"			<meta itemprop='answer-id' content='389034'>"
								+"			<meta itemprop='answer-url-token' content='13174385'>"
								+"			<h2 class='feed-title'>"
								+"				<a href='/zhifou/recommend?method=showQuestionDetail&questionid="+obj.questionid+"' class='question_link' target='_blank'>"+obj.questiontitle+"</a>"
								+"			</h2>"
								+"			<div class='feed-question-detail-item'>"
								+"				<div class='question-description-plain zm-editable-content'></div>"
								+"			</div>"
								+"		<div class='zm-item-answer-author-info'>                                                           "
								+"			<a class='author-link' data-tip='p$b$amuro1230'                                                "
								+"				target='_blank'                                                                            "
								+"				href='/zhifou/recommend?method=findUserCenter&userid="+obj.userid+"'>"+obj.username+"</a>"
								+"			<span title='"+obj.usermeans+"' class='bio'>，"+obj.usermeans+"</span>                       "
								+"		</div>                                                                                             "
								+"				<div class='zm-item-rich-text expandable js-collapse-body'"
								+"					data-resourceid='123114' data-action='/answer/content'"
								+"					data-author-name='"+obj.username+"'"
								+"					data-entry-url='/question/19857995/answer/13174385'>"
								+"					<textarea hidden='' class='content'></textarea>"
								+"					<div class='zh-summary summary clearfix'><p class='answercontent'>"+obj.answercontent+"</p>"
								+"						<a href='/zhifou/recommend?method=showAnswerDetail&answerid="+obj.answerid+"' class='toggle-expand'>显示全部</a>"
								+"					</div>"
								+"					<p class='visible-expanded'>"
								+"						<a itemprop='url' class='answer-date-link meta-item'"
								+"							data-tip='s$t$发布于 2011-09-23' target='_blank'>编辑于"
								+"							"+obj.answertime+"</a>"
								+"					</p>"
								+"				</div>"
								+"			</div>"
								+"			<div class='feed-meta'>"
								+"				<div"
								+"					class='zm-item-meta answer-actions clearfix js-contentActions'>"
								+"					<div class='zm-meta-panel'>"
								+"						  <a onclick='setCollection("+obj.answerid+","+obj.questionid+")' class='meta-item js-thank'"
								+"							data-thanked='false'> <i class='z-icon-thank'></i>收藏"
								+"						</a>"
								+"						<button class='meta-item item-collapse js-collapse'>"
								+"							<i class='z-icon-fold'></i>收起"
								+"						</button>"
								+"					</div>"
								+"				</div>"
								+"			</div>"
								+"		</div>"
								+"	</div>"
							;
						}else if(obj.status==1){
							content+="<div class='avatar'>"
								+"		<a title='"+obj.username+"' data-tip='p$t$amuro1230'"
								+"			class='zm-item-link-avatar' target='_blank'> <img"
								+"			src='"+obj.userphoto+"'"
								+"			class='zm-item-img-avatar'></a>"
								+"	</div>"
								+"	<div class='feed-main'>"
								+"		<div class='feed-source' data-za-module='FeedSource'>"
								+"			热门回答，来自 <a "
								+"				data-tip='t$t$19562033' data-token='19562033'"
								+"				data-topicid='3946' target='_blank'>"+obj.categoryname+"</a>"
								+"		</div>"
								+"		<div class='feed-content' data-za-module='AnswerItem'>"
								+"			<meta itemprop='answer-id' content='389034'>"
								+"			<meta itemprop='answer-url-token' content='13174385'>"
								+"			<h2 class='feed-title'>"
								+"				<a href='/zhifou/recommend?method=showQuestionDetail&questionid="+obj.questionid+"' class='question_link' target='_blank'>"+obj.questiontitle+"</a>"
								+"			</h2>"
								+"			<div class='feed-question-detail-item'>"
								+"				<div class='question-description-plain zm-editable-content'></div>"
								+"			</div>"
								+"		<div class='zm-item-answer-author-info'>                                                           "
								+"			<a class='author-link' data-tip='p$b$amuro1230'                                                "
								+"				target='_blank'                                                                            "
								+"				href='/zhifou/recommend?method=findUserCenter&userid="+obj.userid+"'>"+obj.username+"</a>"
								+"			<span title='"+obj.usermeans+"' class='bio'>，"+obj.usermeans+"</span>                       "
								+"		</div> "
								+"				<div class='zm-item-rich-text expandable js-collapse-body'"
								+"					data-resourceid='123114' data-action='/answer/content'"
								+"					data-author-name='"+obj.username+"'"
								+"					data-entry-url='/question/19857995/answer/13174385'>"
								+"					<textarea hidden='' class='content'></textarea>"
								+"					<div class='zh-summary summary clearfix'><p class='answercontent'>"+obj.answercontent+"</p>"
								+"						<a href='/zhifou/recommend?method=showAnswerDetail&answerid="+obj.answerid+"' class='toggle-expand'>显示全部</a>"
								+"					</div>"
								+"					<p class='visible-expanded'>"
								+"						<a itemprop='url' class='answer-date-link meta-item'"
								+"							data-tip='s$t$发布于 2011-09-23' target='_blank'>编辑于"
								+"							"+obj.answertime+"</a>"
								+"					</p>"
								+"				</div>"
								+"			</div>"
								+"			<div class='feed-meta'>"
								+"				<div"
								+"					class='zm-item-meta answer-actions clearfix js-contentActions'>"
								+"					<div class='zm-meta-panel'>"
								+"						  <a style='color: #337AB7' onclick='setCollection("+obj.answerid+","+obj.questionid+")' class='meta-item js-thank'"
								+"							data-thanked='false'> <i class='z-icon-thank'></i>已收藏"
								+"						</a>"
								+"						<button class='meta-item item-collapse js-collapse'>"
								+"							<i class='z-icon-fold'></i>收起"
								+"						</button>"
								+"					</div>"
								+"				</div>"
								+"			</div>"
								+"		</div>"
								+"	</div>"
							;
						}
					}); 
				}else{
					$("#zh-load-more").html("已经到底了！！")
				}
				$("#showAll").append(content); 
				
			},
			error:function(){
				alert("没有更多数据！");
			}
		});
	}
	
	function setCollection(answerid,questionid){
		 $.ajax({
			url:"/zhifou/collection",
			type:"post",	
			dataType:"json",
			data:{"method":"addCollection","answerid":answerid,"questionid":questionid},
			success:function(data){
				alert("收藏成功");
				window.location.href="/zhifou/recommend?method=searchQuestionIndex";
			},
			error:function(){
				alert("您已收藏过该回答！可进入我的收藏查看！");
			}
		}); 
	}
	$(function(){
		if('${user}'=='' && '${userindexs}'=='')
		window.location.href="/zhifou/recommend?method=searchQuestionIndex";
	});
	
</script>
</html>