<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诚信追溯查验平台</title>
<link href="${ctx}/static/front/css/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/front/css/commer.css" rel="stylesheet" type="text/css" />

<script src="${ctx}/static/front/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/front/js/pub.js"></script>
<script src="${ctx}/static/metronic/js/jquery.idcode.js" type="text/javascript"></script>
  
	<script type="text/javascript">
		$(document).ready(function(){
			$.idcode.setCode();
			
			$('#btn_search').bind('click', function() {
				var code=$.idcode.validateCode();
				if(code){
					$("#inputForm").submit();
				}else{
					alert('验证码错误');
				}
				
			});
		}); 
	</script>
</head>

<body>
<div class="m-mianWap clearfix auto">
  <div class=" width1000 auto clearfix">
    <img src="${ctx}/static/front/images/bannerN.jpg" class="left" />
    <div class="clear"></div>
    <div class="m-head colfff">
        <jsp:include page="front-menu.jsp"></jsp:include>
    </div>
    <p class="font20 top50 colblue center">快速查验机构或个人诚信信用码</p>
    <p class="col999 font14 top20 center">诚信云平台查询系统，利用此平台您可以查验<span class="colye">公司</span>和<span class="colye">个人</span>的相关信息。</p>
    <div class="top50 width800 auto m-grcxWap clearfix">
      <img src="${ctx}/static/front/images/cx.jpg" class="left" />
      <div class="m-inputWap clearfix">
      <form action="${ctx}/web/search" id="inputForm" method="get" class="form-search">
        <li class="clearfix">
          <span class="span">诚信信用码：</span>
          <div class="div">
          	<input type="text" name="certcode" style="width:200px" value="${certcode}"/>
          	<c:if test="${not empty certcode}"><span class="left10 colred">诚信信用码错误</span></c:if>
          	<c:if test="${empty certcode}"><span class="left10 col999">请输入您的诚信信用码</span></c:if>
          </div>
        </li>
        <li class="clearfix top20">
          <span class="span">验证码：</span>
          <div class="div"><span id="idcode"></span></div>
        </li>
        <li class="clearfix top20">
          <span class="span">&nbsp;</span>
          <div class="div"><button type="button" class="m-btns" id="btn_search" >查验</button></div>
        </li>
        
		</form>
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


</body>
</html>
