<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${ctx}/static/front/css/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/front/css/commer.css" rel="stylesheet" type="text/css" />

<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #aaaaaa;
	background-color: #ffffff;
	text-align:right;
	width:200px;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #aaaaaa;
	background-color: #ffffff;
	text-align:left;
	width:80%;
}
</style>
</head>

<body>
<div class="m-mianWap clearfix auto">
  <div class=" width1000 auto clearfix">
    <img src="${ctx}/static/front/images/bannerN.jpg" class="left" />
    <div class="clear"></div>
    <div class="m-head colfff">
        <jsp:include page="front-menu.jsp"></jsp:include>
    </div>
    <p class="font20 top50 colblue center">个人信息</p>
    
    <div class="top50 width743 auto m-grcxWap clearfix" style="height:auto">

      <div class="pad20">
        <div class="m-tab">
          <div class="header clearfix">
	          <li class="hover">公示信息</li>
	          <li>授权信息</li>
          </div>
          <div class="cont2" style="padding:40px 20px 20px 20px;">
          	<table class="gridtable">
          		<tr><th>诚信信用码</th><td>${obj.certcode}</td></tr>
          		<tr><th>姓名</th><td>${obj.name}</td></tr>
          		<tr><th>性别</th><td>${obj.sex}</td></tr>
          		<tr><th>工作单位</th><td>${obj.unit}</td></tr>
          		<tr><th>职务</th><td>${obj.duty}</td></tr>
          		<tr><th>电话</th><td>${obj.mobilephone}</td></tr>
          	</table>
          </div>
          
          <div class="cont2" style="padding:40px 20px 20px 20px; display:none">
          	<div id="myfrom">
          	<input type="hidden" name="certcode" id="certcode" value="${obj.certcode}"/>
            <input type="text" value="" name="authCode" id="authCode" style="width:400px;" class="verMid"  placeholder="请输入授权码"/>
            <button type="button" class="m-btns" id="btn_search" >提交</button>
            <p class="colred top5" id="msg"></p>
            </div>
            
            <div style="display:none" id="authInfo">
            <table class="gridtable">
          		<tr><th>身份证号</th><td>${obj.idNumber}</td></tr>
          		<tr><th>国籍</th><td>${obj.country}</td></tr>
          		<tr><th>民族</th><td>${obj.ethnic}</td></tr>
          		<tr><th>婚姻状况</th><td>${obj.marriage}</td></tr>
          		<tr><th>子女数量</th><td>${obj.children}</td></tr>
          		<tr><th>现住址</th><td>${obj.address}</td></tr>
          		<tr><th>籍贯/户籍地址</th><td>${obj.registeredAddress}</td></tr>
          		<tr><th>手机号</th><td>${obj.mobilephone}</td></tr>
          		<tr><th>电子邮箱</th><td>${obj.email}</td></tr>
          		<tr><th>学历</th><td>${obj.education}</td></tr>
          		<tr><th>毕业院校/专业</th><td></td></tr>
          	</table>
          	</div>
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
	
	//提交
	$('#btn_search').bind('click', function() {
		
		$.get("${ctx}/web/ajax/personal/checkAuthCode", 
				{ certcode:$("#certcode").val(), authCode: $("#authCode").val() } ,
				function(data){
					if(data){
						$("#myfrom").hide();
						$("#authInfo").show();
					}else{
						$("#msg").text("授权码错误！");
					}
		},'json');
		
	});
	
	$(".m-tab .header li").click(function(){
		var index = $(this).index();
		$(this).addClass("hover").siblings("li").removeClass("hover");
		$(".m-tab .cont2:eq("+index+")").show().siblings(".cont2").hide();
	});
})
</script>
</body>
</html>
