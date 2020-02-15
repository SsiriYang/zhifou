<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html lang="zh-CN" class="is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile">
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的收藏--知否</title>
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="keywords" content="读《Web 全栈工程师的自我修养》">
    <meta name="description" content="阅读影浅分享的读《Web 全栈工程师的自我修养》，就在知否网。">

    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../styles/font-awesome.min.css">

    <link rel="stylesheet" media="all" href="../styles/letter.css">

    <script src="../scripts/hm.js"></script>
    <script src="../scripts/detail.js"></script>

    <script type="text/javascript" src="../scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="../scripts/jquery.qrcode.min.js"></script>
    <link rel="stylesheet" href="../styles/top.css">
    <link rel="stylesheet"  href="../bootstrap-3.3.7/css/bootstrap.css"/>
	<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.js"></script>
	<script type="text/javascript">
	 function freshen(){
			$.ajax({  
     		url:"/zhifou/collection",
     		async:false,
     		type:"post",
     		data:{"method":"getMyCollection"},
     		success:function(data){
     			
     		},
				error:function(){
					alert("请求失败");
				}
     	});
			
		}
	</script>
		<style type="text/css">
			.modal-dialog {
		    position: absolute;
		    z-index: 99;
		    max-width: 100%;
		    border-radius: 8px;
		    border: 1px solid #888;
		    box-shadow: 0 0 80px 0 rgba(0,0,0,.4);
		    background: #fff;
		    text-align: left;
		    left: 50%;
		     margin-left: -275px; 
		    margin-top: 14%;
		    margin-top: 14vh;
		}
		</style>
</head>
<body class="posts_show"  onload="freshen()">
	<%@ include file="top.jsp"%>
    <div class="zu-global-notify" id="zh-global-message" style="display:none">
        <div class="zg-wrap">
            <div class="zu-global-nitify-inner">
            <a class="zu-global-notify-close" href="javascript:;" title="关闭" name="close">x</a>
            <span class="zu-global-notify-icon"></span>
            <span class="zu-global-notify-msg"></span>
            </div>
        </div>
    </div>
    <br />
    <br />
    <!-- 收藏内容 -->
    <div id="main">
    
        <div class="zg-wrap zu-main clearfix ">
            <ul class="letter-list" >
            <!-- 遍历的到收藏列表 -->
            <c:forEach items="${uindex}" var="item" varStatus="status" >
                <li id="conversation-item-10005_622873"  class="${item.collectionid}">
                    <a class="letter-link"></a>
                    <div class="letter-info">
                        <div class="l-operate-bar">
                            <a href="javascript:void(0);" class="sns-action-del" data-id="10005_622873"  onclick="deleteCollection(${item.collectionid})">
                           			 删除
                            </a>
                            <a>
                            		    热度:${item.answer_count }
                            </a>
                        </div>
                    </div>
                    <div class="chat-headbox">
                        <a class="list-head" href="/zhifou/recommend?method=findUserCenter&userid=${item.userid }">
                            <img alt="头像" width="50px" height="50px" src="${item.userphoto}">
                        </a>
                    </div>
                    <div class="letter-detail">
                        <a title="问题" class="letter-name level-color-1" href="/zhifou/recommend?method=showQuestionDetail&questionid=${item.questionid }">
                          ${item.questiontitle }
                        </a>
                        <p class="letter-brief">
                            <a title="答案" href="/zhifou/recommend?method=showAnswerDetail&answerid=${item.answerid}">
                                ${item.answercontent}
                            </a>
                        </p>
                    </div>
                </li>
            </c:forEach>
          </ul>

        </div>
        <script type="text/javascript">
        function deleteCollection(id){
        	var flag=window.confirm("是否确认删除该收藏？");
        	if(flag){
        		var lis =$("."+id);
    			$.ajax({
    				url:"/zhifou/collection",
    				async:true,
    				type:"post",
    				data:{"method":"deleteCollection","collectionid":id},
    				success:function(date){
    					freshen();
    					lis.remove();
    				},
    				error:function(){
    					alert("请求失败");
    				}
    			})
        	}
    		
    	}
        
        
        
        
        
          $(function(){

            // If really is weixin
            $(document).on('WeixinJSBridgeReady', function() {

              $('.weixin-qrcode-dropdown').show();

              var options = {
                "img_url": "",
                "link": "http://nowcoder.com/j/wt2rwy",
                "desc": "",
                "title": "读《Web 全栈工程师的自我修养》"
              };

              WeixinJSBridge.on('menu:share:appmessage', function (argv){
                WeixinJSBridge.invoke('sendAppMessage', options, function (res) {
                  // _report('send_msg', res.err_msg)
                });
              });

              WeixinJSBridge.on('menu:share:timeline', function (argv) {
                WeixinJSBridge.invoke('shareTimeline', options, function (res) {
                  // _report('send_msg', res.err_msg)
                });
              });

              // $(window).on('touchmove scroll', function() {
              //   if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
              //     $('div.backdrop').show();
              //     $('div.share-help').show();
              //   } else {
              //     $('div.backdrop').hide();
              //     $('div.share-help').hide();
              //   }
              // });

            });

          })
        </script>
    </div>
    <div id="zh-footer" class="zh-footer">
<div class="content zg-wrap clearfix">


<span class="copy">© 2019 知否</span>

</div>
</div>

  <div id="quick-download">
    <button type="button" class="close-link btn-link" data-toggle="modal" data-target="#quick-download-app-modal"><i class="fa fa-times-circle"></i></button>

    <a class="download-link" href="http://nowcoder.com/download">
      <h3>牛客网</h3>
      <h4>程序员的首选学习分享平台</h4>
      <button type="button" class="btn btn-info btn-sm">下载 APP</button>
    </a>

    <div class="modal fade" id="quick-download-app-modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">提示</div>
          <div class="modal-body">
            <div class="checkbox">
              <label class="i-checks">
                <input id="already-installed" type="checkbox"><i></i> 我已安装了知否网App，不再显示
              </label>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-block btn-default" id="close-quick-download-app-modal">关 闭</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>