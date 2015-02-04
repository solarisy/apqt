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
<style type="text/css">
.successclass  {
	color : #06C400;
	font-size : xx-large;
	font-weight : bold;
	text-align : center;
	background-color : #E8FFE8;
	border-width : 1;
	border-color : #FFFFFF;
	border-style : solid;
	padding : 18px;
	margin : 0 0 10px 0;
	foreach : function (func) {
    if (func && this.length > 0) {
        for (var i = 0; i < this.length; i++) {
            func(this[i])
        }
    }
};
}



.errorclass  {
	color : #F83E00;
	font-size : xx-large;
	font-weight : bold;
	text-align : center;
	background-color : #FFEDE4;
	border-width : 1;
	border-color : #FFFFFF;
	border-style : solid;
	padding : 18px;
	margin : 0 0 10px 0;
	foreach : function (func) {
    if (func && this.length > 0) {
        for (var i = 0; i < this.length; i++) {
            func(this[i])
        }
    }
};
}


table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
	width:100%;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #aaaaaa;
	background-color: #ffffff;
	text-align:center;
	width:auto;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #aaaaaa;
	background-color: #ffffff;
	text-align:left;
}
.w300{
	width:300px;
}
.w600{
	width:600px;
}
.w180{
	width:180px;
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
    <p class="font20 top50 colblue center">中国农业产业诚信联盟入会申请表</p>
    <div class="top50 auto m-grcxWap clearfix" style="height:auto">
		<div class="m-inputWap2 pad20">
		<c:if test="${not empty errorMsg}">
			<h1 class="errorclass" id="errorMsg">${errorMsg}</h1>
		</c:if>
		<c:if test="${not empty successMsg}">
			<h1 class="successclass"  id="successMsg">恭喜！申请成功！</h1>
		</c:if>

	<div id="">
	<form action="${ctx}/web/membershipApply/save" id="inputForm" class="form-horizontal" method="post">
         <table class="gridtable">
       		<tr>
       			<th>单位名称（全称）</th>
       			<td colspan="3"><input type="text" name="unitName" value="${obj.unitName}" class="w600"/></td>
       		</tr>
       		<tr>
       			<th>注册机关及文号</th>
       			<td><input type="text" name="unitRegNumber" value="${obj.unitRegNumber}" class="w300"/></td>
       			<th>单位性质</th>
       			<td><input type="text" name="unitProperty" value="${obj.unitProperty}" class="w300"/></td>
       		</tr>
       		<tr>
       			<th>详细通信地址</th>
       			<td><input type="text" name="unitAddress" value="${obj.unitAddress}" class="w300"/></td>
       			<th>邮编</th>
       			<td><input type="text" name="unitZip" value="${obj.unitZip}" class="w300"/></td>
       		</tr>
       		<tr>
       			<th>单位网址</th>
       			<td><input type="text" name="unitUrl" value="${obj.unitUrl}" class="w300"/></td>
       			<th>是否申请理事单位</th>
       			<td>
       				<select name="unitGoverning" style="width:315px">
						<option value="是"<c:if test="${obj.unitGoverning == '是'}"> selected</c:if>>是</option>
						<option value="否"<c:if test="${obj.unitGoverning == '否'}"> selected</c:if>>否</option>
					</select>
				</td>
       		</tr>
       	</table>
    	
     	<table class="gridtable">
       		<tr><th colspan="6" style="background-color:#fafafa">负责人详细资料</th></tr>
       		<tr>
       			<th>姓名</th>
       			<td><input type="text" name="ceoName" value="${obj.ceoName}" class="w180" /></td>
       			<th>性别</th>
       			<td><input type="text" name="ceoSex" value="${obj.ceoSex}" class="w180" /></td>
       			<th>年龄</th>
       			<td><input type="text" name="ceoAge" value="${obj.ceoAge}" class="w180" /></td>
       		</tr>
       		<tr>
       			<th>学历</th>
       			<td><input type="text" name="ceoEducation" value="${obj.ceoEducation}" class="w180" /></td>
       			<th>职称</th>
       			<td><input type="text" name="ceoJobTitle" value="${obj.ceoJobTitle}" class="w180" /></td>
       			<th>民族</th>
       			<td><input type="text" name="ceoEthnic" value="${obj.ceoEthnic}" class="w180" /></td>
       		</tr>
       		<tr>
       			<th>身份证号</th>
       			<td><input type="text" name="ceoIdNumber" value="${obj.ceoIdNumber}" class="w180" /></td>
       			<th>职务</th>
       			<td colspan="3"><input type="text" name="ceoPosition" value="${obj.ceoPosition}" class="w180" /></td>
       		</tr>
       		<tr>
       			<th>电话</th>
       			<td><input type="text" name="ceoPhone" value="${obj.ceoPhone}" class="w180" /></td>
       			<th>手机</th>
       			<td colspan="3"><input type="text" name="ceoMobilePhone" value="${obj.ceoMobilePhone}" class="w180" /></td>
       		</tr>
    	</table>
    	
     	<table class="gridtable">
    		<tr><th colspan="4"  style="background-color:#fafafa">个人简历</th></tr>
       		<tr><th>起止年月</th><th>单位</th><th>职务/职称</th><th>主要兼职</th></tr>
       		<tr><td><input type="text" name="cvStart" value="${obj.cvStart}" id="cvStart" class="Wdate" onClick="WdatePicker({maxDate:'#F{$dp.$D(\'cvEnd\')}'})"/> -- <input type="text" name="cvEnd" value="${obj.cvEnd}" id="cvEnd" class="Wdate" onClick="WdatePicker({minDate:'#F{$dp.$D(\'cvStart\')}'})"/></td><td><input type="text" name="cvUnit" value="${obj.cvUnit}" /></td><td><input type="text" name="cvPosition" value="${obj.cvPosition}" /></td><td><input type="text" name="cvPartTime" value="${obj.cvPartTime}" /></td></tr>
       		<tr><td><input type="text" name="cvStart2" value="${obj.cvStart2}" id="cvStart2" class="Wdate" onClick="WdatePicker({maxDate:'#F{$dp.$D(\'cvEnd2\')}'})"/> -- <input type="text" name="cvEnd2" value="${obj.cvEnd2}" id="cvEnd2" class="Wdate" onClick="WdatePicker({minDate:'#F{$dp.$D(\'cvStart2\')}'})"/></td><td><input type="text" name="cvUnit2" value="${obj.cvUnit2}" /></td><td><input type="text" name="cvPosition2" value="${obj.cvPosition2}" /></td><td><input type="text" name="cvPartTime2" value="${obj.cvPartTime2}" /></td></tr>
       		<tr><td><input type="text" name="cvStart3" value="${obj.cvStart3}" id="cvStart3" class="Wdate" onClick="WdatePicker({maxDate:'#F{$dp.$D(\'cvEnd3\')}'})"/> -- <input type="text" name="cvEnd3" value="${obj.cvEnd3}" id="cvEnd3" class="Wdate" onClick="WdatePicker({minDate:'#F{$dp.$D(\'cvStart3\')}'})"/></td><td><input type="text" name="cvUnit3" value="${obj.cvUnit3}" /></td><td><input type="text" name="cvPosition3" value="${obj.cvPosition3}" /></td><td><input type="text" name="cvPartTime3" value="${obj.cvPartTime3}" /></td></tr>
       		<tr><td><input type="text" name="cvStart4" value="${obj.cvStart4}" id="cvStart4" class="Wdate" onClick="WdatePicker({maxDate:'#F{$dp.$D(\'cvEnd4\')}'})"/> -- <input type="text" name="cvEnd4" value="${obj.cvEnd4}" id="cvEnd4" class="Wdate" onClick="WdatePicker({minDate:'#F{$dp.$D(\'cvStart4\')}'})"/></td><td><input type="text" name="cvUnit4" value="${obj.cvUnit4}" /></td><td><input type="text" name="cvPosition4" value="${obj.cvPosition4}" /></td><td><input type="text" name="cvPartTime4" value="${obj.cvPartTime4}" /></td></tr>
       		<tr><td><input type="text" name="cvStart5" value="${obj.cvStart5}" id="cvStart5" class="Wdate" onClick="WdatePicker({maxDate:'#F{$dp.$D(\'cvEnd5\')}'})"/> -- <input type="text" name="cvEnd5" value="${obj.cvEnd5}" id="cvEnd5" class="Wdate" onClick="WdatePicker({minDate:'#F{$dp.$D(\'cvStart5\')}'})"/></td><td><input type="text" name="cvUnit5" value="${obj.cvUnit5}" /></td><td><input type="text" name="cvPosition5" value="${obj.cvPosition5}" /></td><td><input type="text" name="cvPartTime5" value="${obj.cvPartTime5}" /></td></tr>
       	</table>
       	
       	<table class="gridtable">
       		<tr>
       			<th>联系人</th>
       			<td><input type="text" name="contectsName" value="${obj.contectsName}" class="w180"/></td>
       			<th>职务</th>
       			<td><input type="text" name="contectsPosition" value="${obj.contectsPosition}" class="w180"/></td>
       			<th>手机</th>
       			<td><input type="text" name="contectsMobilePhone" value="${obj.contectsMobilePhone}" class="w180"/></td>
       		</tr>
       		<tr>
       			<th>电话</th>
       			<td><input type="text" name="contectsPhone" value="${obj.contectsPhone}" class="w180"/></td>
       			<th>传真</th>
       			<td><input type="text" name="contectsFax" value="${obj.contectsFax}" class="w180"/></td>
       			<th>电子信箱</th>
       			<td><input type="text" name="contectsEmail" value="${obj.contectsEmail}" class="w180"/></td>
       		</tr>
       		<tr>
       			<th>单位简介（包括发展概况、主要业务及其规模等）</th>
       			<td colspan="5"><textarea name="unitSummary" rows="6" cols="120">${obj.unitSummary}</textarea></td>
       		</tr>
       		<tr>
       			<th>主要产品及其特点</th>
       			<td colspan="5"><textarea name="unitProduct" rows="6" cols="120">${obj.unitProduct}</textarea></td>
       		</tr>
       		<tr>
       			<th>年营业额（单位：万元）</th>
       			<td colspan="5"><input type="text" name="unitAnnualTurnover" value="${obj.unitAnnualTurnover}" class="w180"/></td>
       		</tr>
       		<tr>
       			<th>对协会有何希望及要求</th>
       			<td colspan="5"><textarea name="unitIdea" rows="6" cols="120">${obj.unitIdea}</textarea></td>
       		</tr>
       		<tr>
       			<th>入会承诺</th><td colspan="5">作为中国农业产业诚信联盟会员，我保证，拥护并遵守联盟章程，执行联盟决议，认真履行会员义务，维护行业利益，参加联盟活动，按时缴纳会费。本申请表提供的资料内容真实可靠，如有失实，愿意承担法律责任。</td>
       		</tr>
    	</table>
    	<li class="clearfix"><span class="span">&nbsp;</span><div class="div450">
          	<button type="submit" class="m-btns" id="btn_submit" >同意入会承诺并提交</button></div>
        </li>
    	</form>
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
<script src="${ctx}/static/metronic/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/metronic/js/messages_bs_zh.js" type="text/javascript"></script>
<script  src="${ctx}/static/My97DatePicker/4.8.Beta2/WdatePicker.js" language="javascript" type="text/javascript"></script>
<script>
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
