<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- saved from url=(0039)question/36301524 -->
<html lang="zh-CN" 
	class="js  is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile"
	style="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="X-ZA-Response-Id"
	content="4b3ad1bf1e8045f1a016c31f5fbb40c8">

<title>回答详情页面</title>
<meta name="apple-itunes-app"
	content="app-id=432274380, app-argument=nowcoder://questions/36301524">

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="mobile-agent" content="format=html5;url=">
<meta id="znonce" name="znonce"
	content="8d61d9c6697d4080ab36aa3bdb21b9d8">
<link rel="search" type="application/opensearchdescription+xml" href=""
	title="知否">
<link rel="stylesheet" href="../styles/detail.css">
<link rel="stylesheet" href="../styles/index.css">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="../scripts/instant.e7a17de6.js"></script>
<style type="text/css">
.modal-dialog {
	position: absolute;
	z-index: 99;
	width: 420px;
	max-width: 100%;
	border-radius: 8px;
	border: 1px solid #888;
	box-shadow: 0 0 80px 0 rgba(0, 0, 0, .4);
	background: #fff;
	text-align: left;
	left: 50%;
	margin-left: -275px;
	margin-top: 14%;
	margin-top: 14vh;
}

.zm-meta-panel #dianzan:hover {
	background-color: red;
}
</style>
</head>

