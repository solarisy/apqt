<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品信息查询</title>
<link href="${ctx}/static/front/css/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/front/css/commer.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="m-mianWap clearfix auto">
  <div class=" width1000 auto clearfix">
    <img src="${ctx}/static/front/images/bannerN.jpg" class="left" />
    <div class="clear"></div>
    <div class="m-head colfff">
        <jsp:include page="front-menu.jsp"></jsp:include>
    </div>
    <p class="font20 top50 colblue center">产品信息查询</p>
    <div class="top50 width743 auto m-grcxWap clearfix" style="height:auto">

      <div class="pad20">
        <div class="m-tab">
          <div class="header clearfix">
            <li class="hover">按诚信信用码</li>
            <li>扫描二维码</li>
            <li>扫描电子标签 </li>
          </div>
          <div class="cont" style="padding:40px 20px 0 20px;">
          	 <form action="${ctx}/web/search/product" id="inputForm1" method="get" class="form-search">
                <input type="hidden" name="searchBy" value="certcode"/>
            	<input type="text" value="${personal.certcode}" name="certcode" id="certcode" style="width:400px;" class="verMid" placeholder="请输入诚信信用码" />
            	<button type="button" class="m-btns" id="btn_search1" >查验</button>
            	<p class="colred top5" id="msg1"></p>
           	 </form>
          </div>
          
          <div class="cont" style="padding:40px 20px 0 20px; display:none">
          	 <form action="${ctx}/web/search/product" id="inputForm2" method="get" class="form-search">
          	    <input type="hidden" name="searchBy" value="idNumber"/>
	            <input type="text" value="${personal.idNumber}" name="idNumber"  id="idNumber" style="width:400px;" class="verMid" placeholder=""/>
	            <button type="button" class="m-btns" id="btn_search2" >查验</button>
	            <p class="colred top5" id="msg2"></p>
	         </form>
          </div>
          
	      <div class="cont" style="padding:40px 20px 0 20px; display:none">
         	 <form action="${ctx}/web/search/product" id="inputForm3" method="get" class="form-search">
         	    <input type="hidden" name="searchBy" value="name"/>
	            <input type="text" value="${personal.name}" name="name" id="name" style="width:400px;" class="verMid"  placeholder=""/>
	            <button type="button" class="m-btns" id="btn_search3" >查验</button>
	            <p class="colred top5" id="msg3"></p>
          	</form>
	      </div>
	      
        </div>
      </div>
    </div>
    <div class=" left120 clearfix top20 pad20">
      <p class=" left20 font14">除了使用互联网外，您还可以使用以下方式查验相关信息</p>
      <p class="left20 top10"><img src="${ctx}/static/front/images/dx.png" class="verMid right10" />输入“诚信#诚信信用码”发送至<span class="colred">12114</span>；</p>
      <p class="left20 top3"><img src="${ctx}/static/front/images/yy.png" class="verMid right10" />直接拨打<span class="colred">4006573123</span>，然后根据语音提示继续。</p>
      
    </div>
    <div class="line20 m-footer clearfix pad20">
      <p class="center"> <a href="http://www.cnitn.com.cn/columns_detail/&columnsId=37.html">关于我们</a> | <a href="http://www.cnitn.com.cn/mzsm.html">免责声明</a> | <a href="http://www.cnitn.com.cn/sitemap.html">网站地图</a></p>
      <p class="center">主办单位：农民日报社  中农食安诚信联盟</p>
      <p class="center">建设单位：中农食安诚信建设项目办公室         技术支持：中农食安科技发展（北京）有限公司</p>
      <p class="center">地址：朝阳区八里庄北里1号   邮编：100011  电话：010—85564963</p> 
      <p class="center">中华人民共和国电信与信息服务业务经营许可证：<a href="http://www.miitbeian.gov.cn">京ICP备13044272号</a></p>
    </div>
  </div>
</div>

<script src="${ctx}/static/front/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/front/js/pub.js"></script>
<script>
$(function(){
	//提交表单
	$('#btn_search1').bind('click', function() {
		$("#msg1").text("");
		$("#inputForm1").submit();
	});
	$('#btn_search2').bind('click', function() {
		$("#msg2").text("");
		$("#inputForm2").submit();
	});
	$('#btn_search3').bind('click', function() {
		$("#msg3").text("");
		$("#inputForm3").submit();
	});
	
	var searchBy="${searchBy}";
	if(searchBy=="certcode"){
		changeTab(0);
		$("#msg1").text("诚信信用码错误");
	}else if(searchBy=="idNumber"){
		changeTab(1);
		$("#msg2").text("无此二维码信息");
	}else if(searchBy=="name"){
		changeTab(2);
		$("#msg3").text("无此电子标签信息");
	}
	
	//隐藏提示信息
	$("#certcode").bind("click",function(){
		$("#msg1").text("");
	});
	$("#orgcode").bind("click",function(){
		$("#msg2").text("");
	});
	$("#nameCn").bind("click",function(){
		$("#msg3").text("");
	});
	
	function changeTab(index){
		$($(".m-tab .header li").get(index)).addClass("hover").siblings("li").removeClass("hover");
		$(".m-tab .cont:eq("+index+")").show().siblings(".cont").hide();
	}
	
	$(".m-tab .header li").click(function(){
		var index = $(this).index();
		$(this).addClass("hover").siblings("li").removeClass("hover");
		$(".m-tab .cont:eq("+index+")").show().siblings(".cont").hide();
	});
})
</script>
</body>
</html>
