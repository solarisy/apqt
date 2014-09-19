<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>平台管理员</title>

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
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<h3 class="page-title">平台管理员</h3>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>人员管理<i class="icon-angle-right"></i></li>							<li>平台管理员<i class="icon-angle-right"></i></li>							<c:if test="${action == 'create'}">								<li>新增平台管理员</li>							</c:if>							<c:if test="${action == 'update'}">								<li>编辑平台管理员</li>							</c:if>						</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">					<div class="span12">						<!-- BEGIN VALIDATION STATES-->						<div class="portlet box red">							<div class="portlet-title">								<div class="caption"><i class="icon-reorder"></i>请填写平台管理员信息</div>								<div class="tools">									<a href="javascript:;" class="collapse"></a>								</div>							</div>							<div class="portlet-body form">								<!-- BEGIN FORM-->								<form action="${ctx}/admin/plantform-admin/${action}" id="inputForm" class="form-horizontal" method="post">									<input type="hidden" name="id" value="${user.id}"/>									<div class="control-group">										<label class="control-label">账号<span class="required">*</span></label>										<div class="controls">											<input type="text" name="loginName" value="${user.loginName}" id="loginName" data-required="1" class="span6 m-wrap required"/>										</div>									</div>																		<div class="control-group">										<label class="control-label">真实姓名<span class="required">*</span></label>										<div class="controls">											<input type="text" name="name" value="${user.name}" data-required="1" class="span6 m-wrap"/>										</div>									</div>																		<div class="control-group">										<label class="control-label">手机</label>										<div class="controls">											<input name="mobilephone" value="${user.mobilephone}" type="text" class="span6 m-wrap"/>										</div>									</div>									<div class="control-group">										<label class="control-label">Email</label>										<div class="controls">											<input name="email" value="${user.email}" type="text" class="span6 m-wrap"/>										</div>									</div>									<div class="form-actions">										<button type="submit" class="btn purple">提交</button>										<button type="button" class="btn" onclick="history.back()">返回</button>									</div>								</form>								<!-- END FORM-->							</div>						</div>						<!-- END VALIDATION STATES-->					</div>				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>		<script>		$(document).ready(function() {			//聚焦第一个输入框			$("#loginName").focus();			// for more info visit the official plugin documentation:             // http://docs.jquery.com/Plugins/Validation            $('#inputForm').validate({                errorElement: 'span', //default input error message container                errorClass: 'help-inline', // default input error message class                focusInvalid: true, // do not focus the last invalid input                ignore: "",                rules: {                	loginName: {                		minlength: 2,                		maxlength: 64,                        required: true,                        remote: "${ctx}/admin/user/ajax/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')                	},                    name: {                        minlength: 2,                        maxlength: 64,                        required: true                    },                    email: {                        maxlength: 255,                        email: true                    }                },                messages: {					loginName: {						remote: "用户登录名已存在"					}				},                highlight: function (element) { // hightlight error inputs                    $(element).closest('.help-inline').removeClass('ok'); // display OK icon                    $(element).closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group                },                unhighlight: function (element) { // revert the change dony by hightlight                    $(element).closest('.control-group').removeClass('error'); // set error class to the control group                },                success: function (label) {                    label                    .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group                }            });		});	</script></body>
	
</html>