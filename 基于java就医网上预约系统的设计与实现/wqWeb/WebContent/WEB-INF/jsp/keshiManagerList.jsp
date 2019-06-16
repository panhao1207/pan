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
	<title>医院就医管理系统  - 科室列表</title>
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
			location.href="KeshiListManager.do?currentPage="+page;
		}
		
		function save(){
			var kname = encodeURI(encodeURI($("#addKName").val()));  
			var kuname = encodeURI(encodeURI($("#addKUName").val())); 
			var ktel = $("#addKtel").val();
			var kjianjie = encodeURI(encodeURI($("#addKJianjie").val()));
			
			if(isEmpty(kname)){
				alert("请输入科室名称");
				return;
			}
			
			if(isEmpty(kuname)){
				alert("请输入科室负责人");
				return;
			}
			
			if(isEmpty(ktel)){
				alert("请输入科室联系电话");
				return;
			}
	
			window.location="addKeshiInfo?kname=" + kname + "&kuname="+kuname+"&ktel="+ktel+"&kjianjie="+kjianjie  ;
		}
		
	  function updateInfo(id,name,fuzeren,tel,jianjie){
			$("#uId").val(id);
			$("#upKName").val(name);
			$("#upKUName").val(fuzeren);
			$("#upKtel").val(tel);
			$("#upKJianjie").val(jianjie);
		}
		
		function update(){
			var id = $("#uId").val(); 
			var tel = $("#upKtel").val();
			var name = encodeURI(encodeURI($("#upKName").val()));
			var uname = encodeURI(encodeURI($("#upKUName").val()));
			var jianjie = encodeURI(encodeURI($("#upKJianjie").val()));
			
			if(isEmpty(name)){
				alert("请输入科室名称");
				return;
			}
			
			if(isEmpty(uname)){
				alert("请输入科室负责人");
				return;
			}
			
			if(isEmpty(tel)){
				alert("请输入科室联系电话");
				return;
			}

			window.location="upKeshiInfo?name=" + name + "&tel="+tel + "&uname="+uname+ "&jianjie="+jianjie + "&id="+id ;
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
						<h5>科室列表</h5>
					</div>
					<div class="ibox-content">
					
						<div style="margin-bottom: 8px">
							<a  class="btn btn-success" href="javascript:void(0)" data-toggle="modal" data-target=".addKeshiModal">添加</a>
						 </div>
					
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>科室名称</th>
									<th>负责人</th>
									<th>联系电话</th>
									<th>操作时间</th>
									<th>简介</th>
									<th>管理</th>
								</tr>
							</thead>
							<tbody>
								<% 
								List<Keshi_wqBean> keshi_wqBeans = (List<Keshi_wqBean>)request.getAttribute("keshis");
								SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");  
								for(int i = 0; i < keshi_wqBeans.size(); i++){
								%>
								<tr class="gradeA">
									<td> <%=keshi_wqBeans.get(i).getKname_wq() %> </td>
									<td> <%=keshi_wqBeans.get(i).getKfuzeren_wq() %> </td>
									<td> <%=keshi_wqBeans.get(i).getKtel_wq() %> </td>
									<td> <%=dateformat2.format( keshi_wqBeans.get(i).getKtime_wq()) %> </td>
									<td> <%=keshi_wqBeans.get(i).getKjianjie_wq()%> </td>
									
									
									<td>
										<a  href="javascript:void(0)" data-toggle="modal" data-target=".upKeshiModal" 
											onclick="updateInfo(
											 <%=keshi_wqBeans.get(i).getKid_wq()  %> ,
											 ' <%=keshi_wqBeans.get(i).getKname_wq() %>',
											' <%=keshi_wqBeans.get(i).getKfuzeren_wq() %>',
											' <%=keshi_wqBeans.get(i).getKtel_wq() %>',
											' <%=keshi_wqBeans.get(i).getKjianjie_wq() %>'
											)">编辑</a>
										<a href="javascript:void(0)" onclick="deleteById(<%=keshi_wqBeans.get(i).getKid_wq() %> )">删除</a>
									</td>
									
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

	<!--增加科室开始 -->
	<div class="modal fade addKeshiModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>增加科室信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
						    <label class="col-sm-2 control-label">科室名称:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="addKName" placeholder="请输入科室名称">
						    </div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-2 control-label">负责人:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="addKUName" placeholder="请输入负责人">
						    </div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="addKtel" placeholder="请输入电话">
						    </div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-2 control-label">简介:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="addKJianjie" placeholder="请输入简介">
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
	<!-- 增加科室结束 -->
	
	<!--修改科室开始 -->
	<div class="modal fade upKeshiModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>修改科室信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
						<input type="hidden" id="uId">
					<form class="form-horizontal" role="form">
						<div class="form-group">
						    <label class="col-sm-2 control-label">科室名称:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="upKName" placeholder="请输入科室名称">
						    </div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-2 control-label">负责人:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="upKUName" placeholder="请输入负责人">
						    </div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="upKtel" placeholder="请输入电话">
						    </div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-2 control-label">简介:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="upKJianjie" placeholder="请输入简介">
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
	<!-- 修改科室结束 -->

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
		    window.location="deleteKeshiById?uId="+uId;
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
