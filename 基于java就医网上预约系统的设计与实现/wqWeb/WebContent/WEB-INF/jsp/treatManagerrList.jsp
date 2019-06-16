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
	
	<script type="text/javascript">
	$(function(){
		initAddKeshiDock();
	});
		
	</script>
	
	<script type="text/javascript" language="javascript">
	
		function goPage(page){
			location.href="TreatListManager.do?currentPage="+page;
		}
		
		function save(){
			
			var title = encodeURI(encodeURI($("#addDtitle").val())); 
			var keshiid= $("#selectxialaKeshi").val();
			var dockid=	$("#selectxialadock").val();
			var shen = $("#addDShen").val();
			var uname = encodeURI(encodeURI($("#addDUName").val()));  
			
		 	if(isEmpty(uname)){
				alert("请输入患者姓名");
				return;
			}
			
			if(isEmpty(shen)){
				alert("请输入患者身份证");
				return;
			}
			
			if(isEmpty(title)){
				alert("请输入患者病情");
				return;
			} 
			
			
			window.location="AddTreatInfo?title=" + title + "&keshiid="+keshiid + "&dockid="+dockid + "&shen="+shen + "&uname=" + uname;
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
					
					<div style="margin-bottom: 8px">
							<a  class="btn btn-success" href="javascript:void(0)" data-toggle="modal" data-target=".addTreatModal">添加</a>
					</div>
					
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>就医编号</th>
									<th>患者身份证</th>
									<th>患者姓名</th>
									<th>疾病描述</th>
									<th>预约医生</th>
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
									<td> <%=traBeans.get(i).getTdanme() %> </td>
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
										<a href="javascript:void(0)" onclick="deleteById(<%= traBeans.get(i).getTid_wq() %> )">删除</a>
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

	<!-- 添加就诊信息开始 -->
	<div class="modal fade addTreatModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>添加就诊信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
					<form class="form-horizontal" role="form">
						
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">请输入用户姓名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="addDUName" placeholder="请输入用户姓名">
						    </div>
						</div>
						
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">请输入身份证:</label>
						    <div class="col-sm-10">
						      <input type="number" class="form-control" id="addDShen" placeholder="请输入身份证">
						    </div>
						</div>
						
						
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">就诊内容:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="addDtitle" placeholder="请输入就诊内容">
						    </div>
						</div>
						
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">选择科室:</label>
						    <div class="col-sm-10">
						        <select class="form-control selectpicker" id="addkeshiSelector" title="请选择科室">
								</select>
						    </div>
						</div>
						
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">选择医生:</label>
						    <div class="col-sm-10">
						        <select class="form-control selectpicker" id="addDockSelector" title="请选择医生">
								</select>
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
	<!-- 修改就诊信息结束 -->
	
	
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
    function deleteById(uId){
		parent.layer.confirm('确认删除？', {
		    btn: ['确认','取消'], 
		    shade: false 
		}, function(){
		    parent.layer.msg('删除成功！', {icon: 1});
		    window.location="deleteUpTreatById?uId="+uId;
		});
	}
    
    function wanchengJiuzhenById(tId){
		parent.layer.confirm('该患者就诊确定已完成吗？', {
		    btn: ['确认','取消'], 
		    shade: false 
		}, function(){
		    parent.layer.msg('就诊成功！', {icon: 1});
		    window.location="UpWanchengJiuzhenTreatById?tId="+tId;
		});
	}
    
    function initAddKeshiDock(){
    	$.ajax({
			url:"getAllKeshiDataInfo",
			type:"get",
			data:{},
			dataType:"json",
			success:function(data){
				var srtEleadd  =  document.getElementById("addkeshiSelector"); 
				if(data.obj.length > 0){
					
			    	for(var i = 0 ;i < data.obj.length;i++ ) {   
						var option  =  document.createElement("option");   
						var text  =  document.createTextNode(data.obj[i]["kname_wq"]);   
						option.appendChild(text);   
						//option.value = data.obj[i]["kname_wq"];   
						option.value = data.obj[i]["kid_wq"];
						srtEleadd.appendChild(option); 
			    	}
			    	
			    	$("#selectxialaKeshi").val(data.obj[0]["kid_wq"]);
			    	initAddDockData(data.obj[0]["kid_wq"]);
			    	
			    	srtEleadd.onchange = function(){
			    		var index = srtEleadd.options.selectedIndex;//获取select选中option的index
			    		var value = srtEleadd.options[index].value;//根据选中的index,取出对应的值
			    		$("#selectxialaKeshi").val(value);
			    		initAddDockData(value);
			    	}
				}
			},
			eror:function(dtta){
				alert(data);
			}
		});
    }
    
    function initAddDockData(value){
    	$.ajax({
			 url:"getAllDockDataInfo",
				type:"get",
				data:{'keshiId': value},
				dataType:"json",
				success:function(data1){
					$("#addDockSelector").html("");
					var strDockadd = document.getElementById("addDockSelector");
					for(var j = 0 ;j < data1.obj.length;j++ ) {   
						var option  =  document.createElement("option");   
						var text  =  document.createTextNode(data1.obj[j]["yname_wq"]);   
						option.appendChild(text);   
						option.value = data1.obj[j]["yid_wq"];   
						strDockadd.appendChild(option); 
			    	}
			    	
			    	$("#selectxialadock").val(data1.obj[0]["yid_wq"]);
			    	
			    	strDockadd.onchange = function(){
			    		var index = strDockadd.options.selectedIndex;
			    		var value = strDockadd.options[index].value;
			    		$("#selectxialadock").val(value);
			    	}
				}
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
