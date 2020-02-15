<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0039)question/36301524 -->
<html lang="zh-CN" dropeffect="none"
	class="js  is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile"
	style="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="X-ZA-Response-Id"
	content="4b3ad1bf1e8045f1a016c31f5fbb40c8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<link rel="stylesheet" href="../styles/answer.css">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" />
<!-- <link href="../styles/bootstrap-combined.no-icons.min.css" rel="stylesheet"> -->
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>

<script src="../scripts/instant.e7a17de6.js"></script>
<style type="text/css">
.modal-dialog {
	position: absolute;
	z-index: 99;
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
</style>
</head>

<body class="zhi ">
	<%@ include file="top.jsp"%>
	<div class="zg-wrap zu-main clearfix with-indention-votebar"
		itemscope="" itemtype="http://schema.org/Question"
		id="zh-single-question-page" data-urltoken="36301524" role="main">
		<div class="zu-main-content">
			<div class="zu-main-content-inner">
				<div id="zh-question-title" data-editable="true"
					class="zm-editable-status-normal">
					<h2 class="zm-item-title">
						<a
							href="/zhifou/recommend?method=showQuestionDetail&questionid=${sessionScope.Question.questionid }">
							<h2 class="zm-editable-content">${sessionScope.Question.questiontitle }</h2>
						</a>
					</h2>
				</div>
				<div id="zh-question-detail"
					class="zm-item-rich-text zm-editable-status-normal"
					data-resourceid="6727688" data-action="/question/detail">
					<div class="zm-editable-content">${sessionScope.Question.questioncontent }</div>
				</div>
				<div class="zm-side-section">
					<div class="zm-side-section-inner"
						id="zh-question-side-header-wrap">

						<a href="javascript:0;"
							class="cd-popup-trigger0 follow-button zg-follow zg-btn-green">回答</a>

						<div class="zh-question-followers-sidebar">
							<div class="zg-gray-normal">
								<a href=""> <strong>${number }</strong></a>人收藏该问题
							</div>
						</div>
					</div>
				</div>

				<!--遍历用户回答 -->
				<c:forEach items="${AllAnswers}" var="p">
					<div id="zh-question-answer-wrap" data-pagesize="10"
						class="zh-question-answer-wrapper navigable"
						data-widget="navigable"
						data-navigable-options="{&quot;items&quot;: &quot;&gt;.zm-item-answer&quot;}"
						data-init="{&quot;params&quot;: {&quot;url_token&quot;: 36301524, &quot;pagesize&quot;: 10, &quot;offset&quot;: 0}, &quot;nodename&quot;: &quot;QuestionAnswerListV2&quot;}">
						<div tabindex="-1" class="zm-item-answer  zm-item-expanded"
							itemprop="topAnswer" itemscope=""
							itemtype="http://schema.org/Answer" data-aid="22162611"
							data-atoken="66862039" data-collapsed="0"
							data-created="1444310527" data-deleted="0" data-helpful="1"
							data-isowner="0" data-copyable="1" data-za-module="AnswerItem">
							<link itemprop="url" href="">
							<meta itemprop="answer-id" content="22162611">
							<meta itemprop="answer-url-token" content="66862039">
							<a class="zg-anchor-hidden" name="answer-22162611"></a>


							<div class="answer-head">
								<div class="zm-item-answer-author-info">
									<a class="zm-item-link-avatar avatar-link" href="/zhifou/recommend?method=findUserCenter&userid=${p.userid }"
										target="_blank" data-tip="p$t$yingxiaodao"> <img
										src="${p.userphoto }"
										class="zm-list-avatar avatar"></a> <a class="author-link"
										data-tip="p$t$yingxiaodao" target="_blank" href=""></a> <span
										title="爱科学 爱运动" class="bio"></span>
								</div>

							</div>

							<div class="zm-item-rich-text expandable js-collapse-body"
								data-resourceid="6727688" data-action="/answer/content"
								data-author-name="营销岛"
								data-entry-url="/question/36301524/answer/66862039">
								<div class="zm-editable-content clearfix">



									<div id="editor2">
										<p>${p.answercontent }</p>
									</div>



								</div>
							</div>


							<a class="zg-anchor-hidden ac" name="22162611-comment"></a>
							<div
								class="zm-item-meta answer-actions clearfix js-contentActions">
								<div class="zm-meta-panel">
									<a itemprop="url" class="answer-date-link meta-item"
										target="_blank" href="">发布于${p.answertime}</a> 
										<button class="item-collapse js-collapse"
										style="transition: none;">
										<i class="z-icon-fold"></i>收起
									</button>
								</div>
							</div>

						</div>
					</div>
					<div id="zh-question-collapsed-wrap"
						class="zh-question-answer-wrapper" style="display: none"></div>

				</c:forEach>
				<a name="draft"></a>

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
	<script src="../scripts/page-main.5d4c554d.js"></script>

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

	<!--回答弹窗-->
	<!--弹框-->
	<div class="cd-popup">
		<!-- 文本框 -->
		<div class="cd-popup-container">
			<div class="hero-unit">
				<div style="padding: 20px;">
					<div class="btn-toolbar" data-role="editor-toolbar"
						data-target="#editor">
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="字体大小"><i class="icon-font"></i><b class="caret"></b></a>
							<ul class="dropdown-menu">
							</ul>
						</div>
						<!-- 字体 -->
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Font Size"><i class="icon-text-height"></i>&nbsp;<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
								<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
								<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
							</ul>
						</div>
						<!--字体样式 -->
						<div class="btn-group">
							<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
								class="icon-bold"></i></a> <a class="btn" data-edit="italic"
								title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a> <a
								class="btn" data-edit="strikethrough" title="Strikethrough"><i
								class="icon-strikethrough"></i></a> <a class="btn"
								data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
								class="icon-underline"></i></a>
						</div>
						<!--序列化 -->
						<div class="btn-group">
							<a class="btn" data-edit="insertunorderedlist"
								title="Bullet list"><i class="icon-list-ul"></i></a> <a
								class="btn" data-edit="insertorderedlist" title="Number list"><i
								class="icon-list-ol"></i></a> <a class="btn" data-edit="outdent"
								title="Reduce indent (Shift+Tab)"><i
								class="icon-indent-left"></i></a> <a class="btn" data-edit="indent"
								title="Indent (Tab)"><i class="icon-indent-right"></i></a>
						</div>
						<!--内容位置 -->
						<div class="btn-group">
							<a class="btn" data-edit="justifyleft"
								title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
							<a class="btn" data-edit="justifycenter"
								title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
							<a class="btn" data-edit="justifyright"
								title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
							<a class="btn" data-edit="justifyfull"
								title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
						</div>
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Hyperlink"><i class="icon-link"></i></a>
							<div class="dropdown-menu input-append">
								<input class="span2" placeholder="URL" type="text"
									data-edit="createLink" />
								<button class="btn" type="button">Add</button>
							</div>
							<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
								class="icon-cut"></i></a>

						</div>

						<div class="btn-group">
							<a class="btn" title="Insert picture (or just drag & drop)"
								id="pictureBtn"><i class="icon-picture"></i></a> <input
								type="file" data-role="magic-overlay" data-target="#pictureBtn"
								data-edit="insertImage" />
						</div>
						<div class="btn-group">
							<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
								class="icon-undo"></i></a> <a class="btn" data-edit="redo"
								title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
						</div>
						<input type="text" data-edit="inserttext" id="voiceBtn"
							x-webkit-speech="">
					</div>



					<form action="/zhifou/answer?method=add" method="post" id="ans">

						<div id="editor" placeholder="输入你的回答"></div>

						<textarea type="hide" name="answercontent" id="answer"
							style="display: none;"></textarea>

						<input class="btn btn-primary" type="submit" value="提交"> <a
							href="#0" class="cd-popup-close "> <span
							class="glyphicon glyphicon-remove"></span>close
						</a>
					</form>
				</div>
			</div>
		</div>



	</div>



	<script type="text/javascript">
		/*弹框JS内容*/
		jQuery(document).ready(
				function($) {
					//打开窗口
					$('.cd-popup-trigger0').on('click', function(event) {
						event.preventDefault();
						$('.cd-popup').addClass('is-visible');
						//$(".dialog-addquxiao").hide()
					});
					//关闭窗口
					$('.cd-popup').on(
							'click',
							function(event) {
								if ($(event.target).is('.cd-popup-close')
										|| $(event.target).is('.cd-popup')) {
									event.preventDefault();
									$(this).removeClass('is-visible');
								}
							});
					//ESC关闭
					$(document).keyup(function(event) {
						if (event.which == '27') {
							$('.cd-popup').removeClass('is-visible');
						}
					});

				});
	</script>




	<script src="../js/jquery-3.1.1.min.js"></script>
	<script src="../js/jquery.hotkeys.js"></script>
	<script src="../js/bootstrap-wysiwyg.js"></script>
	<script src="../bootstrap-3.3.7/js/bootstrap.js"></script>
	<script>
		$(function() {
			function initToolbarBootstrapBindings() {
				//定义字体样式
				var fonts = [ 'Serif', 'Sans', 'Arial', 'Arial Black',
						'Courier', 'Courier New', 'Comic Sans MS', 'Helvetica',
						'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma',
						'Times', 'Times New Roman', 'Verdana' ], fontTarget = $(
						'[title=Font]').siblings('.dropdown-menu');
				$
						.each(
								fonts,
								function(idx, fontName) {
									fontTarget
											.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'
													+ fontName + '</a></li>'));
								});
				$('a[title]').tooltip({
					container : 'body'
				});
				$('.dropdown-menu input').click(function() {
					return false;
				}).change(
						function() {
							$(this).parent('.dropdown-menu').siblings(
									'.dropdown-toggle').dropdown('toggle');
						}).keydown('esc', function() {
					this.value = '';
					$(this).change();
				});

				$('[data-role=magic-overlay]').each(
						function() {
							var overlay = $(this), target = $(overlay
									.data('target'));
							overlay.css('opacity', 0).css('position',
									'absolute').offset(target.offset()).width(
									target.outerWidth()).height(
									target.outerHeight());
						});
				$('#voiceBtn').hide();
				// if ("onwebkitspeechchange"  in document.createElement("input")) {
				//   var editorOffset = $('#editor').offset();
				//   $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
				// } else {
				//   $('#voiceBtn').hide();
				// }
			}
			;
			initToolbarBootstrapBindings();
			$('#editor').wysiwyg();
			window.prettyPrint && prettyPrint();
		});

		$("#ans").submit(function() {
			document.getElementById("answer").innerHTML = $('#editor').html();
		});
	</script>
</body>
</html>