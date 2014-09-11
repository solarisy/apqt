<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>个人信息</title>

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
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<h3 class="page-title">个人信息</h3>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>认证管理<i class="icon-angle-right"></i></li>							<li>个人详情</li>													</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">					<div class="span12">						<!-- BEGIN VALIDATION STATES-->						<div class="portlet box purple">							<div class="portlet-title">								<div class="caption"><i class="icon-reorder"></i>个人详情</div>								<div class="tools">									<a href="javascript:;" class="collapse"></a>								</div>							</div>														<div class="portlet-body form">														<div class="form-horizontal form-view">															<!-- BEGIN FORM-->								<input type="hidden" name="id" value="${personal.id}"/>								<h3 class="form-section">个人信息</h3>								<!-- BEGIN FORM-->								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">身份证号</label>											<div class="controls">												<span class="text">${personal.idNumber}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">姓名</label>											<div class="controls">												<span class="text">${personal.name}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">性别</label>											<div class="controls">												<span class="text">${personal.sex}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">国籍</label>											<div class="controls">												<span class="text">${personal.country}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">工作单位</label>											<div class="controls">												<span class="text">${personal.unit}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">单位地址<span class="required">*</span></label>											<div class="controls">												<span class="text">${personal.unitAddress}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">职务</label>											<div class="controls">												<span class="text">${personal.duty}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">手机</label>											<div class="controls">												<span class="text">${personal.mobilephone}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">座机</label>											<div class="controls">												<span class="text">${personal.phone}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">QQ</label>											<div class="controls">												<span class="text">${personal.qq}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">Email</label>											<div class="controls">												<span class="text">${personal.email}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">学历</label>											<div class="controls">												<span class="text">${personal.education}</span>											</div>										</div>									</div>								</div>								<div class="row-fluid">									<div class="span6">										<div class="control-group">											<label class="control-label">学位</label>											<div class="controls">												<span class="text">${personal.degree}</span>											</div>										</div>									</div>									<div class="span6">										<div class="control-group">											<label class="control-label">所属的公司</label>											<div class="controls">												<span class="text">${personal.companyName}</span>											</div>										</div>									</div>								</div>																<!-- BEGIN Image-->								<h3 class="form-section">个人图片</h3>								<div class="clearfix"></div>								<div class="row-fluid">								<c:forEach items="${imageList}" var="obj" varStatus="status">									<c:if test="${status.count%4==1}"><div class="span3" style="margin-left: 0px;"></c:if>									<c:if test="${status.count%4!=1}"><div class="span3"></c:if>										<div class="item">											<a class="fancybox-button" data-rel="fancybox-button" title="${obj.name}" href="${ctx}/images/${obj.newFilename}">												<div class="zoom">													<img src="${ctx}/images/${obj.thumbnailFilename}" alt="Photo" class="img-thumbnail"/>                    													<div class="zoom-icon"></div>												</div>											</a>											<div class="details">												${obj.name}											</div>										</div>									</div>								</c:forEach>								</div>								<c:if test="${empty imageList}">								<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close"></button>没有图片信息。</div>								</c:if>								<!-- END Image -->								</div>								<div class="form-actions">									<c:choose>										<c:when test="${action == 'create'}"><a href="${ctx}/cert/personal/create" class="btn">继续添加</a></c:when>										<c:when test="${action == 'update'}"><a href="${ctx}/cert/personal/list" class="btn">返回人员列表</a>&nbsp;<a href="javascript:history.back();" class="btn">返回上一步</a></c:when>										<c:otherwise><a href="javascript:history.back();" class="btn">返回</a></c:otherwise>									</c:choose>																	</div>								<!-- END FORM-->							</div>						</div>						<!-- END VALIDATION STATES-->					</div>				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>		<script>		$(document).ready(function() {			App.initFancybox();						$('.text-toggle-button').toggleButtons({	            width: 200,	            height: 30,	            label: {	                enabled: "通过",	                disabled: "不通过"	            },	            style: {	                // Accepted values ["primary", "danger", "info", "success", "warning"] or nothing	                enabled: "success",	                disabled: "danger"	            }	        });		});	</script></body>
	
</html>