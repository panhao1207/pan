<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="entity.*" %>
<%@page import="util.MTimeUtil"%>
<% String path = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>医院就医管理系统  - 管理员列表</title>
	<meta name="keywords" content="">
	<meta name="description" content="">

	<link rel="shortcut icon" href="favicon.ico">
	<link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="<%=path %>/css/font-awesome.css?v=4.4.0" rel="stylesheet">

	<!-- Data Tables -->
	<link href="<%=path %>/css/plugins/dataTables/dataTables.bootstrap.css"
		rel="stylesheet">
	<link href="<%=path %>/css/animate.css" rel="stylesheet">
	<link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/dist/sweetalert.css">

	<script type="text/javascript" language="javascript">
		function goPage(page){
			location.href="AdminListManager.do?currentPage="+page;
		}
		
		function save(){
			var addKName = $("#addKName").val();
	
			if(isEmpty(addKName)){
				alert("请输入姓名");
				return;
			}
			
			window.location="addAdminInfo?addKName=" + addKName  ;
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
					<div class="ibox-title">
						<h5>管理员列表</h5>
					</div>
					<div class="ibox-content">
					
						<div style="margin-bottom: 8px">
							<a  class="btn btn-success" href="javascript:void(0)" data-toggle="modal" data-target=".addAdminModal">添加</a>
						 </div>
					
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>工号</th>
									<th>用户名</th>
									<th>最近操作时间</th>
								</tr>
							</thead>
							<tbody>
								<% 
								List<Admin_wqBean> admin_wqBeans = (List<Admin_wqBean>)request.getAttribute("admins");
								SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");  
								for(int i = 0; i < admin_wqBeans.size(); i++){
								%>
								<tr class="gradeA">
									<td> <%=admin_wqBeans.get(i).getAbianhao_wq() %> </td>
									<td> <%=admin_wqBeans.get(i).getAname_wq() %> </td>
									<td> <%=dateformat2.format( admin_wqBeans.get(i).getAloginTime_wq()) %> </td>
								</tr>
								
								<%} %>
							</tbody>
						</table>

	<div style="text-align:center; margin-top:40px" id="venderfen">
      		  当前第${paging.currentPage }页/共${paging.totalPage }页
        <c:choose>
            <c:when test="${paging.currentPage==1&&paging.totalPage==0}"></c:when>
            <c:when test="${paging.currentPage==1&&paging.totalPage==1}"></c:when>
            <c:when test="${paging.currentPage==2&&paging.totalPage==2}">
                <input type="button" value="首页" onclick="goPage(1)" />
                <input type="button" value="上一页"
                    onclick="goPage(${paging.currentPage-1})" />
            </c:when>
            <c:when test="${paging.currentPage==1 }">
          	    <input type="button" value="上一页"/>
                <input type="button" value="下一页" onclick="goPage(${paging.currentPage+1})" />
                <input type="button" value="末页" onclick="goPage(${paging.totalPage})" />
            </c:when>
            <c:when test="${paging.currentPage==paging.totalPage }">
                <input type="button" value="首页" onclick="goPage(1)" />
                <input type="button" value="上一页" onclick="goPage(${paging.currentPage-1})" />
            </c:when>
            <c:otherwise>
                <input type="button" value="首页" onclick="goPage(1)" />
                <input type="button" value="上一页" onclick="goPage(${paging.currentPage-1})" />
                <input type="button" value="下一页" onclick="goPage(${paging.currentPage+1})" />
                <input type="button" value="末页" onclick="goPage(${paging.totalPage})" />
            </c:otherwise>
        </c:choose>
       </div> 
	  </div>
	</div>
   </div>
   </div>
	</div>
			</div>
	</div>
	<!-- 主页显示结束 -->

	<!--增加管理员开始 -->
	<div class="modal fade addAdminModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>增加管理员信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
						    <label class="col-sm-2 control-label">用户名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="addKName" placeholder="请输入用户名">
						    </div>
						</div>
					
					</form>	
						</div>
					</div>
					<div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" class="btn btn-primary" onclick="save()">保存</button>
			      	</div>
				</div>
		    </div>
		</div>
	</div>
	<!-- 增加管理员结束 -->

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
    <script type="text/javascript">
    function deleteById(uId){
		parent.layer.confirm('确认删除？', {
		    btn: ['确认','取消'], //按钮
		    shade: false //不显示遮罩
		}, function(){
		    parent.layer.msg('删除成功！', {icon: 1});
		    window.location="deleteKuajianById?uId="+uId;
		});
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
</body>
</html>
