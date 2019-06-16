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
	<title>医院就医平台管理系统  - 查看个人信息</title>
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
						<div class="logo-element">医生</div>
					</li>
				
				<%
				Dock_wqBean dock = (Dock_wqBean)session.getAttribute("docklogin");
				%>
				
					<li><a href="graph_metrics.html"> 
							<i class="fa fa fa-newspaper-o"></i> 
							<span class="nav-label">个人信息</span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="<%=path%>/getDockInfo/<%=dock.getYid_wq()%>/detial.do">查看个人信息</a>
							</li>
							<li><a class="J_menuItem" href="<%=path %>/upDockInfo/<%=dock.getYid_wq() %>/toUpdate.do">修改个人信息</a>
							</li>
						</ul>
					</li>
					<li><a href="#"> 
							<i class="fa fa fa-newspaper-o"></i> 
							<span class="nav-label">业务管理</span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="<%=path%>/dockTreatListManager.do">
								<span class="nav-label">就诊管理 </span>
							</a>
								<ul class="nav nav-second-level">
									<li><a style="margin-left:20px;" class="J_menuItem" href="<%=path %>/getDockAllYijiuzhenListPage.do">已就诊</a>
									</li>
									<li><a style="margin-left:20px;" class="J_menuItem" href="<%=path %>/getDockAllWeijiuzhenListPage.do">未就诊</a>
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
						<h5>个人信息详情</h5>
					</div>
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>头像</th>
									<th>工号</th>
									<th>姓名</th>
									<th>密码</th>
									<th>电话</th>
									<th>性别</th>
									<th>年龄</th>
									<th>地址</th>
									<th>简介</th>
								</tr>
							</thead>
							<tbody>
							<%
							Dock_wqBean dock2 = (Dock_wqBean)request.getAttribute("dockOne");
							%>
								<tr class="gradeA">
									<td>
										<img src="/upload<%= dock2.getYimg_wq()  %>" width="50px" height="30px;" >
									</td>
									<td><%=dock2.getYbianhao_wq() %></td>
									<td><%=dock2.getYname_wq() %></td>
									<td><%=dock2.getYpwd_wq() %></td>
									<td><%=dock2.getYtel_wq() %></td>
									<td><%=dock2.getYsex_wq() %></td>
									<td><%=dock2.getYage_wq() %></td>
									<td><%=dock2.getYattr_wq() %></td>
									<td><%=dock2.getYjianjie_wq() %></td>
								</tr>
							</tbody>
						</table>
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
