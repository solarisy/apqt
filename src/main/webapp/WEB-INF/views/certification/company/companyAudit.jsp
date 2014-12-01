<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>公司信息</title>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
		<!-- BEGIN SIDEBAR -->
			<!-- Import Menu -->        			<jsp:include page="../../../layouts/menu.jsp"></jsp:include>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->        
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->						<!-- Import Style Setting Button -->        						<jsp:include page="../../../layouts/style-setting.jsp"></jsp:include>
						<!-- END BEGIN STYLE CUSTOMIZER -->  
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<h3 class="page-title">公司审核</h3>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>认证管理<i class="icon-angle-right"></i></li>							<li>公司认证<i class="icon-angle-right"></i></li>							<li>公司审核</li>													</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">					<div class="span12">						<!-- BEGIN VALIDATION STATES-->						<div class="portlet box blue">							<div class="portlet-title">								<div class="caption"><i class="icon-reorder"></i>公司审核</div>								<div class="tools">									<a href="javascript:;" class="collapse"></a>								</div>							</div>														<div class="portlet-body form">														<div class="form-horizontal form-view">															<!-- BEGIN FORM-->							<form action="${ctx}/cert/company/audit/save" id="inputForm" method="post" class="form-horizontal">								<input type="hidden" name="id" value="${company.id}"/>								<h3 class="form-section">公司信息</h3>								<!-- BEGIN FORM-->								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">组织机构代码</label>											<div class="controls">												<span class="text">${company.orgcode}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">中文名</label>											<div class="controls">												<span class="text">${company.nameCn}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">英文名</label>											<div class="controls">												<span class="text">${company.nameEn}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">营业执照注册号</label>											<div class="controls">												<span class="text">${company.registeredNumber}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">税务登记证号</label>											<div class="controls">												<span class="text">${company.taxNumber}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">所属行业</label>											<div class="controls">												<span class="text">${company.industry}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">单位性质</label>											<div class="controls">												<span class="text">${company.unitPropertie}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">成立时间</label>											<div class="controls">												<span class="text"><fmt:formatDate value="${company.foundedDate}" pattern="yyyy-MM-dd"></fmt:formatDate></span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">经营范围</label>											<div class="controls">												<span class="text">${company.businessScope}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">年营业额</label>											<div class="controls">												<span class="text">${company.annualTurnover}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">员工人数</label>											<div class="controls">												<span class="text">${company.employeeNumber}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">法人代表</label>											<div class="controls">												<span class="text">${company.legalRepresentative}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">基本账户开户行</label>											<div class="controls">												<span class="text">${company.basicBank}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">基本账户账号</label>											<div class="controls">												<span class="text">${company.basicBankAccount}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">注册资金</label>											<div class="controls">												<span class="text">${company.registeredCapital}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">单位网址</label>											<div class="controls">												<span class="text">${company.website}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">注册地址</label>											<div class="controls">												<span class="text">${company.registeredAddress}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">联系人地址</label>											<div class="controls">												<span class="text">${company.contactsAddress}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">邮编</label>											<div class="controls">												<span class="text">${company.zip}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">联系人</label>											<div class="controls">												<span class="text">${company.contacts}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">联系电话</label>											<div class="controls">												<span class="text">${company.contactsPhone}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">获得何种证书</label>											<div class="controls">												<span class="text">${company.certificate}</span>											</div>										</div>									</div>								</div><div class="row-fluid">	<div class="span6">		<div class="control-group">			<label class="control-label">证书日期</label>			<div class="controls">				<span class="text"><fmt:formatDate value="${company.certificateDay}" pattern="yyyy-MM-dd"></fmt:formatDate></span>			</div>		</div>	</div>	<div class="span6">		<div class="control-group">			<label class="control-label">证书颁发机构</label>			<div class="controls">				<span class="text">${company.certificateOrg}</span>			</div>		</div>	</div></div><div class="row-fluid">	<div class="span6">		<div class="control-group">			<label class="control-label">奖励证书</label>			<div class="controls">				<span class="text">${company.rewardCertificates}</span>			</div>		</div>	</div>	<div class="span6">		<div class="control-group">			<label class="control-label">奖励证书颁发日期</label>			<div class="controls">				<span class="text"><fmt:formatDate value="${company.rewardCertificatesDay}" pattern="yyyy-MM-dd"></fmt:formatDate></span>			</div>		</div>	</div></div><div class="row-fluid">	<div class="span6">		<div class="control-group">			<label class="control-label">奖励证书颁发机构</label>			<div class="controls">				<span class="text">${company.rewardCertificatesOrg}</span>			</div>		</div>	</div>	<div class="span6">		<div class="control-group">			<label class="control-label">处罚</label>			<div class="controls">				<span class="text">${company.punishment}</span>			</div>		</div>	</div></div><div class="row-fluid">	<div class="span6">		<div class="control-group">			<label class="control-label">处罚日期</label>			<div class="controls">				<span class="text"><fmt:formatDate value="${company.punishmentDay}" pattern="yyyy-MM-dd"></fmt:formatDate></span>			</div>		</div>	</div>	<div class="span6">		<div class="control-group">			<label class="control-label">处罚机构</label>			<div class="controls">				<span class="text">${company.certificate}</span>			</div>		</div>	</div></div>																<!-- BEGIN Image-->								<h3 class="form-section">公司图片</h3>								<div class="clearfix"></div>								<div class="row-fluid">								<c:forEach items="${imageList}" var="obj" varStatus="status">									<c:if test="${status.count%4==1}"><div class="span3" style="margin-left: 0px;"></c:if>									<c:if test="${status.count%4!=1}"><div class="span3"></c:if>										<div class="item">											<a class="fancybox-button" data-rel="fancybox-button" title="${obj.name}" href="${ctx}/images/${obj.newFilename}">												<div class="zoom">													<img src="${ctx}/images/${obj.thumbnailFilename}" alt="Photo" />                    													<div class="zoom-icon"></div>												</div>											</a>											<div class="details">												${obj.name}											</div>										</div>									</div>								</c:forEach>								</div>								<c:if test="${empty imageList}">								<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close"></button>没有图片信息。</div>								</c:if>								<!-- END Image -->																<h3 class="form-section">审核</h3>								<div class="row-fluid">									<c:if test="${company.auditStatus==0 || company.auditStatus==1}">										<div class="span6">											<div class="control-group">												<label class="control-label"></label>												<div class="controls">													<div class="text-toggle-button">														<input name="auditStatus" value="1" type="checkbox" class="toggle" checked/>													</div>												</div>											</div>										</div>									</c:if>									<c:if test="${company.auditStatus==2}">										<div class="span6">											<div class="control-group">												<label class="control-label"></label>												<div class="controls">													<div class="text-toggle-button">														<input name="auditStatus" value="1" type="checkbox" class="toggle" />													</div>												</div>											</div>										</div>									</c:if>																	</div>								<c:if test="${company.auditStatus==1}">									<div class="alert alert-block alert-success ">										<button type="button" class="close" data-dismiss="alert"></button>										<h4 class="alert-heading">审核结果为：<span class="label label-success">通过</span></h4>									</div>								</c:if>								<c:if test="${company.auditStatus==2}">									<div class="alert alert-block alert-success ">										<button type="button" class="close" data-dismiss="alert"></button>										<h4 class="alert-heading">审核结果为：<span class="label label-important">不通过</span></h4>									</div>								</c:if>																<div class="form-actions">									<c:if test="${company.auditStatus==0 || company.auditStatus==2}">										<button type="submit" class="btn purple">提交</button>									</c:if>									<a href="${ctx}/cert/company/audit/list" class="btn">返回</a>								</div>																</form>								<!-- END FORM-->							</div>							</div>						</div>						<!-- END VALIDATION STATES-->					</div>				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>		<script>		$(document).ready(function() {			App.initFancybox();						$('.text-toggle-button').toggleButtons({	            width: 200,	            height: 30,	            label: {	                enabled: "通过",	                disabled: "不通过"	            },	            style: {	                // Accepted values ["primary", "danger", "info", "success", "warning"] or nothing	                enabled: "success",	                disabled: "danger"	            }	        });		});	</script></body>
	
</html>