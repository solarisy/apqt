<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>个人列表</title>

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
						<!-- BEGIN STYLE CUSTOMIZER -->						<!-- Import Style Setting Button -->        						<jsp:include page="../../../layouts/style-setting.jsp"></jsp:include>
						<!-- END BEGIN STYLE CUSTOMIZER -->  
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<h3 class="page-title">个人列表</h3>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>认证管理<i class="icon-angle-right"></i></li>							<li>个人认证<i class="icon-angle-right"></i></li>							<li>个人列表</li>						</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">
					<div class="">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box purple">
							<div class="portlet-title">
								<div class="caption"><i class="icon-user"></i>个人列表</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-striped table-bordered  table-hover">									<thead>										<tr>											<th>#</th>											<th>身份证号</th>											<th>姓名</th>											<th>所属公司</th>											<th>联系电话</th>											<th class="hidden-480">申请时间</th>											<th class="hidden-480">诚信信用码</th>											<th class="hidden-480">状态</th>											<th>操作</th>										</tr>									</thead>									<tbody>										<c:forEach items="${list}" var="obj" varStatus="status">										<tr>											<td>${status.count}</td>											<td>${obj.idNumber}</td>											<td><a href="${ctx}/cert/personal/detail/${obj.id}/list">${obj.name}</a></td>											<td>${obj.companyName}</td>											<td>${obj.mobilephone}</td>											<td class="hidden-480"><fmt:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>											<td>${obj.certcode}</td>											<td>												<!-- 													0：未审核；1：审核通过；2：审核不通过												 --> 												<c:if test="${obj.auditStatus==0}"><span class="label label-inverse">未审核</span></c:if>												<c:if test="${obj.auditStatus==1}"><span class="label label-success">审核通过</span></c:if>												<c:if test="${obj.auditStatus==2}"><span class="label label-important">不通过</span></c:if>											</td>											<td>												<shiro:hasAnyRoles name="system_admin, super_admin, plantform_admin">												<c:if test="${obj.auditStatus==1}">													<a href="${ctx}/cert/personal/certcode/${obj.id}" class="btn mini yellow"><i class="icon-barcode"></i> 诚信信用码</a>												</c:if>												</shiro:hasAnyRoles>												<shiro:hasAnyRoles name="super_admin,system_admin,plantform_admin,proxy_admin,proxy_user">												<a href="${ctx}/cert/personal/pass/update/${obj.id}" class="btn mini green"><i class="icon-edit"></i> 修改</a>												</shiro:hasAnyRoles>											</td>										</tr>										</c:forEach>									</tbody>								</table>								<c:if test="${empty list}">								<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close"></button>没有符合条件的数据。</div>								</c:if>								
							</div>
						</div>							<script>		function delConfirm(del_url){			bootbox.dialog({				  message: "删除后不可恢复，是否删除数据？",				  title: "删除确认",				  buttons: {				    success: {				      label: "取消",				      className: "btn"				    },				    danger: {				      label: "删除",				      className: "btn black",				      callback: function() {				    	  location.href = del_url;				      }				    }				  }			});		}	    </script>		<br/><br/><br/><br/><br/><br/><br/><br/><br/>		<br/><br/><br/><br/><br/><br/><br/><br/><br/>		
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