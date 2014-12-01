<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员申请</title>
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
    <p class="font20 top50 colblue center">中国农业产业诚信联盟会员单位申请表</p>
    <div class="top50 width743 auto m-grcxWap clearfix" style="height:auto">
		<div class="m-inputWap2 pad20">
		<p class="colred font14b top5 left120" id="errorMsg">${errorMsg}</p>
		<p class="colgreen font14b top5 left120" id="successMsg">${successMsg}</p>
<form action="${ctx}/web/membershipApply/save" id="inputForm" class="form-horizontal" method="post">
<li class="clearfix"><span class="span">单位名称<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="unitName" value="${obj.unitName}" class="required" /></div>
</li>
<li class="clearfix"><span class="span">电话<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="phone" value="${obj.phone}" class="required"/></div>
</li>
<li class="clearfix"><span class="span">单位地址<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="unitAddress" value="${obj.unitAddress}" class="required"/></div>
</li>
<li class="clearfix"><span class="span">邮编<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="zip" value="${obj.zip}" class="required"/></div>
</li>
<li class="clearfix"><span class="span">领导人姓名<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="leadName" value="${obj.leadName}" class="required"/></div>
</li>
<li class="clearfix"><span class="span">职务<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="position" value="${obj.position}" class="required"/></div>
</li>
<li class="clearfix"><span class="span">EMAIL<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="email" value="${obj.email}" class="required"/></div>
</li>
<li class="clearfix"><span class="span">联系人姓名<span class="colred">*</span>：</span><div class="div440">
	<input type="text" name="contectUserName" value="${obj.contectUserName}" class="required"/></div>
</li>
<li class="clearfix"><span class="span">电话及传真：</span><div class="div440">
	<input type="text" name="fax" value="${obj.fax}" /></div>
</li>
<li class="clearfix"><span class="span">申请会员等级<span class="colred">*</span>：</span><div class="div440">
	<select name="membershipLevel" style="width:315px">
		<option value="常务副会长单位"<c:if test="${obj.membershipLevel == '常务副会长单位'}"> selected</c:if> >常务副会长单位</option>
		<option value="副会长单位"<c:if test="${obj.membershipLevel == '副会长单位'}"> selected</c:if>>副会长单位</option>
		<option value="理事长单位"<c:if test="${obj.membershipLevel == '理事长单位'}"> selected</c:if>>理事长单位</option>
		<option value="副理事长单位"<c:if test="${obj.membershipLevel == '副理事长单位'}"> selected</c:if>>副理事长单位</option>
		<option value="理事单位"<c:if test="${obj.membershipLevel == '理事单位'}"> selected</c:if>>理事单位</option>
	</select>
</li>
<li class="clearfix"><span class="span">企业基本情况：</span><div class="div440">
	<textarea name="baseInfo" rows="3" cols="60">${obj.baseInfo}</textarea>
</li>
 <li class="clearfix"><span class="span">推荐单位意见：</span><div class="div440">
	<textarea name="recommendOpinion" rows="3" cols="60">${obj.recommendOpinion}</textarea>
</li>
 <li class="clearfix"><span class="span">批准情况：</span><div class="div440">
	<textarea name="ratificationStatus" rows="3" cols="60">${obj.ratificationStatus}</textarea>
</li>
</li>
 <li class="clearfix"><span class="span">是否愿意成为诚信联盟的发起单位<span class="colred">*</span>：</span><div class="div440">
	<select name="isSponsor" style="width:315px">
		<option value="是"<c:if test="${obj.isSponsor == '是'}"> selected</c:if>>是</option>
		<option value="否"<c:if test="${obj.isSponsor == '否'}"> selected</c:if>>否</option>
	</select>
</li>
<li class="clearfix"><span class="span">&nbsp;</span><div class="div450">
	<button type="submit" class="m-btns" id="btn_submit" >提交</button></div>
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

<script src="${ctx}/static/front/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/front/js/pub.js"></script>
<script src="${ctx}/static/metronic/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/metronic/js/messages_bs_zh.js" type="text/javascript"></script>
<script>
$(function(){
	$(".m-tab .header li").click(function(){
		var index = $(this).index();
		$(this).addClass("hover").siblings("li").removeClass("hover");
		$(".m-tab .cont:eq("+index+")").show().siblings(".cont").hide();
	});
})

$(document).ready(function() {
			//聚焦第一个输入框
			$("#unitName").focus();
			// for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            $('#inputForm').validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",

                highlight: function (element) { // hightlight error inputs
                    $(element).closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element).closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change dony by hightlight
                    $(element).closest('.control-group').removeClass('error'); // set error class to the control group
                },

                success: function (label) {
                    label
                    .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                }
            });
		});
</script>
</body>
</html>
