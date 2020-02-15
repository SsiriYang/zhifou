<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0039)question/36301524 -->
<html lang="zh-CN" dropeffect="none" class="js  is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile" style=""><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" async="" src="../scripts/za-0.1.1.min.js"></script>
<script async="" src="https://ssl.google-analytics.com/ga.js"></script>


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="X-ZA-Response-Id" content="4b3ad1bf1e8045f1a016c31f5fbb40c8">

<title>弹出层，发私信,提问问题 - 知乎</title>



<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="mobile-agent" content="format=html5;url=">
<meta id="znonce" name="znonce" content="8d61d9c6697d4080ab36aa3bdb21b9d8">

<link rel="search" type="application/opensearchdescription+xml" href="" title="知否">
<link rel="stylesheet" href="../styles/detail.css">
<style>
   a{ color:#006BFF;}
    </style>


</head>

<body class="zhi ">
	
        <div class="modal-dialog-bg" aria-hidden="true" style="opacity: 0.5; width: 1366px; height: 1196px;"></div>
        <div class="modal-wrapper" aria-hidden="true">
            <div class="modal-dialog absolute-position" tabindex="0" role="dialog" aria-labelledby=":i" style="width: 550px;">
                <div class="modal-dialog-title">
                    <span class="modal-dialog-title-text" id=":i" role="heading">提问</span>
                    <span class="modal-dialog-title-close" role="button" tabindex="0" aria-label="Close"></span>
                </div>
                <div class="modal-dialog-content">
                    <div class="zh-add-question-form">
                        <form class="js-add-question-form" style="display: block;" action="/zhifou/ask?method=ask" method="post">
                            <div class="zg-section-big clearfix">
                                <div id="zm-modal-dialog-info-wrapper"></div>
                                <div style="display: none;position: relative;" id="zm-modal-dialog-warnmsg-wrapper">
                                    <div class="zm-modal-dialog-warnmsg zm-modal-dialog-guide-warn-message zg-r5px"></div>
                                    <a name="close" title="关闭" href="javascript:;" class="zu-global-notify-close" style="display:none">x</a>
                                    <span class="zm-modal-dialog-guide-title-msg"></span>
                                </div>
                                <div class="zg-form-text-input add-question-title-form" style="position: relative;">
                                    <textarea  name="questiontitle" rows="1" class="zg-editor-input zu-seamless-input-origin-element" title="在这里输入问题" id="zh-question-suggest-title-content" aria-label="写下你的问题" placeholder="写下你的问题" role="combobox" aria-autocomplete="list" autocomplete="off" style="height: 22px;"></textarea>
                                </div>
                            </div>
                            <div class="zg-section-big">
                                <div class="add-question-section-title">问题说明（可选）：</div>
                                <div id="zh-question-suggest-detail-container" class="zm-editable-status-editing">
                                    <div class="zm-editable-editor-wrap no-toolbar" style="">
                                        <div class="zm-editable-editor-outer">
                                            <div class="zm-editable-editor-field-wrap">
                                                <div id="mock:k" class="zm-editable-editor-field-element editable" g_editable="true" role="textbox" contenteditable="true" style="font-style: italic;">
                                                <textarea name="questioncontent" style="width:100%;height:100%;"
                                                class="zg-editor-input zu-seamless-input-origin-element" placeholder="问题说明">
												
												</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <!--下拉 列表 -->
                          			     问题类型<br />
									<select name="categoryid" style="border: 1px solid #869FB1;background-color: #FFFFFF;width: 150px;height: 30px;border-radius:3px;">
									  <option value="1">科技</option>
									  <option value="2">娱乐</option>
									  <option value="3">体育</option>
									</select>
									</br>
									<br>
									<a href="javascript:;"  >选择文件</a><br />
									<input name="questionphoto" type="text" style="border: 1px solid #869FB1;background-color: #FFFFFF;width: 150px;height: 30px;border-radius:3px;"/>
                            <div class="zm-command">
                                <!-- <span id="zh-question-form-tag-err">至少添加一个话题</span> -->
                                <a href="javascript:;" name="cancel" class="zm-command-cancel">取消</a>
                                <input type="submit" class="zg-r5px zu-question-form-add zg-btn-blue" value="发布"/>
<!--                                 <a href="javascript:;" name="addq" class="zg-r5px zu-question-form-add zg-btn-blue">发布</a> -->
                                <a name="jumpq" class="zg-r5px zg-btn-blue zu-question-form-jump" style="display:none;">查看问题</a></div>
                        </form>
                    </div>
                </div>
                <div class="modal-dialog-buttons" style="display: none;"></div>
            </div>
        </div>

</body>
</html>