<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>录入客户信息</title>

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
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<c:if test="${action == 'create'}">							<h3 class="page-title">录入公司信息</h3>						</c:if>						<c:if test="${action == 'update'}">							<h3 class="page-title">公司审核</h3>						</c:if>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>认证管理<i class="icon-angle-right"></i></li>							<li>公司认证<i class="icon-angle-right"></i></li>							<c:if test="${action == 'create'}">								<li>录入公司信息</li>							</c:if>							<c:if test="${action == 'update'}">								<li><a href="${ctx}/cert/company/audit/list">公司审核</a><i class="icon-angle-right"></i></li>								<li>修改公司信息</li>							</c:if>							<li></li>						</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">					<div class="span12">						<!-- BEGIN VALIDATION STATES-->						<div class="portlet box blue" id="form_wizard_1">							<div class="portlet-title">								<c:if test="${action == 'create'}">									<div class="caption"><i class="icon-reorder"></i>录入公司信息</div>								</c:if>								<c:if test="${action == 'update'}">									<div class="caption"><i class="icon-reorder"></i>修改公司信息</div>								</c:if>																<div class="tools">									<a href="javascript:;" class="collapse"></a>								</div>							</div>							<div class="portlet-body form">								<!-- BEGIN FORM-->								<form action="${ctx}/cert/company/${action}" id="inputForm" method="post" class="form-horizontal">									<div class="form-wizard">																			<div class="navbar steps">											<div class="navbar-inner">												<ul class="row-fluid">													<li class="span6">														<a href="#tab1" data-toggle="tab" class="step active">														<span class="number">1</span>														<span class="desc"><i class="icon-ok"></i>公司信息</span>   														</a>													</li>													<li class="span6">														<a href="#tab2" data-toggle="tab" class="step">														<span class="number">2</span>														<span class="desc"><i class="icon-ok"></i>公司图片</span>   														</a>													</li>												</ul>											</div>										</div>																				<div id="bar" class="progress progress-success progress-striped">											<div class="bar"></div>										</div>																				<div class="tab-content">																					<div class="tab-pane active" id="tab1">												<h3 class="block">请填写公司信息</h3>																						<input type="hidden" name="id" value="${company.id}"/>												<div class="control-group">																<label class="control-label">组织机构代码<span class="required">*</span></label>																<div class="controls">																	<input type="text" name="orgcode" value="${company.orgcode}" id="orgcode" data-required="1" class="span6 m-wrap required"/>																</div>															</div>																								<div class="control-group">																<label class="control-label">中文名<span class="required">*</span></label>																<div class="controls">																	<input type="text" name="nameCn" value="${company.nameCn}" data-required="1" class="span6 m-wrap required "/>																</div>															</div>																								<div class="control-group">																<label class="control-label">英文名</label>																<div class="controls">																	<input name="nameEn" value="${company.nameEn}" type="text" class="span6 m-wrap"/>																</div>															</div>															<div class="control-group">																<label class="control-label">营业执照注册号</label>																<div class="controls">																	<input name="registeredNumber" value="${company.registeredNumber}" type="text" class="span6 m-wrap"/>																</div>															</div>																								<div class="control-group">													<label class="control-label">税务登记证号</label>													<div class="controls">														<input name="taxNumber" value="${company.taxNumber}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">所属行业</label>													<div class="controls">														<input name="industry" value="${company.industry}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">单位性质</label>													<div class="controls">														<input name="unitPropertie" value="${company.unitPropertie}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">成立时间</label>													<div class="controls">														<input id="foundedDate" name="foundedDate" value="<fmt:formatDate value="${company.foundedDate}" pattern="yyyy-MM-dd"></fmt:formatDate>" type="text" class="span6 m-wrap Wdate" onClick="WdatePicker()"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">经营范围</label>													<div class="controls">														<input name="businessScope" value="${company.businessScope}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">年营业额</label>													<div class="controls">														<input name="annualTurnover" value="${company.annualTurnover}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">员工人数</label>													<div class="controls">														<input name="employeeNumber" value="${company.employeeNumber}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">法人代表</label>													<div class="controls">														<input name="legalRepresentative" value="${company.legalRepresentative}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">基本账户开户行</label>													<div class="controls">														<input name="basicBank" value="${company.basicBank}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">基本账户账号</label>													<div class="controls">														<input name="basicBankAccount" value="${company.basicBankAccount}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">注册资金</label>													<div class="controls">														<input name="registeredCapital" value="${company.registeredCapital}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">单位网址</label>													<div class="controls">														<input name="website" value="${company.website}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">注册地址</label>													<div class="controls">														<input name="registeredAddress" value="${company.registeredAddress}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">联系人地址</label>													<div class="controls">														<input name="contactsAddress" value="${company.contactsAddress}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">邮编</label>													<div class="controls">														<input name="zip" value="${company.zip}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">联系人</label>													<div class="controls">														<input name="contacts" value="${company.contacts}" type="text" class="span6 m-wrap"/>													</div>												</div>																								<div class="control-group">													<label class="control-label">联系电话</label>													<div class="controls">														<input name="contactsPhone" value="${company.contactsPhone}" type="text" class="span6 m-wrap"/>													</div>												</div>											</div>																						<div class="tab-pane" id="tab2">												<h3 class="block">请上传公司图片</h3>											</div>																				</div>																				<div class="form-actions clearfix">											<button type="submit" class="btn purple button-submit">提交</button>														<button type="button" class="btn" onclick="history.back()">返回</button>										</div>																			</div>								</form>								<!-- END FORM-->							</div>						</div>						<!-- END VALIDATION STATES-->					</div>				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>		<script>		$(document).ready(function() {			//聚焦第一个输入框			$("#orgcode").focus();			// for more info visit the official plugin documentation:             // http://docs.jquery.com/Plugins/Validation            $('#inputForm').validate({                errorElement: 'span', //default input error message container                errorClass: 'help-inline', // default input error message class                focusInvalid: false, // do not focus the last invalid input                ignore: "",                highlight: function (element) { // hightlight error inputs                    $(element).closest('.help-inline').removeClass('ok'); // display OK icon                    $(element).closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group                },                unhighlight: function (element) { // revert the change dony by hightlight                    $(element).closest('.control-group').removeClass('error'); // set error class to the control group                },                success: function (label) {                    label                    .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group                },                submitHandler: function (form) {                    $('#form_wizard_1 .button-submit').hide();                    form.submit();                }            });						//wizard settings			 if (!jQuery().bootstrapWizard) {                return;            }						// default form wizard            $('#form_wizard_1').bootstrapWizard({                'nextSelector': '.button-next',                'previousSelector': '.button-previous',                onTabClick: function (tab, navigation, index) {                    return false;                },                onNext: function (tab, navigation, index) {                                    },                onPrevious: function (tab, navigation, index) {                },                onTabShow: function (tab, navigation, index) {                    $('#form_wizard_1').find('.bar').css({                        width: 50 + '%'                    });                }            });					});	</script></body>
	
</html>