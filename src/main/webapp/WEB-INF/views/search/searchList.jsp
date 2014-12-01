<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>查询接口</title>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
		<!-- BEGIN SIDEBAR -->
			<!-- Import Menu -->        			<jsp:include page="../../layouts/menu.jsp"></jsp:include>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div id="portlet-config" class="modal hide">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button"></button>
					<h3>portlet Settings</h3>
				</div>
				<div class="modal-body">
					<p>Here will be a configuration form</p>
				</div>
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN PAGE CONTAINER-->        
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->						<!-- Import Style Setting Button -->        						<jsp:include page="../../layouts/style-setting.jsp"></jsp:include>
						<!-- END BEGIN STYLE CUSTOMIZER -->  
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<h3 class="page-title">查询接口</h3>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>查询接口</li>						</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">
					<div class="">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box green">													<div class="portlet-title">								<div class="caption"><i class="icon-globe"></i>查询接口</div>								<div class="tools">									<a href="javascript:;" class="collapse"></a>								</div>							</div>							<div class="portlet-body">
								<div class="row-fluid search-forms search-default">									<form action="${ctx}/search" id="inputForm" method="post" class="form-search">										<div class="chat-form">											<div class="input-cont">   												<input type="text" name="certcode" value="${certcode}" placeholder="请输入诚信信用码..." class="m-wrap" />											</div>											<button type="submit" class="btn green"> 查询 &nbsp; <i class="m-icon-swapright m-icon-white"></i></button>										</div>									</form>								</div>									<c:if test="${not empty companyList }">									<c:forEach items="${companyList}" var="obj" varStatus="status">										<div class="search-classic">											<h4><a href="${ctx}/cert/company/detail-search/${obj.id}">${obj.nameCn}</a></h4>											<p>诚信信用码: ${obj.certcode}</p>											<p>组织机构代码: ${obj.orgcode}</p>											<p>营业执照注册号: ${obj.registeredNumber}</p>										</div>									</c:forEach>								</c:if>																<c:if test="${not empty personalList }">									<c:forEach items="${personalList}" var="obj" varStatus="status">										<div class="search-classic">											<h4><a href="${ctx}/cert/personal/detail-search/${obj.id}">${obj.name}</a></h4>											<p>身份证号码: ${obj.idNumber}</p>										</div>									</c:forEach>								</c:if>																								<c:if test="${empty companyList and empty personalList and not empty certcode}">								<div id="message" class="alert alert-success">没有符合条件的数据。</div>								</c:if>								</div>
						</div>		<br/><br/><br/><br/><br/><br/><br/><br/><br/>		<br/><br/><br/><br/><br/><br/><br/><br/><br/>		
						<!-- END BORDERED TABLE PORTLET-->
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div></body>
	
</html>