<body class="zhi ">
	<%@ include file="top.jsp"%>
	<div class="zg-wrap zu-main clearfix with-indention-votebar"
		id="zh-single-question-page" data-urltoken="36301524" role="main">
		<div class="zu-main-content">
			<div class="zu-main-content-inner">
				<div id="zh-question-title" data-editable="true"
					class="zm-editable-status-normal">
					<h2 class="zm-item-title">
						<a
							href="/zhifou/recommend?method=showQuestionDetail&questionid=${AnswerDetail.questionid }">
							<h2 class="zm-editable-content">${AnswerDetail.questiontitle }</h2>
						</a>
					</h2>
				</div>
				<div id="zh-question-detail"
					class="zm-item-rich-text zm-editable-status-normal"
					data-resourceid="6727688" data-action="/question/detail">
					<div class="zm-editable-content">${AnswerDetail.questioncontent }</div>
				</div>
				<div class="zm-side-section">
					<div class="zm-side-section-inner"
						id="zh-question-side-header-wrap">
						<div class="zh-question-followers-sidebar">
							<div class="zg-gray-normal">
								<a href=""> <strong>${collectnumber }</strong></a>人收藏该回答
							</div>
						</div>
					</div>
				</div>
				<div id="zh-question-answer-wrap" data-pagesize="10"
					class="zh-question-answer-wrapper navigable"
					data-widget="navigable"
					data-navigable-options="{&quot;items&quot;: &quot;&gt;.zm-item-answer&quot;}"
					data-init="{&quot;params&quot;: {&quot;url_token&quot;: 36301524, &quot;pagesize&quot;: 10, &quot;offset&quot;: 0}, &quot;nodename&quot;: &quot;QuestionAnswerListV2&quot;}">
					<div tabindex="-1" class="zm-item-answer  zm-item-expanded"
						data-aid="22162611"
						data-atoken="66862039" data-collapsed="0"
						data-created="1444310527" data-deleted="0" data-helpful="1"
						data-isowner="0" data-copyable="1" data-za-module="AnswerItem">
						<a class="zg-anchor-hidden" name="answer-22162611"></a>
						<div class="answer-head">
							<div class="zm-item-answer-author-info">
								<a class="zm-item-link-avatar avatar-link" 
								href="/zhifou/recommend?method=findUserCenter&userid=${AnswerDetail.userid }"
									target="_blank" data-tip="p$t$yingxiaodao"> <img
									src="${AnswerDetail.userphoto }"
									class="zm-list-avatar avatar"></a> <a class="author-link"
									data-tip="p$t$yingxiaodao" target="_blank" href="">${AnswerDetail.username }</a>
								<span title="${AnswerDetail.usermeans }" class="bio">:${AnswerDetail.usermeans }</span>
							</div>

						</div>
						<div class="zm-item-rich-text expandable js-collapse-body"
							data-resourceid="6727688" data-action="/answer/content"
							data-author-name="${AnswerDetail.username }">
							<div class="zm-editable-content clearfix">
								<p>${AnswerDetail.answercontent }</p>
							</div>
						</div>
						<a class="zg-anchor-hidden ac" name="22162611-comment"></a>
						<div
							class="zm-item-meta answer-actions clearfix js-contentActions">
							<div class="zm-meta-panel">
								<a name="addcomment" href="#modal-container-578824"
									class="meta-item toggle-comment js-toggleCommentBox "
									data-toggle="modal"> <i class="z-icon-comment1"></i>私信
								</a> 
								<c:if test="${AnswerDetail.status==0 }">
									<a
										onclick="setCollection('${AnswerDetail.answerid}','${AnswerDetail.questionid }')"
										class="meta-item js-thank" data-thanked="false"> <i
										class="z-icon-thank"></i>收藏
									</a>
								</c:if>
								<c:if test="${AnswerDetail.status==1 }">
									<a style="color: #337AB7"
										onclick="setCollection('${AnswerDetail.answerid}','${AnswerDetail.questionid }')"
										class="meta-item js-thank" data-thanked="false"> <i
										class="z-icon-thank"></i>已收藏
									</a>
								</c:if>
								<!-- 点赞按钮-->
								<button data-za-module="VoteBar" id="dianzan"
									onclick="likeNum(${AnswerDetail.answerid})"
									style="background-color: #EFF6FA; width: 50px; border-color: #EFF6FA; margin-left: 20px"
									aria-pressed="false" title="赞同">
									<i></i><span class="count" id="ziti" style="color: #25BB9B">${nums}</span>
									<span class="label sr-only">赞同</span>
								</button>
								<!-- 点赞ajax -->
								<script>	
									function likeNum(e) {
							
										$.ajax({
											url : '/zhifou/ActiveServlet',
								            async:true,
								            type:"POST",
								            data : {"method":"great","answerid":e},
								            success:function(data){
								                if(data!=null) {
													
								                    $("#ziti").html(data);
													document.getElementById("dianzan").style.background = "#25BB9B";
													document.getElementById("ziti").style.color ="#fff";
								                    //$('#' + aaaa).html("<i class=\"fa fa-heart\" style=\"color:#ff99cc\"></i>" + " " + data);
								                    //alert(data+);
								                }
								                //alert(data);
								            },
								            error:function(){
								                alert("请求失败");
								            },
								            dataType:"text"
								        });
								    }

								
								</script>


								<button class="item-collapse js-collapse"
									style="transition: none;">
									<i class="z-icon-fold"></i>收起
								</button>
							</div>
						</div>
					</div>
				</div>


				<script type="text/javascript">
					function setCollection(answerid, questionid) {
					$.ajax({
							url : "/zhifou/collection",
							type : "post",
							dataType : "json",
							data : {
								"method" : "addCollection",
								"answerid" : answerid,
								"questionid" : questionid
							},
							success : function(data) {
								alert("收藏成功");
								window.location.href="/zhifou/recommend?method=showAnswerDetail&answerid="+answerid;
							},
							error : function() {
								alert("您已收藏该回答！可进入我的收藏查看！");
							}
						});
					}
				</script>
				<!-- 版权演示 -->
				<script type="text/x-template" id="copyright-demo-template">< article >

                    <section > <p class = "copyright-demo-title" > 这是你的回答正文 < /p>
    <div class="copyright-demo-region"></div > <div class = "copyright-demo-region" ></div>
    <div class="copyright-demo-region"></div > <div class = "copyright-demo-region" ></div>
    <div class="copyright-demo-region"></div ></section>

    <section>
    <p class="copyright-demo-title"> 当其他人想复制你的一段回答 </p > <div class = "copyright-demo-region frame2-region"id = "copyright-demo-region1" > <span class = "copyright-ico-indicator"id = "copyright-demo-indicator" > </span></div > <div class = "copyright-demo-region frame2-region"id = "copyright-demo-region2" ></div>
    <div class="copyright-demo-region frame2-region" id="copyright-demo-region3"></div > <div class = "copyright-demo-region frame2-region"id = "copyright-demo-region4" ></div>
    <div class="copyright-demo-region"></div ></section>

    <section id="copyright-demo-frame3">
    <p class="copyright-demo-title"> 复制将受限，同时会弹出提醒 </p > <div class = "copyright-demo-region copyright-demo-region-selected" ></div>
    <div class="copyright-demo-region copyright-demo-region-selected"></div > <div class = "copyright-demo-region copyright-demo-region-selected" ></div>
    <div class="copyright-demo-region copyright-demo-region-selected"></div > <div class = "copyright-demo-region" ></div>
    <span class="copyright-ico-pointer copyright-demo-pointer"></span > </section></article > </script>
			</div>
		</div>
	</div>
	<script type="text/json" class="json-inline" data-name="guiders2">{
            "exclusive-popover": {},
            "section": {},
            "editor": []
        }</script>
	<script type="text/json" class="json-inline" data-name="current_user">["\u80e1\u539f", "hu-yuan-24-48", "https:\/\/pic1.zhimg.com\/0c6a39621ab1d456b1e6e492d0becc0c_s.jpg", "69e344deb3bd4d35db07194565261bbe", "", 0, 0, true, "422018883@qq.com", "http:\/\/mail.qq.com", 0, true, false, false, "734705672150609920", false]</script>
	<script type="text/json" class="json-inline" data-name="user_status">[null, null]</script>
	<script type="text/json" class="json-inline" data-name="env">["nowcoder.com", "comet.nowcoder.com", false, null, false]</script>
	<script type="text/json" class="json-inline" data-name="permissions">[]</script>
	<script type="text/json" class="json-inline" data-name="ga_vars">{
            "user_created": 1467947482000,
            "now": 1467969333000,
            "abtest_mask": "---------1--------------------",
            "user_attr": [1, 0, 0, "-", "-"],
            "user_hash": "69e344deb3bd4d35db07194565261bbe"
        }</script>
	<script type="text/json" class="json-inline" data-name="ra-urls">{
            "Report": "https:\/\/static.nowcoder.com\/static\/revved\/-\/apps\/Report.d6e20840.js",
            "Community": "https:\/\/static.nowcoder.com\/static\/revved\/-\/apps\/Community.4e11c449.js",
            "OrgAnalytics": "https:\/\/static.nowcoder.com\/static\/revved\/-\/apps\/OrgAnalytics.47e1a483.js",
            "common": "https:\/\/static.nowcoder.com\/static\/revved\/-\/apps\/common.ed1d17c3.js",
            "CommentApp": "https:\/\/static.nowcoder.com\/static\/revved\/-\/apps\/CommentApp.2ab02258.js"
        }</script>
	<script type="text/json" class="json-inline"
		data-name="current_question">{
            "status": "normal",
            "editPermission": false,
            "qid": 6727688,
            "askAboutMember": 0,
            "isEditLocked": false,
            "detailEditReasonRequired": true,
            "isAnon": 0,
            "showInvitePanel": true,
            "isOrg": false,
            "isLocked": 0,
            "urlToken": 36301524
        }</script>
	<script type="text/json" class="json-inline"
		data-name="current_question_owner">false</script>
	<script type="text/json" class="json-inline" data-name="draft">[]</script>
	<script type="text/json" class="json-inline" data-name="my_answer">{}</script>
	<script type="text/json" class="json-inline"
		data-name="current_question_bio">{
            "selected_bio": "headline",
            "type": "HEADLINE",
            "value": null
        }</script>
	<script type="text/json" class="json-inline" data-name="redirect_to">""</script>
	<script src="../scripts/vendor.ff76fbae.js"></script>
	<script src="../scripts/base.fb262f0e.js"></script>
	<script src="../scripts/common.fed5411f.js"></script>
	<script src="../scripts/richtexteditor.aa0a4005.js" async=""></script>
	<!--  script src="../scripts/page-main.5d4c554d.js"></script> -->
	<meta name="entry" content="ZH.entrySQ" data-module-id="page-main">
	<script type="text/zscript" znonce="8d61d9c6697d4080ab36aa3bdb21b9d8"></script>
	<input type="hidden" name="_xsrf"
		value="21aa1c8d254df2899b23ab9afbd62a53">
	<div class="zh-backtotop" style="opacity: 0; display: none;">
		<a data-action="backtotop" data-tip="s$r$回到顶部" href="javascript:;"
			class="btn-backtotop btn-action">
			<div class="arrow"></div>
			<div class="stick"></div>
		</a>
	</div>
	<div id="copyright-demo-helper"
		style="display: none; position: absolute;">
		<p class="copyright-demo-helper-intro">勾选后，我们将限制其他用户的复制操作，并给予提醒</p>
		<p class="copyright-demo-helper-btn">查看演示</p>
	</div>
	<div id="zh-tooltip"></div>
	<div style="display: none;">
		<div class="lang-select collapsed">
			<div class="title-button" style="-webkit-user-select: none;">选择语言</div>
			<i class="zg-icon zg-icon-double-arrow"></i>
			<div class="input-wrapper">
				<input class="filter-input zg-form-text-input" placeholder="搜索语言"
					role="combobox" aria-autocomplete="list">
			</div>
		</div>
	</div>
	<div></div>

	<!-- 下面是弹窗 -->

	<div class="modal-dialog-buttons" style="display: none;"></div>
	</div>
	</div>


	<!--
            	作者：chenfang
            	时间：2019-06-29
            	描述：弹出层提问
            -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">


				<!-- 私信弹框 -->
				<div class="modal fade" id="modal-container-578824" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<span style="font-size: 5;">私信给：${AnswerDetail.username}</span>
							</div>

							<div class="modal-body">

								<form method="post" action="/zhifou/msgServlet?method=doreSend"
									role="form">
									<div class="form-group">
										<textarea name="content" class="form-control" rows="3"></textarea>
									</div>

									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-primary">提交</button>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	</div>
</body>
</html>