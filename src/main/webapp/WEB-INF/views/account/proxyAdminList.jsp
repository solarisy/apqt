<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>代理管理员</title>

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
			<!-- BEGIN PAGE CONTAINER-->        
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->				<c:if test="${not empty message}">					<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close"></button>${message}</div>				</c:if>
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->						<!-- Import Style Setting Button -->        						<jsp:include page="../../layouts/style-setting.jsp"></jsp:include>
						<!-- END BEGIN STYLE CUSTOMIZER -->  
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->						<h3 class="page-title">代理管理员</h3>						<ul class="breadcrumb">							<li>								<i class="icon-home"></i>								<a href="${ctx}">首页</a> 								<i class="icon-angle-right"></i>							</li>							<li>人员管理<i class="icon-angle-right"></i></li>							<li>代理管理员</li>						</ul>						<!-- END PAGE TITLE & BREADCRUMB-->					</div>				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">					<div class="">						<!-- BEGIN BORDERED TABLE PORTLET-->						<div class="portlet box red">							<div class="portlet-title">								<div class="caption"><i class="icon-user"></i> 代理管理员</div>								<div class="tools">									<a href="${ctx}/admin/proxy-admin/create" class="btn">新增</a>									<a href="javascript:;" class="collapse"></a>								</div>							</div>
							<div class="portlet-body">								<table class="table table-striped table-bordered  table-hover">									<thead>										<tr>											<th>#</th>											<th>账号</th>											<th>真实姓名</th>											<th>邮箱</th>											<th>手机</th>											<th>所属代理公司</th>											<th class="hidden-480">注册日期</th>											<th>操作</th>										</tr>									</thead>									<tbody>										<c:forEach items="${list}" var="obj" varStatus="status">										<tr>											<td>${status.count}</td>											<td>${obj.loginName}</td>											<td>${obj.name}</td>											<td>${obj.email}</td>											<td>${obj.mobilephone}</td>											<td>${obj.proxyName}</td>											<td class="hidden-480"><fmt:formatDate value="${obj.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>											<td>												<a href="${ctx}/admin/proxy-admin/update/${obj.id}" class="btn mini purple"><i class="icon-edit"></i> 编辑</a>												<a href="javascript:delConfirm('${ctx}/admin/proxy-admin/delete/${obj.id}');" class="btn mini black"><i class="icon-trash"></i> 删除</a>													<a href="${ctx}/admin/proxy-admin/pwd/${obj.id}" class="btn mini blue"><i class="icon-share"></i> 修改密码</a>											</td>										</tr>										</c:forEach>										
									</tbody>
								</table>
							</div>
						</div>	<script>		function delConfirm(del_url){			bootbox.dialog({				  message: "删除后不可恢复，是否删除数据？",				  title: "删除确认",				  buttons: {				    success: {				      label: "取消",				      className: "btn"				    },				    danger: {				      label: "删除",				      className: "btn black",				      callback: function() {				    	  location.href = del_url;				      }				    }				  }			});		}	    </script>		<br/><br/><br/><br/><br/><br/><br/><br/><br/>		<br/><br/><br/><br/><br/><br/><br/><br/><br/>		
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