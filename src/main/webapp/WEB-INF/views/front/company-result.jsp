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
    <p class="font20 top50 colblue center">公司信息 </p>
    
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
          		<tr><th>中文名</th><td>${obj.nameCn}</td></tr>
          		<tr><th>单位性质</th><td>${obj.unitPropertie}</td></tr>
          		<tr><th>组织机构代码</th><td>${obj.orgcode}</td></tr>
          		<tr><th>所属行业</th><td>${obj.industry}</td></tr>
          		<tr><th>法人代表</th><td>${obj.legalRepresentative}</td></tr>
          		<tr><th>单位网址</th><td>${obj.website}</td></tr>
          		<tr><th>地址</th><td>${obj.registeredAddress}</td></tr>
          		<tr><th>邮编</th><td>${obj.zip}</td></tr>
          		<tr><th>联系电话</th><td>${obj.contactsPhone}</td></tr>
          		<tr><th>联系人</th><td>${obj.contacts}</td></tr>
          		<tr><th>联系人地址</th><td>${obj.contactsAddress}</td></tr>
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
          		<tr><th>年营业额</th><td>${obj.annualTurnover}</td></tr>
          		<tr><th>税务登记证号</th><td>${obj.taxNumber}</td></tr>
          		<tr><th>营业执照注册号</th><td>${obj.registeredNumber}</td></tr>
          		<tr><th>员工人数</th><td>${obj.employeeNumber}</td></tr>
          		<tr><th>基本账户开户行</th><td>${obj.basicBank}</td></tr>
          		<tr><th>基本账户账号</th><td>${obj.basicBankAccount}</td></tr>
          		<tr><th>注册资金</th><td>${obj.registeredCapital}</td></tr>
          		<tr><th>经营范围</th><td>${obj.businessScope}</td></tr>
          		<tr><th>成立时间</th><td><fmt:formatDate value="${obj.foundedDate}" pattern="yyyy 年 MM 月 dd 日"></fmt:formatDate></td></tr>
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
		
		$.get("${ctx}/web/ajax/company/checkAuthCode", 
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
