<%@ page contentType="text/html;charset=UTF-8" %><%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%><%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%><%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>

<head>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
			<!-- Import Menu -->        			<jsp:include page="../layouts/menu.jsp"></jsp:include>

		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div id="portlet-config" class="modal hide">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button"></button>
					<h3>Widget Settings</h3>
				</div>
				<div class="modal-body">
					Widget settings form goes here
				</div>
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->

						<!-- END BEGIN STYLE CUSTOMIZER -->    
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">							首页						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="${ctx}">首页</a> 

							</li>
							<li class="pull-right no-text-shadow">
								<div id="dashboard-report-range" class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive" data-tablet="" data-desktop="tooltips" data-placement="top" data-original-title="Change dashboard date range">
									<i class="icon-calendar"></i>
									<span></span>
									<i class="icon-angle-down"></i>
								</div>
							</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<div id="dashboard">
					<!-- BEGIN DASHBOARD STATS -->
					<div class="row-fluid">						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">							<div class="dashboard-stat blue">								<div class="visual">									<i class="icon-comments"></i>								</div>								<div class="details">									<div class="number">权威</div>									<div class="desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;依托国家主流媒体<br/>&nbsp;</div>								</div>																<a class="more" href="${ctx}/cert/company/create">								新增公司认证 <i class="m-icon-swapright m-icon-white"></i>								</a>                   							</div>						</div>						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">							<div class="dashboard-stat green">								<div class="visual">									<i class="icon-shopping-cart"></i>								</div>								<div class="details">									<div class="number">先进</div>									<div class="desc">采用云平台管理技术<br/>&nbsp;</div>								</div>								<a class="more" href="${ctx}/cert/personal/create">								新增个人认证 <i class="m-icon-swapright m-icon-white"></i>								</a>                 							</div>						</div>						<div class="span3 responsive" data-tablet="span6  fix-offset" data-desktop="span3">							<div class="dashboard-stat purple">								<div class="visual">									<i class="icon-globe"></i>								</div>								<div class="details" style="width:200px;">									<div class="number">全面</div>									<div class="desc">涵盖全部农产品生产、流通、销售企业</div>								</div>								<a class="more" href="#">								 &nbsp;								</a>                 							</div>						</div>						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">							<div class="dashboard-stat yellow">								<div class="visual">									<i class="icon-bar-chart"></i>								</div>								<div class="details">									<div class="number">方便</div>									<div class="desc">提供用户满意的各类服务<br/>&nbsp;</div>								</div>								<a class="more" href="#">								&nbsp;								</a>                 							</div>						</div>					</div>
					<!-- END DASHBOARD STATS -->
					<div class="clearfix"></div>
					<div class="row-fluid">
<div class="">						<!-- BEGIN BORDERED TABLE PORTLET-->						<div class="portlet box green">							<div class="portlet-body">								<div class="row-fluid search-forms search-default">									<form action="${ctx}/search" id="inputForm" method="post" class="form-search">										<div class="chat-form">											<div class="input-cont">   												<input type="text" name="certcode" value="${certcode}" placeholder="请输入诚信码..." class="m-wrap" />											</div>											<button type="submit" class="btn green">快速查询 &nbsp; <i class="m-icon-swapright m-icon-white"></i></button>										</div>									</form>								</div>									<c:forEach items="${list}" var="obj" varStatus="status">								<div class="search-classic">									<h4><a href="${ctx}/cert/company/detail/${obj.id}/search">${obj.nameCn}</a></h4>									<p>诚信码: ${obj.certcode}</p>									<a href="${obj.website}">${obj.website}</a>									<p>组织机构代码: ${obj.orgcode}</p>									<p>营业执照注册号: ${obj.registeredNumber}</p>								</div>								</c:forEach>															</div>						</div>						<!-- END BORDERED TABLE PORTLET-->					</div>


					</div>
				</div>
			</div>
			<!-- END PAGE CONTAINER-->    
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	</body>
<!-- END BODY -->
</html>