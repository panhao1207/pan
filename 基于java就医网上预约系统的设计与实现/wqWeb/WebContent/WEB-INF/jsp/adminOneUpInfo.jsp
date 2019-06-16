<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="entity.*" %>
<% String path = request.getContextPath(); %>
<%@page import="util.MTimeUtil"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>医院就医平台管理系统  - 修改个人信息</title>
	<meta name="keywords" content="">
	<meta name="description" content="">

		<link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="<%=path %>/css/font-awesome.css?v=4.4.0" rel="stylesheet">

	<!-- Data Tables -->
	<link href="<%=path %>/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<link href="<%=path %>/css/animate.css" rel="stylesheet">
	<link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/dist/sweetalert.css">

</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">

<div id="wrapper">
		<!--左侧导航开始-->
	<nav class="navbar-default navbar-static-side" role="navigation" style="background-color:#CCE8CF;">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse" >
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
								<span class="clear"> 
									<span class="block m-t-xs" style="font-size: 16px;"> 
										<strong class="font-bold">&nbsp;医院就医平台管理系统 </strong>
									</span>
								</span>
							</a>
						</div>
						<div class="logo-element">管理员</div>
					</li>
				
				<% Admin_wqBean admin_wqBean = (Admin_wqBean)session.getAttribute("loged"); %>
				
					<li><a href="#"> 
							<i class="fa fa fa-newspaper-o"></i> 
							<span class="nav-label">个人信息</span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="<%=path%>/myAdminInfo.do">查看个人信息</a>
							</li>
						</ul>
					</li>
					
					<li><a href="#"> 
							<i class="fa fa fa-newspaper-o"></i> 
							<span class="nav-label">用户管理</span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="<%=path%>/AdminListManager.do">管理员管理</a>
							</li>
							<li><a class="J_menuItem" href="<%=path %>/DockListManager.do">医生管理</a>
							</li>
							<li><a class="J_menuItem" href="<%=path %>/UserListManager.do">用户管理</a>
							</li>
						</ul>
					</li>
					
					<li><a href="#"> 
							<i class="fa fa fa-newspaper-o"></i> 
							<span class="nav-label">业务管理</span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="<%=path%>/KeshiListManager.do">科室管理</a>
							</li>
							<li><a class="J_menuItem" href="<%=path%>/TreatListManager.do">
								<span class="nav-label">就诊管理 </span>
							</a>
								<ul class="nav nav-second-level">
									<li><a style="margin-left:20px;" class="J_menuItem" href="<%=path %>/getAllYijiuzhenListPage.do">已就诊</a>
									</li>
									<li><a style="margin-left:20px;" class="J_menuItem" href="<%=path %>/getAllWeijiuzhenListPage.do">未就诊</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					
					
					
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
               <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>修改个人信息</h5>
					</div>
						<div class="ibox-content">
						<% Admin_wqBean admin = (Admin_wqBean)session.getAttribute("loged"); %>
						<form method="post" class="form-horizontal" action="<%=path %>/<%=admin.getAid_wq() %>/update.do">
							<div class="form-group">
								<label class="col-sm-3 control-label">姓名</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="Aname_wq" value="<%=admin.getAname_wq() %>" minlength="2" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" >密码</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="Apwd_wq" value="<%=admin.getApwd_wq() %>">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-8">
									<button class="btn btn-primary" type="submit">修&nbsp;&nbsp;改</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-white" type="reset">取&nbsp;&nbsp;消</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
				</div>
			</div>
		</div>
	</div>
    </div>
        </div>
		<!--右侧部分结束-->
	</div>

	<!-- 全局js -->
	<script src="<%=path %>/js/jquery.min.js?v=2.1.4"></script>
	<script src="<%=path %>/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="<%=path %>/js/plugins/jeditable/jquery.jeditable.js"></script>

	<!-- Data Tables -->
	<script src="<%=path %>/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="<%=path %>/js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<!-- 自定义js -->
	<script src="<%=path %>/js/content.js?v=1.0.0"></script>

 	<!-- layer javascript -->
    <script src="js/plugins/layer/layer.min.js"></script>

</body>
</html>
