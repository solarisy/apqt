<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>代理审核</title>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
	<!-- BEGIN CONTAINER -->
	<div class=" row-fluid">		<!-- BEGIN PAGE -->			<!-- BEGIN PAGE CONTAINER-->        			<div class="container-fluid">				<!-- BEGIN PAGE HEADER-->				<!-- BEGIN PAGE CONTENT-->          				<div class="row-fluid">					<div class="span12">						<!-- BEGIN BORDERED TABLE PORTLET-->						<br/>						<div class="portlet box red">							<div class="portlet-title">								<div class="caption"><i class="icon-user"></i> 请选择代理</div>							</div>							<div class="portlet-body">								<table class="table table-striped table-bordered  table-hover">									<thead>										<tr>											<th>#</th>											<th>组织机构代码</th>											<th>中文名</th>											<th class="hidden-480">诚信码</th>										</tr>									</thead>
									<tbody>										<c:forEach items="${list}" var="obj" varStatus="status">										<tr>											<td><input name="proxyId" value="${obj.id}" type="radio" /></td>											<td>${obj.orgcode}</td>											<td><a href="${ctx}/proxy/detail/${obj.id}">${obj.nameCn}</a></td>											<td>${obj.certcode}</td>										</tr>										</c:forEach>									</tbody>
								</table>								<a class="btn btn-info" href="javascript:cleckAndClose();">确认选择<i class="icon-ok"></i></a>
							</div>
						</div>							<script>		function delConfirm(del_url){			bootbox.dialog({				  message: "删除后不可恢复，是否删除数据？",				  title: "删除确认",				  buttons: {				    success: {				      label: "取消",				      className: "btn"				    },				    danger: {				      label: "删除",				      className: "btn black",				      callback: function() {				    	  location.href = del_url;				      }				    }				  }			});		}			function cleckAndClose(){			//获取选中的checkbox元素$(":radio")			var selectedIds  =  $("radio:checked").val();			alert(selectedIds);			//var rowId = $("radio:checked").val();			//var rowName = $("#gridTable").getRowData(rowid); //根据行ID，获取选中行的数据(根据)			//alert(rowid+"==="+rowData.code);						//给父页面的元素赋值，取本页面中jqgride哪个属性的值，赋值给父页面的哪个元素的值，由父页面的control字符串决定			//control=[{pid:'customId',fieldName:'id'},{pid:'customName',fieldName:'name'}]			//pid:需要赋值的父页面元素的Id			//fieldName：取本页面jqgride哪个属性的值									//var control=${control};			//for(i=0;i<control.length;i++){			//	var peid=control[i].pid;			//	var fieldName=control[i].fieldName;			//	$("#"+peid+"" , parent.document).val(rowData[fieldName]);			//}						//关闭PickerBox			//parent.$.fancybox.close();		}		    </script>						<!-- END BORDERED TABLE PORTLET-->					</div>				</div>				<!-- END PAGE CONTENT-->			</div>			<!-- END PAGE CONTAINER-->		<!-- END PAGE -->	</div>	</body>
	
</html>