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
	<title>医院就医管理系统  - 修改个人信息</title>
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
		function updateInfo(id,name,pwd,tel,sex,attr,age,jianjie){
			
			//单选框radio设置默认选中
			$("input[name='gender']").each(function(){
				if( $.trim($(this).val()) == $.trim(sex) ){
					$(this).attr("checked",true);
				}
			});
			
			$("#uId").val(id);
			
			$("#uUpDName").val(name);
			$("#uUpDpwd").val(pwd);
			$("#uUpDtel").val(tel);
			$("#uUpDattr").val(attr);
			$("#uUpDage").val(parseInt(age));
			$("#uUpDjianjie").val(jianjie);
			
		}
		
		function update(){
			var img = $("#imgpahtUp").val();
			var id = $("#uId").val(); 
			var sex = encodeURI(encodeURI($("input[name='gender']:checked").val()));
			
			var name = encodeURI(encodeURI($("#uUpDName").val()));
			var pwd = $("#uUpDpwd").val();
			var tel = $("#uUpDtel").val();
			var attr = encodeURI(encodeURI($("#uUpDattr").val()));
			var age = $("#uUpDage").val();
			var jianjie = encodeURI(encodeURI($("#uUpDjianjie").val()));
			
			if(isEmpty(name)){
				alert("请输入姓名");
				return;
			}
			
			if(isEmpty(pwd)){
				alert("请输入密码");
				return;
			}
			
			window.location="upDockOneInfo.do?name=" + name + "&pwd="+pwd + "&tel="+tel + "&attr="+attr+ "&age="+age + "&sex="+sex + "&jianjie="+jianjie +"&img="+img+"&id="+id ;
		} 
		
	</script>
	
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
  <input type="hidden" id="selectxialaKeshi"/>
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
						<h5>医生列表</h5>
					</div>
					<div class="ibox-content">
					
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>图片</th>
									<th>工号</th>
									<th>用户名</th>
									<th>密码</th>
									<th>电话</th>
									<th>性别</th>
									<th>家庭地址</th>
									<th>年龄</th>
									<th>简介</th>
									<th>管理</th>
								</tr>
							</thead>
							<tbody>
							
							<%
							 List<Dock_wqBean> dock2 = ( List<Dock_wqBean>) request.getAttribute("dood");
							 for(int i=0; i< dock2.size(); i++){
							
							%>
							
								<tr class="gradeA">
									<td>
										<img src="/upload<%= dock2.get(i).getYimg_wq()  %>" width="50px" height="30px;" >
									</td>
									<td> <%=dock2.get(i).getYbianhao_wq()%> </td>
									<td> <%=dock2.get(i).getYname_wq() %> </td>
									<td> <%=dock2.get(i).getYpwd_wq() %> </td>
									<td> <%=dock2.get(i).getYtel_wq()%> </td>
									<td> <%=dock2.get(i).getYsex_wq() %> </td>
									<td> <%=dock2.get(i).getYattr_wq() %> </td>
									<td> <%=dock2.get(i).getYage_wq() %> </td>
									<td> <%=dock2.get(i).getYjianjie_wq() %> </td>
								
									<td>
										<a  href="javascript:void(0)" data-toggle="modal" data-target=".upDockModal" 
											onclick="updateInfo(
											<%=dock2.get(i).getYid_wq() %> ,
											' <%=dock2.get(i).getYname_wq() %>',
											' <%=dock2.get(i).getYpwd_wq() %>',
											' <%=dock2.get(i).getYtel_wq() %>',
											' <%=dock2.get(i).getYsex_wq()  %>',
											' <%=dock2.get(i).getYattr_wq()  %>',
											' <%=dock2.get(i).getYage_wq() %>',
											' <%=dock2.get(i).getYjianjie_wq() %>'
										
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
	<!-- 主页显示结束 -->



	<!-- 修改医生信息开始 -->
	<div class="modal fade upDockModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>修改个人信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
						<input type="hidden" id="uId">
					<form class="form-horizontal" role="form">
						<div class="form-group">
						    <label class="col-sm-2 control-label">医生姓名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uUpDName" placeholder="请输入医生姓名">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">密码:</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control"  id="uUpDpwd" maxlength="10" placeholder="6-10位数字&字母组合登录密码" placeholder="请输入医生密码">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uUpDtel" placeholder="请输入医生电话">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">性别:</label>
						    <div class="col-sm-10">
						      <label>选择你的性别</label>
							    <label class="radio" style="margin-left: 15px;">
							    <input type="radio" name="gender" value="男">男</label>
							     <label class="radio" style="margin-left: 15px;">
							    <input type="radio" name="gender" value="女">女</label>
						    </div>
						</div>
						
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">家庭地址:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uUpDattr" placeholder="请输入家庭地址">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">年龄:</label>
						    <div class="col-sm-10">
						      <input type="number" class="form-control" id="uUpDage" placeholder="请输入年龄">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">简介:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uUpDjianjie" placeholder="请输入简介">
						    </div>
						</div>
						
						<div class="form-group" style="margin-top: 5px;">
						     <label class="col-sm-2 control-label">头像图片:</label>
						    <div class="col-sm-10" id="previewp">
						   	   <input id="myUpFile" type="file" name="myFile" class="fileloading">
						   	     <input type="hidden" id="imgpahtUp">
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
	<!-- 修改医生信息结束 -->
	
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
    
    <!-- 修改套餐对应的图片 -->
     <script type="text/javascript">
	    $("#myUpFile").fileinput({
	    	language : 'zh',
	        uploadUrl : "admin/uplode/photo2",
	        maxFileCount : 1,
	        autoReplace : true,
	        allowedFileExtensions : [ "jpg", "png", "gif" ],
	        browseClass : "btn btn-primary", //按钮样式 
            previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
	    }).on("fileuploaded", function(e, data) {
	        var res = data.response;
	        var imgpath = res.success;
	        document.querySelector('#imgpahtUp').value  = imgpath;
	    })
    </script>
    
    <script type="text/javascript">
 
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
