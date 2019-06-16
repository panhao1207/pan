<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="entity.*" %>
<%@page import="util.MTimeUtil"%>
<% String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>医院就医管理系统  - 就诊列表</title>
	<meta name="keywords" content="">
	<meta name="description" content="">

	<script src="<%=path %>/js/jquery.min.js?v=2.1.4"></script>

	<link rel="shortcut icon" href="favicon.ico">
	<link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="<%=path %>/css/font-awesome.css?v=4.4.0" rel="stylesheet">

	<!-- Data Tables -->
	<link href="<%=path %>/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<link href="<%=path %>/css/animate.css" rel="stylesheet">
	<link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/dist/sweetalert.css">
	
	<!-- fileinput组件对应的依赖库 -->
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/fileinput.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/fileinput.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/poper.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/theme.css">		
	<script src="<%=path %>/js/fileinput.js" type="text/javascript"></script>
	<script src="<%=path %>/js/fileinput.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/plugins/sortable.js" type="text/javascript"></script>
	<script src="<%=path %>/js/fr.js" type="text/javascript"></script>
	<script src="<%=path %>/js/es.js" type="text/javascript"></script>
	<script src="<%=path %>/js/theme.js" type="text/javascript"></script>
	<script src="<%=path %>/js/plugins/theme.js" type="text/javascript"></script>
	<script src="<%=path %>/js/poper.js" type="text/javascript"></script>
	
	
	<script type="text/javascript" language="javascript">
	
		function goPage(page){
			location.href="TreatListManager.do?currentPage="+page;
		}
		
	</script>
	
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
  <input type="hidden" id="selectxialaKeshi"/>
  <input type="hidden" id="selectxialadock"/>
<div id="wrapper">
		<!-- 左侧导航开始 -->
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
							<li><a class="J_menuItem" href="<%=path %>/dockOneSelfData.do">修改个人信息</a>
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
		<!-- 左侧导航结束 -->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
               <div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>就诊列表</h5>
					</div>
					<div class="ibox-content">
					
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>就医编号</th>
									<th>患者身份证</th>
									<th>患者姓名</th>
									<th>疾病描述</th>
									<th>预约时间</th>
									<th>就诊科室</th>
									<th>预约排名</th>
									<th>预约总人数</th>
									<th>状态</th>
									<th>管理</th>
								</tr>
							</thead>
							<tbody>
								<% 
								
								List<Treat_wqBean> traBeans = (List<Treat_wqBean>)request.getAttribute("treats");
								SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");  
								for(int i = 0; i < traBeans.size(); i++){
									
								%>
								<tr class="gradeA">
									<td> <%=traBeans.get(i).getTbianhao_wq() %> </td>
									<td> <%=traBeans.get(i).getTshenfenzheng_wq() %> </td>
									<td> <%=traBeans.get(i).getTuanme() %> </td>
									<td> <%=traBeans.get(i).getTtitle_wq() %> </td>
									<td> <%=dateformat2.format(traBeans.get(i).getTpreTime_wq()) %> </td>
									<td> <%=traBeans.get(i).getTkname() %> </td>
									<td> <%=traBeans.get(i).getTpreIndex_wq() %> </td>
									<td> <%=traBeans.get(i).getTtotal_wq() %> </td>
									<td> <%=traBeans.get(i).getTstatusStr_wq() %> </td>
									<td>
										<%
											if(traBeans.get(i).getTstatus_wq() == 0){
												
										%>
										<a href="javascript:void(0)" onclick="wanchengJiuzhenById(<%= traBeans.get(i).getTid_wq() %> )">完成就诊</a>
										
										<%} %>
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

	
	<!-- 全局js -->
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
   
    function wanchengJiuzhenById(tId){
		parent.layer.confirm('该患者就诊确定已完成吗？', {
		    btn: ['确认','取消'], 
		    shade: false 
		}, function(){
		    parent.layer.msg('就诊成功！', {icon: 1});
		    window.location="UpWanchengJiuzhenTreatById?tId="+tId;
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
