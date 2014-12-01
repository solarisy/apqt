<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>录入个人信息</title>

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
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<c:if test="${action == 'create'}">							<h3 class="page-title">录入个人信息</h3>						</c:if>						<c:if test="${action == 'update'}">							<h3 class="page-title">个人列表</h3>						</c:if>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>认证管理<i class="icon-angle-right"></i></li>							<li>个人认证<i class="icon-angle-right"></i></li>							<c:if test="${action == 'create'}">								<li>录入个人信息</li>							</c:if>							<c:if test="${action == 'update'}">								<li><a href="${ctx}/cert/personal/list">个人列表</a><i class="icon-angle-right"></i></li>								<li>修改个人信息</li>							</c:if>													</ul>						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">					<div class="span12">						<!-- BEGIN VALIDATION STATES-->						<div class="portlet box purple" id="form_wizard_1">							<div class="portlet-title">								<c:if test="${action == 'create'}">									<div class="caption"><i class="icon-reorder"></i>录入个人信息第二步</div>								</c:if>								<c:if test="${action == 'update'}">									<div class="caption"><i class="icon-reorder"></i>编辑个人信息第二步</div>								</c:if>								<div class="tools">									<a href="javascript:;" class="collapse"></a>								</div>							</div>							<div class="portlet-body form">								<!-- BEGIN FORM-->									<div class="form-wizard">																			<div class="navbar steps">											<div class="navbar-inner">												<ul class="row-fluid">													<li class="span6">														<a href="#tab1" data-toggle="tab" class="step active">														<span class="number">1</span>														<span class="desc"><i class="icon-ok"></i>个人信息</span>   														</a>													</li>													<li class="span6">														<a href="#tab2" data-toggle="tab" class="step">														<span class="number">2</span>														<span class="desc"><i class="icon-ok"></i>个人图片</span>   														</a>													</li>												</ul>											</div>										</div>																				<div id="bar" class="progress progress-success progress-striped">											<div class="bar"></div>										</div>																				<div class="tab-content">																					<div class="tab-pane active" id="tab1">												<h3 class="block">请填写个人信息</h3>											</div>																						<div class="tab-pane" id="tab2">												<h3 class="block">请上传个人图片</h3>												<div class="span12">													<!-- The file upload form used as target for the file upload widget -->																				<form id="fileupload" action="${ctx}/cert/personal/upload" method="POST" enctype="multipart/form-data">																												<input type="hidden" name="id" value="${personal.id}">														<!-- Redirect browsers with JavaScript disabled to the origin page -->																					<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->																					<div class="row-fluid fileupload-buttonbar">															<div class="span7">																<!-- The fileinput-button span is used to style the file input field as button -->																<span class="btn green fileinput-button">																	<i class="icon-plus icon-white"></i>																	<span>添加文件...</span>																	<input type="file" name="files[]" multiple>																</span>																<button type="submit" class="btn blue start">																	<i class="icon-upload icon-white"></i>																	<span>全部上传</span>																</button>																<button type="reset" class="btn yellow cancel">																	<i class="icon-ban-circle icon-white"></i>																	<span>全部取消</span>																</button>																<button type="button" class="btn red delete">																	<i class="icon-trash icon-white"></i>																	<span>删除</span>																</button>																<input type="checkbox" class="toggle fileupload-toggle-checkbox">															</div>																						<!-- The global progress information -->															<div class="span5 fileupload-progress fade">																<!-- The global progress bar -->																<div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">																	<div class="bar" style="width:0%;"></div>																</div>																<!-- The extended global progress information -->																<div class="progress-extended">&nbsp;</div>															</div>														</div>																					<!-- The loading indicator is shown during file processing -->																					<div class="fileupload-loading"></div>														<br>														<!-- The table listing the files available for upload/download -->														<table role="presentation" class="table table-striped">															<tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody>														</table>													</form>																				<br>																				<div class="well">														<h3>提示</h3>														<ul>															<li>单个图片最大支持 <strong>5 MB</strong> </li>															<li>仅支持 <strong>JPG, GIF, PNG</strong>格式的图片 。</li>															<li>支持拖拽图片，仅限Google Chrome, Mozilla Firefox 和 Apple Safari浏览器。</li>														</ul>													</div>												</div>												<div class="row-fluid">						<div class="span12">								<script id="template-upload" type="text/x-tmpl">							{% for (var i=0, file; file=o.files[i]; i++) { %}							    <tr class="template-upload fade">							        <td class="preview"><span class="fade"></span></td>							        <td class="name"><span>{%=file.name%}</span></td>							        <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>							        {% if (file.error) { %}							            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>							        {% } else if (o.files.valid && !i) { %}							            <td>							                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>							            </td>							            <td class="start">{% if (!o.options.autoUpload) { %}							                <button class="btn">							                    <i class="icon-upload icon-white"></i>							                    <span>上传</span>							                </button>							            {% } %}</td>							        {% } else { %}							            <td colspan="2"></td>							        {% } %}							        <td class="cancel">{% if (!i) { %}							            <button class="btn red">							                <i class="icon-ban-circle icon-white"></i>							                <span>取消</span>							            </button>							        {% } %}</td>							    </tr>							{% } %}						</script>							<!-- The template to display files available for download -->							<script id="template-download" type="text/x-tmpl">							{% for (var i=0, file; file=o.files[i]; i++) { %}							    <tr class="template-download fade">							        {% if (file.error) { %}							            <td></td>							            <td class="name"><span>{%=file.name%}</span></td>							            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>							            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>							        {% } else { %}							            <td class="preview">							            {% if (file.thumbnailUrl) { %}							                <a class="fancybox-button" data-rel="fancybox-button" href="${ctx}/images/{%=file.url%}" title="{%=file.name%}">							                <img src="${ctx}/images/{%=file.thumbnailUrl%}">							                </a>							            {% } %}</td>							            <td class="name">							                <a href="${ctx}/images/{%=file.url%}" title="{%=file.name%}" data-gallery="${ctx}/images/{%=file.thumbnailUrl&&'gallery'%}" download="${ctx}/images/{%=file.name%}">{%=file.name%}</a>							            </td>							            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>							            <td colspan="2"></td>							        {% } %}							        <td class="delete">							            <button class="btn red" data-type="{%=file.deleteType%}" data-url="${ctx}/{%=file.deleteUrl%}"{% if (file.delete_with_credentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>							                <i class="icon-trash icon-white"></i>							                <span>删除</span>							            </button>							            <input type="checkbox" class="fileupload-checkbox hide" name="delete" value="1">							        </td>							    </tr>							{% } %}						</script>							</div>						</div>											</div>																				</div>																				<div class="form-actions clearfix">											<a href="${ctx}/cert/personal/list" class="btn">											 完成											</a>											<c:if test="${action == 'update'}">												<a href="javascript:history.back();" class="btn">返回上一步</a>											</c:if>											<!-- 										</div>									</div>								<!-- END FORM-->							</div>						</div>						<!-- END VALIDATION STATES-->					</div>				</div>				<!-- END PAGE CONTENT-->			</div>			<!-- END PAGE CONTAINER-->		</div>		<!-- END PAGE -->	</div>		<script>		$(document).ready(function() {			//wizard settings			 if (!jQuery().bootstrapWizard) {                return;            }						// default form wizard            $('#form_wizard_1').bootstrapWizard({                onTabClick: function (tab, navigation, index) {                    alert('on tab click disabled');                    return false;                },                onTabShow: function (tab, navigation, index) {                    $('#form_wizard_1').find('.bar').css({                        width: 100 + '%'                    });                                        var li_list = navigation.find('li');                    jQuery(li_list[0]).addClass("done");                }            });		            $('#form_wizard_1').bootstrapWizard('show',1);            $('#a_submit').click(function () {            	$('#fileupload').submit();              });				         // Initialize the jQuery File Upload widget:            $('#fileupload').fileupload({                // Uncomment the following to send cross-domain cookies:                //xhrFields: {withCredentials: true},                url: '${ctx}/cert/personal/upload'            });            // Load existing files:            // Demo settings:            $.ajax({                // Uncomment the following to send cross-domain cookies:                //xhrFields: {withCredentials: true},                url: '${ctx}/cert/personal/images/${personal.id}',                dataType: 'json',                context: $('#fileupload')[0],                maxFileSize: 5000000,                acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,                process: [{                        action: 'load',                        fileTypes: /^image\/(gif|jpeg|png)$/,                        maxFileSize: 20000000 // 20MB                    }, {                        action: 'resize',                        maxWidth: 1440,                        maxHeight: 900                    }, {                        action: 'save'                    }                ]            }).done(function (result) {            	console.info(JSON.stringify(result));                $(this).fileupload('option', 'done')                    .call(this, null, {                    result: result                });            });            // Upload server status check for browsers with CORS support:            /**            if ($.support.cors) {                $.ajax({                    url: '${ctx}/cert/personal/upload',                    type: 'HEAD'                }).fail(function () {                    $('<span class="alert alert-error"/>')                        .text('Upload server currently unavailable - ' +                        new Date())                        .appendTo('#fileupload');                });            }            **/            // initialize uniform checkboxes              App.initUniform('.fileupload-toggle-checkbox');		});	</script></body>
	
</html>