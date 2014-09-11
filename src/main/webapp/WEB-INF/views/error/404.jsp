<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%response.setStatus(200);%>


<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>Metronic | Extra - 404 Page Option 1</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="${ctx}/static/metronic/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="${ctx}/static/metronic/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="${ctx}/static/metronic/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="${ctx}/static/metronic/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="${ctx}/static/metronic/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="${ctx}/static/metronic/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="${ctx}/static/metronic/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="${ctx}/static/metronic/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="${ctx}/static/metronic/css/error.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="${ctx}/static/metronic/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

	<!-- BEGIN HEADER -->

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->

	<div class="page-container row-fluid">

		<div class="span12 page-content">

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->          

				<div class="row-fluid">

					<div class="span12 page-404">

						<div class="number">

							404

						</div>

						<div class="details">
							
							<br/><br/><br/><br/><br>
							<h3>(⊙o⊙)哦，迷路了</h3>


								Sorry!  您请求的资源没有找到.<br />
								<br />

								<h3><a href="${ctx}">返回首页</a></h3> 


			
						</div>
						<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/>

					</div>

				</div>

				<!-- END PAGE CONTENT-->

			</div>
			

			<!-- END PAGE CONTAINER-->       

		</div>

		<!-- BEGIN PAGE -->     

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">

			2013 &copy; Metronic by keenthemes.

		</div>

		<div class="footer-tools">

			<span class="go-top">

			<i class="icon-angle-up"></i>

			</span>

		</div>

	</div>

	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="${ctx}/static/metronic/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="${ctx}/static/metronic/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="${ctx}/static/metronic/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="${ctx}/static/metronic/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="${ctx}/static/metronic/js/excanvas.min.js"></script>

	<script src="${ctx}/static/metronic/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="${ctx}/static/metronic/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="${ctx}/static/metronic/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="${ctx}/static/metronic/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="${ctx}/static/metronic/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<!-- END CORE PLUGINS -->

	<script src="${ctx}/static/metronic/js/app.js"></script>      

	<script>

		jQuery(document).ready(function() {    

		   App.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();</script></body>

<!-- END BODY -->

</html>