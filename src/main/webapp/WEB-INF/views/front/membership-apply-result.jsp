<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员申请结果</title>
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
         <table class="gridtable">
       		<tr>
       			<th>单位名称（全称）</th>
       			<td colspan="3">${obj.unitName}</td>
       		</tr>
       		<tr>
       			<th>注册机关及文号</th>
       			<td>${obj.unitRegNumber}</td>
       			<th>单位性质</th>
       			<td>${obj.unitProperty}</td>
       		</tr>
       		<tr>
       			<th>详细通信地址</th>
       			<td>${obj.unitAddress}</td>
       			<th>邮编</th>
       			<td>${obj.unitZip}</td>
       		</tr>
       		<tr>
       			<th>单位网址</th>
       			<td>${obj.unitUrl}</td>
       			<th>是否申请理事单位</th>
       			<td>${obj.unitGoverning}</td>
       		</tr>
       	</table>
    	
     	<table class="gridtable">
       		<tr><th colspan="6" style="background-color:#fafafa">负责人详细资料</th></tr>
       		<tr>
       			<th>姓名</th>
       			<td>${obj.ceoName}</td>
       			<th>性别</th>
       			<td>${obj.ceoSex}</td>
       			<th>年龄</th>
       			<td>${obj.ceoAge}</td>
       		</tr>
       		<tr>
       			<th>学历</th>
       			<td>${obj.ceoEducation}</td>
       			<th>职称</th>
       			<td>${obj.ceoJobTitle}</td>
       			<th>民族</th>
       			<td>${obj.ceoEthnic}</td>
       		</tr>
       		<tr>
       			<th>身份证号</th>
       			<td>${obj.ceoIdNumber}</td>
       			<th>职务</th>
       			<td colspan="3">${obj.ceoPosition}</td>
       		</tr>
       		<tr>
       			<th>电话</th>
       			<td>${obj.ceoPhone}</td>
       			<th>手机</th>
       			<td colspan="3">${obj.ceoMobilePhone}</td>
       		</tr>
    	</table>
    	
     	<table class="gridtable">
    		<tr><th colspan="4"  style="background-color:#fafafa">个人简历</th></tr>
       		<tr><th>起止年月</th><th>单位</th><th>职务/职称</th><th>主要兼职</th></tr>
       		<tr>
       			<td><fmt:formatDate value="${obj.cvStart}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd}" pattern="yyyy年MM月dd日" /></td>
       			<td>${obj.cvUnit}</td>
       			<td>${obj.cvPosition}</td>
       			<td>${obj.cvPartTime}</td>
       		</tr>
       		<tr>
       			<td><fmt:formatDate value="${obj.cvStart2}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd2}" pattern="yyyy年MM月dd日" /></td>
       			<td>${obj.cvUnit2}</td>
       			<td>${obj.cvPosition2}</td>
       			<td>${obj.cvPartTime2}</td>
       		</tr>
       		<tr>
       			<td><fmt:formatDate value="${obj.cvStart3}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd3}" pattern="yyyy年MM月dd日" /></td>
       			<td>${obj.cvUnit3}</td>
       			<td>${obj.cvPosition3}</td>
       			<td>${obj.cvPartTime3}</td>
       		</tr>
       		<tr>
       			<td><fmt:formatDate value="${obj.cvStart4}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd4}" pattern="yyyy年MM月dd日" /></td>
       			<td>${obj.cvUnit4}</td>
       			<td>${obj.cvPosition4}</td>
       			<td>${obj.cvPartTime4}</td>
       		</tr>
       		<tr>
       			<td><fmt:formatDate value="${obj.cvStart5}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd5}" pattern="yyyy年MM月dd日" /></td>
       			<td>${obj.cvUnit5}</td>
       			<td>${obj.cvPosition5}</td>
       			<td>${obj.cvPartTime5}</td>
       		</tr>
       	</table>
       	
       	<table class="gridtable">
       		<tr>
       			<th>联系人</th>
       			<td>${obj.contectsName}</td>
       			<th>职务</th>
       			<td>${obj.contectsPosition}</td>
       			<th>手机</th>
       			<td>${obj.contectsMobilePhone}</td>
       		</tr>
       		<tr>
       			<th>电话</th>
       			<td>${obj.contectsPhone}</td>
       			<th>传真</th>
       			<td>${obj.contectsFax}</td>
       			<th>电子信箱</th>
       			<td>${obj.contectsEmail}</td>
       		</tr>
       		<tr>
       			<th>单位简介（包括发展概况、主要业务及其规模等）</th>
       			<td colspan="5">${obj.unitSummary}</td>
       		</tr>
       		<tr>
       			<th>主要产品及其特点</th>
       			<td colspan="5">${obj.unitProduct}</td>
       		</tr>
       		<tr>
       			<th>年营业额（单位：万元）</th>
       			<td colspan="5">${obj.unitAnnualTurnover}</td>
       		</tr>
       		<tr>
       			<th>对协会有何希望及要求</th>
       			<td colspan="5">${obj.unitIdea}</td>
       		</tr>
       		<tr>
       			<th>入会承诺</th><td colspan="5">作为中国农业产业诚信联盟会员，我保证，拥护并遵守联盟章程，执行联盟决议，认真履行会员义务，维护行业利益，参加联盟活动，按时缴纳会费。本申请表提供的资料内容真实可靠，如有失实，愿意承担法律责任。</td>
       		</tr>
    	</table>
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

</body>
</html>

