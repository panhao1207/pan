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
	<title>医院就医管理系统  - 用户列表</title>
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
			location.href="UserListManager.do?currentPage="+page;
		}
		
		function updateInfo(id,name,pwd,tel,sex,attr,shenfenzheng,age,jianjie){
			
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
			$("#uUpDShenfenzheng").val(shenfenzheng);
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
			var shen = $("#uUpDShenfenzheng").val();
			var age = $("#uUpDage").val();
			var jianjie = encodeURI(encodeURI($("#uUpDjianjie").val()));
			
			if(isEmpty(name)){
				alert("请输入患者姓名");
				return;
			}
			
			if(isEmpty(pwd)){
				alert("请输入患者密码");
				return;
			}
			
			if(isEmpty(shen)){
				alert("请输入患者身份证");
				return;
			}
			
			window.location="upUserInfo?name=" + name + "&pwd="+pwd + "&tel="+tel + "&attr="+attr+ "&age="+age + "&sex="+sex + "&shen="+shen + "&jianjie="+jianjie +"&img="+img+"&id="+id ;
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
						<h5>用户列表</h5>
					</div>
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th>用户名</th>
									<th>密码</th>
									<th>电话</th>
									<th>性别</th>
									<th>家庭地址</th>
									<th>身份证号</th>
									<th>年龄</th>
									<th>简介</th>
									<th>操作时间</th>
									<th>管理</th>
								</tr>
								
							</thead>
							<tbody>
								<% 
								
								List<User_wqBean> user_wqBeans = (List<User_wqBean>)request.getAttribute("users");
								SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd");  
								for(int i = 0; i < user_wqBeans.size(); i++){
									
								%>
								<tr class="gradeA">
									<td> <%=user_wqBeans.get(i).getUbianhao_wq() %> </td>
									<td> <%=user_wqBeans.get(i).getUname_wq() %> </td>
									<td> <%=user_wqBeans.get(i).getUpwd_wq() %> </td>
									<td> <%=user_wqBeans.get(i).getUtel_wq()%> </td>
									<td> <%=user_wqBeans.get(i).getUsex_wq() %> </td>
									<td> <%=user_wqBeans.get(i).getUattr_wq() %> </td>
									<td> <%=user_wqBeans.get(i).getUshenfenzheng_wq() %> </td>
									<td> <%=user_wqBeans.get(i).getUage_wq() %> </td>
									<td> <%=user_wqBeans.get(i).getUjianjie_wq() %> </td>
									<td> <%= dateformat2.format(user_wqBeans.get(i).getUTime_wq()) %> </td>
									
									<td>
										<a  href="javascript:void(0)" data-toggle="modal" data-target=".upUserModal" 
											onclick="updateInfo(
											<%=user_wqBeans.get(i).getUid_wq() %> ,
											' <%=user_wqBeans.get(i).getUname_wq() %>',
											' <%=user_wqBeans.get(i).getUpwd_wq() %>',
											' <%=user_wqBeans.get(i).getUtel_wq() %>',
											' <%=user_wqBeans.get(i).getUsex_wq()  %>',
											' <%=user_wqBeans.get(i).getUattr_wq()   %>',
											' <%=user_wqBeans.get(i).getUshenfenzheng_wq()  %>',
											' <%=user_wqBeans.get(i).getUage_wq() %>',
											' <%=user_wqBeans.get(i).getUjianjie_wq() %>'
										
											)">编辑</a>
										<a href="javascript:void(0)" onclick="deleteById(<%=user_wqBeans.get(i).getUid_wq() %> )">删除</a>
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

	
	<!-- 修改用户信息开始 -->
	<div class="modal fade upUserModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>修改用户信息信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
						<input type="hidden" id="uId">
					<form class="form-horizontal" role="form">
						<div class="form-group">
						    <label class="col-sm-2 control-label">用户姓名:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uUpDName" placeholder="请输入用户姓名">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">密码:</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control"  id="uUpDpwd" maxlength="10" placeholder="6-10位数字&字母组合登录密码" placeholder="请输入用户密码">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">电话:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uUpDtel" placeholder="请输入用户电话">
						    </div>
						</div>
						<div class="form-group" style="margin-top: 5px;">
						    <label class="col-sm-2 control-label">性别:</label>
						    <div class="col-sm-10">
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
						    <label class="col-sm-2 control-label">身份证号:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uUpDShenfenzheng" placeholder="请输入身份证号">
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
	<!-- 修改用户信息结束 -->
	
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
		    btn: ['确认','取消'], //按钮
		    shade: false //不显示遮罩
		}, function(){
		    parent.layer.msg('删除成功！', {icon: 1});
		    window.location="deleteUserById?uId="+uId;
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
