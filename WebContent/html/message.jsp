<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0039)question/36301524 -->
<html lang="zh-CN" dropeffect="none"
	class="js  is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile"
	style="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" async="" src="../scripts/za-0.1.1.min.js"></script>
<script async="" src="https://ssl.google-analytics.com/ga.js"></script>


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="X-ZA-Response-Id"
	content="4b3ad1bf1e8045f1a016c31f5fbb40c8">

<title>问题详情页面</title>

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
<script src="../scripts/instant.e7a17de6.js"></script>
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.js"></script>
</head>

<body class="zhi ">
	<!--导航栏-->
	<%@ include file="top.jsp"%>
	<!--内容-->

	<div class="zg-wrap zu-main clearfix " role="main">
		<div class="zu-main-content">
			<div class="zu-main-content-inner">
				<div class="zg-section" id="zh-home-list-title">
					<i class="zg-icon zg-icon-feedlist"></i>消息详情 <input type="hidden"
						id="is-topstory"> <span
						class="zg-right zm-noti-cleaner-setting" style="list-style: none">
					</span>
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
							class="feed-item folding feed-item-hook feed-item-2
                        "
							feed-item-a="" data-type="a" id="feed-2"
							data-za-module="FeedItem" data-za-index="">
							<meta itemprop="ZReactor" data-id="389034"
								data-meta="{&quot;source_type&quot;: &quot;promotion_answer&quot;, &quot;voteups&quot;: 4168, &quot;comments&quot;: 69, &quot;source&quot;: []}">
							<div class="feed-item-inner">
								<div class="avatar">
									<a title="发件人头像" data-tip="p$t$amuro1230"
										class="zm-item-link-avatar" target="_blank"
										href="https://nowcoder.com/people/amuro1230"> <img
										src="../images/res/12a8e1ce5ad8060fddb93ae2df98028b_m.jpg"
										class="zm-item-img-avatar"></a>
								</div>
								<div class="feed-main">
									<a></a>

									<div class="feed-content" data-za-module="AnswerItem">
										<meta itemprop="answer-id" content="389034">
										<meta itemprop="answer-url-token" content="13174385">
										<h2 class="feed-title">
											<a class="question_link" target="_blank"
												href="https://nowcoder.com/question/19857995#answer-389034">发件人</a>
										</h2>
										<div class="expandable entry-body">

											<div class="zm-item-answer-author-info">
												<a class="author-link" data-tip="p$b$amuro1230"
													target="_blank"
													href="https://nowcoder.com/people/amuro1230">昵称:${fromuser.username}</a>
												<div class="zm-item-rich-text expandable js-collapse-body"
													data-resourceid="123114" data-action="/answer/content"
													data-author-name=""
													data-entry-url="/question/19857995/answer/13174385">
													<textarea class="content"
														style="border: 1px solid gainsboro; font-size: x-large; width: 900px; height: 200px;">${message.content}
                                                </textarea>

												</div>


											</div>
											<form
												action="/zhifou/msgServlet?method=reSend"
												method="post">
												<textarea name="content" class="content"
													style="border: 1px solid gainsboro; font-size: x-large; width: 900px; height: 200px;"></textarea>
												<button type="submit">回信</button>
											</form>
											<script type="text/json" class="json-inline"
												data-name="guiders2">{
            "exclusive-popover": {},
            "section": {},
            "editor": []
        }</script>
											<script type="text/json" class="json-inline"
												data-name="current_user">["\u80e1\u539f", "hu-yuan-24-48", "https:\/\/pic1.zhimg.com\/0c6a39621ab1d456b1e6e492d0becc0c_s.jpg", "69e344deb3bd4d35db07194565261bbe", "", 0, 0, true, "422018883@qq.com", "http:\/\/mail.qq.com", 0, true, false, false, "734705672150609920", false]</script>
											<script type="text/json" class="json-inline"
												data-name="user_status">[null, null]</script>
											<script type="text/json" class="json-inline" data-name="env">["nowcoder.com", "comet.nowcoder.com", false, null, false]</script>
											<script type="text/json" class="json-inline"
												data-name="permissions">[]</script>
											<script type="text/json" class="json-inline"
												data-name="ga_vars">{
            "user_created": 1467947482000,
            "now": 1467969333000,
            "abtest_mask": "---------1--------------------",
            "user_attr": [1, 0, 0, "-", "-"],
            "user_hash": "69e344deb3bd4d35db07194565261bbe"
        }</script>
											<script type="text/json" class="json-inline"
												data-name="ra-urls">{
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
											<script type="text/json" class="json-inline"
												data-name="draft">[]</script>
											<script type="text/json" class="json-inline"
												data-name="my_answer">{}</script>
											<script type="text/json" class="json-inline"
												data-name="current_question_bio">{
            "selected_bio": "headline",
            "type": "HEADLINE",
            "value": null
        }</script>
											<script type="text/json" class="json-inline"
												data-name="redirect_to">""</script>
											<script src="../scripts/vendor.ff76fbae.js"></script>
											<script src="../scripts/base.fb262f0e.js"></script>
											<script src="../scripts/common.fed5411f.js"></script>
											<script src="../scripts/richtexteditor.aa0a4005.js" async=""></script>
											<script src="../scripts/page-main.5d4c554d.js"></script>
											<meta name="entry" content="ZH.entrySQ"
												data-module-id="page-main">
											<script type="text/zscript"
												znonce="8d61d9c6697d4080ab36aa3bdb21b9d8"></script>
											<input type="hidden" name="_xsrf"
												value="21aa1c8d254df2899b23ab9afbd62a53">
											<div class="zh-backtotop" style="opacity: 0; display: none;">
												<a data-action="backtotop" data-tip="s$r$回到顶部"
													href="javascript:;" class="btn-backtotop btn-action">
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
													<div class="title-button"
														style="-webkit-user-select: none;">选择语言</div>
													<i class="zg-icon zg-icon-double-arrow"></i>
													<div class="input-wrapper">
														<input class="filter-input zg-form-text-input"
															placeholder="搜索语言" role="combobox"
															aria-autocomplete="list">
													</div>
												</div>
											</div>
											<div></div>

											<!-- 下面是弹窗 -->

											<div class="modal-dialog-buttons" style="display: none;"></div>
										</div>
									</div>
</body>
</html>
