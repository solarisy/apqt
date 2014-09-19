<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />


</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

	<!-- BEGIN CONTAINER -->

	<div class="page-container row-fluid">

		<!-- BEGIN SIDEBAR -->

			<!-- Import Menu -->        
			<jsp:include page="../../../layouts/menu.jsp"></jsp:include>

		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->

		<div class="page-content">

			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- BEGIN PAGE CONTAINER-->        

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">
					<div class="span12">

						<!-- BEGIN STYLE CUSTOMIZER -->
						<!-- Import Style Setting Button -->        
						<jsp:include page="../../../layouts/style-setting.jsp"></jsp:include>
						<!-- END BEGIN STYLE CUSTOMIZER -->  

						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">个人列表</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="${ctx}">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>认证管理<i class="icon-angle-right"></i></li>
							<li>个人认证<i class="icon-angle-right"></i></li>
							<li><a href="${ctx}/cert/personal/list">个人列表</a><i class="icon-angle-right"></i></li>
							<li>诚信码</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>
				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->          

				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN VALIDATION STATES-->

						<div class="portlet box purple">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>设置诚信码</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

								</div>

							</div>

							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form action="${ctx}/cert/personal/certcode/save" id="inputForm" class="form-horizontal" method="post">
									<input type="hidden" name="id" value="${personal.id}"/>
									<div class="control-group">
										<label class="control-label">姓名<span class="required">*</span></label>
										<div class="controls">
											<input type="text" value="${personal.name}" disabled id="name" data-required="1" class="span6 m-wrap"/>
										</div>

									</div>
									<div class="control-group">
										<label class="control-label">诚信码<span class="required">*</span></label>
										<div class="controls">
											<input type="text" name="certcode" value="${personal.certcode}" id="certcode" data-required="1" class="span6 m-wrap"/>
										</div>

									</div>
									<div class="form-actions">

										<button type="submit" class="btn purple">提交</button>

										<button type="button" class="btn" onclick="history.back()">返回</button>

									</div>

								</form>

								<!-- END FORM-->

							</div>

						</div>

						<!-- END VALIDATION STATES-->

					</div>

				</div>

				<!-- END PAGE CONTENT-->

			</div>

			<!-- END PAGE CONTAINER-->

		</div>

		<!-- END PAGE -->

	</div>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#certcode").focus();
			// for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            $('#inputForm').validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                	certcode: {
                		minlength: 2,
                		maxLength: 64,
                        required: true
                	}
                },

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