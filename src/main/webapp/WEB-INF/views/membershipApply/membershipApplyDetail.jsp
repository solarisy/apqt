<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>	<meta charset="utf-8" /></head><!-- END HEAD -->
<!-- BEGIN BODY --><body class="page-header-fixed">
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
		<!-- BEGIN SIDEBAR -->
			<!-- Import Menu -->        			<jsp:include page="../../layouts/menu.jsp"></jsp:include>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->        
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->						<!-- Import Style Setting Button -->        						<jsp:include page="../../layouts/style-setting.jsp"></jsp:include>
						<!-- END BEGIN STYLE CUSTOMIZER -->  
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<h3 class="page-title">会员单位申请</h3>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li><a href="${ctx}/membershipApply/list">会员单位申请列表</a><i class="icon-angle-right"></i></li>							<li>会员单位申请信息</li>													</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">					<div class="span12">						<!-- BEGIN VALIDATION STATES-->						<div class="portlet box purple">							<div class="portlet-title">								<div class="caption"><i class="icon-reorder"></i>会员单位申请信息</div>								<div class="tools">									<a href="javascript:;" class="collapse"></a>								</div>							</div><div class="portlet-body">		<table class="table table-striped table-bordered table-hover" id="sample_1">       		<tr>       			<th>单位名称（全称）</th>       			<td colspan="3">${obj.unitName}</td>       		</tr>       		<tr>       			<th>注册机关及文号</th>       			<td>${obj.unitRegNumber}</td>       			<th>单位性质</th>       			<td>${obj.unitProperty}</td>       		</tr>       		<tr>       			<th>详细通信地址</th>       			<td>${obj.unitAddress}</td>       			<th>邮编</th>       			<td>${obj.unitZip}</td>       		</tr>       		<tr>       			<th>单位网址</th>       			<td>${obj.unitUrl}</td>       			<th>是否申请理事单位</th>       			<td>${obj.unitGoverning}</td>       		</tr>       	</table>    	     	<table class="table table-striped table-bordered table-hover" id="sample_1">       		<tr><th colspan="6" style="background-color:#fafafa">负责人详细资料</th></tr>       		<tr>       			<th>姓名</th>       			<td>${obj.ceoName}</td>       			<th>性别</th>       			<td>${obj.ceoSex}</td>       			<th>年龄</th>       			<td>${obj.ceoAge}</td>       		</tr>       		<tr>       			<th>学历</th>       			<td>${obj.ceoEducation}</td>       			<th>职称</th>       			<td>${obj.ceoJobTitle}</td>       			<th>民族</th>       			<td>${obj.ceoEthnic}</td>       		</tr>       		<tr>       			<th>身份证号</th>       			<td>${obj.ceoIdNumber}</td>       			<th>职务</th>       			<td colspan="3">${obj.ceoPosition}</td>       		</tr>       		<tr>       			<th>电话</th>       			<td>${obj.ceoPhone}</td>       			<th>手机</th>       			<td colspan="3">${obj.ceoMobilePhone}</td>       		</tr>    	</table>    	     	<table class="table table-striped table-bordered table-hover" id="sample_1">    		<tr><th colspan="4"  style="background-color:#fafafa">个人简历</th></tr>       		<tr><th>起止年月</th><th>单位</th><th>职务/职称</th><th>主要兼职</th></tr>       		<tr>       			<td><fmt:formatDate value="${obj.cvStart}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd}" pattern="yyyy年MM月dd日" /></td>       			<td>${obj.cvUnit}</td>       			<td>${obj.cvPosition}</td>       			<td>${obj.cvPartTime}</td>       		</tr>       		<tr>       			<td><fmt:formatDate value="${obj.cvStart2}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd2}" pattern="yyyy年MM月dd日" /></td>       			<td>${obj.cvUnit2}</td>       			<td>${obj.cvPosition2}</td>       			<td>${obj.cvPartTime2}</td>       		</tr>       		<tr>       			<td><fmt:formatDate value="${obj.cvStart3}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd3}" pattern="yyyy年MM月dd日" /></td>       			<td>${obj.cvUnit3}</td>       			<td>${obj.cvPosition3}</td>       			<td>${obj.cvPartTime3}</td>       		</tr>       		<tr>       			<td><fmt:formatDate value="${obj.cvStart4}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd4}" pattern="yyyy年MM月dd日" /></td>       			<td>${obj.cvUnit4}</td>       			<td>${obj.cvPosition4}</td>       			<td>${obj.cvPartTime4}</td>       		</tr>       		<tr>       			<td><fmt:formatDate value="${obj.cvStart5}" pattern="yyyy年MM月dd日" />--<fmt:formatDate value="${obj.cvEnd5}" pattern="yyyy年MM月dd日" /></td>       			<td>${obj.cvUnit5}</td>       			<td>${obj.cvPosition5}</td>       			<td>${obj.cvPartTime5}</td>       		</tr>       	</table>       	       	<table class="table table-striped table-bordered table-hover" id="sample_1">       		<tr>       			<th>联系人</th>       			<td>${obj.contectsName}</td>       			<th>职务</th>       			<td>${obj.contectsPosition}</td>       			<th>手机</th>       			<td>${obj.contectsMobilePhone}</td>       		</tr>       		<tr>       			<th>电话</th>       			<td>${obj.contectsPhone}</td>       			<th>传真</th>       			<td>${obj.contectsFax}</td>       			<th>电子信箱</th>       			<td>${obj.contectsEmail}</td>       		</tr>       		<tr>       			<th>单位简介（包括发展概况、主要业务及其规模等）</th>       			<td colspan="5">${obj.unitSummary}</td>       		</tr>       		<tr>       			<th>主要产品及其特点</th>       			<td colspan="5">${obj.unitProduct}</td>       		</tr>       		<tr>       			<th>年营业额（单位：万元）</th>       			<td colspan="5">${obj.unitAnnualTurnover}</td>       		</tr>       		<tr>       			<th>对协会有何希望及要求</th>       			<td colspan="5">${obj.unitIdea}</td>       		</tr>       		<tr>       			<th>入会承诺</th><td colspan="5">作为中国农业产业诚信联盟会员，我保证，拥护并遵守联盟章程，执行联盟决议，认真履行会员义务，维护行业利益，参加联盟活动，按时缴纳会费。本申请表提供的资料内容真实可靠，如有失实，愿意承担法律责任。</td>       		</tr>    	</table>														</div>						</div>						<!-- END VALIDATION STATES-->					</div>				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>	</body>
	
</html>