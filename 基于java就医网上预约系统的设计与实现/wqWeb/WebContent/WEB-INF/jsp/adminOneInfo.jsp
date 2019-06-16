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
	<title>医院就医平台管理系统  - 查看管理员信息</title>
	<meta name="keywords" content="">
	<meta name="description" content="">

		<link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="<%=path %>/css/font-awesome.css?v=4.4.0" rel="stylesheet">

	<!-- Data Tables -->
	<link href="<%=path %>/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<link href="<%=path %>/css/animate.css" rel="stylesheet">
	<link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/dist/sweetalert.css">

	<script type="text/javascript">
	function updateInfo( id,name,pwd){
		 $("#uId").val(id);
		 $("#upName").val(name);
			$("#upPwd").val(pwd);
		
	
	}
	
	function update(){
		var name = encodeURI(encodeURI($("#upName").val())); 
		var pwd = $("#upPwd").val();
		if(isEmpty(name)){
			alert("请输入姓名");
			return;
		}
		
		if(isEmpty(pwd)){
			alert("请输入密码");
			return;
		}
		
		var id = $("#uId").val();
		
		
		window.location="updateAdminInfo.do?name=" + name +"&pwd="+pwd+"&id="+id ;
		
	}

	//判断字符是否为空的方法
   function isEmpty(obj){
       if(typeof obj == "undefined" || obj == null || obj == ""){
           return true;
       }else{
           return false;
       }
   }
	</script>

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
						<h5>个人信息详情</h5>
					</div>
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>工号</th>
									<th>姓名</th>
									<th>密码</th>
									<th>管理</th>
								</tr>
							</thead>
							<tbody>
							<%
							 List<Admin_wqBean> admin = ( List<Admin_wqBean>) request.getAttribute("adminsss");
							 for(int i=0; i< admin.size(); i++){
							
							%>
								<tr class="gradeA">
									<td><%=admin.get(i).getAbianhao_wq() %></td>
									<td><%=admin.get(i).getAname_wq() %></td>
									<td><%=admin.get(i).getApwd_wq() %></td>
									<td>
										<a  href="javascript:void(0)" data-toggle="modal" data-target=".upModal" onclick="updateInfo(
											<%=admin.get(i).getAid_wq()  %>,
											'<%=admin.get(i).getAname_wq() %>',
											'<%=admin.get(i).getApwd_wq() %>'
											)">编辑</a>
									</td>
								</tr>
								 <% } %>
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
	
	<!-- 修改用户开始 -->
	<div class="modal fade upModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>修改信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
						<input type="hidden" id="uId">
					<form class="form-horizontal" role="form">
						<div class="form-group">
						    <label class="col-sm-2 control-label">姓名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="upName" placeholder="请输入名字">
						    </div>
						</div>
						
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">密码:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control"  id="upPwd"  placeholder="请输入密码">
						    </div>
						</div>
						
						
						
					</form>
						</div>
					</div>
					<div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" class="btn btn-primary" onclick="update()">保存</button>
			      	</div>
				</div>
		    </div>
		</div>
	</div>
	<!-- 修改用户结束 -->

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
