<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>学生信息</title>
<link rel='stylesheet' href='/stylesheets/style.css' /> 
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<style type="text/css">
a{text-decoration: none;outline: none;border: none;}
.wrap{margin: 20px;}
.lookup label{margin-right: 10px;}
.lookup input{padding-left:10px;width: 210px;height: 26px;border: 1px solid #ccc;border-radius: 3px;}
.lookup button{width: 80px;height: 28px;line-height: 28px;background: #6f5499;border-radius: 3px;border:none;color: #fff;}
.wrap table{margin-top:40px;width:100%;border-collapse: collapse;border: 1px solid #ccc;}
.wrap table th,.wrap table td{border: 1px solid #ccc;text-align: center;}
</style>
<script type="text/javascript">
	function select(){
		var stuId = $("#stuId").val();
		window.location="findByName?stuId="+stuId;
	}
	function save(){
		var name = $("#stName").val();
		var sex = $("#stSex").val();
		var phone = $("#stphone").val();
		window.location="addStuInfo?stName="+name+"&stSex="+sex+"&stphone="+phone;
		
	}
	function deleteById(stuId){
		window.location="deleteById?stuId="+stuId;
	}
	
	function updateInfo(id,sex,name,phone){
		$("#stNo").val(id);
		$("#stName1").val(name);
		$("#stSex1").val(sex);
		$("#stphone1").val(phone);
	}
	function update(){
		var name = $("#stName1").val();
		var sex = $("#stSex1").val();
		var phone = $("#stphone1").val();
		var no = $("#stNo").val();
	
		window.location="addStuInfo?stName="+name+"&stSex="+sex+"&stphone="+phone+"&no="+no;
	}
	function twiceChoose(){
		$.ajax({
			url:"updateJob",
			dataType:"json",
			data:{'job':'2'},
			type:'get',
			success:function(data){
				if(data.result){
					confirm("触发二次选课成功");
				}
			}
		});
	}
	function getInfo(){
		$.ajax({
			url:"getInfoAdmin",
			dataType:"json",
			type:'get',
			data:{'job':'3'},
			success:function(data){
				if(data.result){
					confirm("公布结果成功");
				}else{
					if (confirm(data.message)==true){ 
						$.ajax({
							url:"updateJob",
							dataType:"json",
							data:{'job':'3'},
							type:'get',
							success:function(data){
								if(data.result){
									confirm("公布结果成功!");
								}
							}
						});
					}else{ 
						return false; 
					} 
				}
			}
		});
	}
</script>
</head>
<body>
<div class="wrap">
	<div class="lookup">
		<label>查询:</label><input id='stuId' type="text" placeholder="请输入学生学号" name=""> <button onclick="select()">查询</button>
		<a  href="javascript:void(0)" data-toggle="modal" data-target=".bs-example-modal-lg">添加</a>
		<a  href="javascript:void(0)" onclick="twiceChoose()">二次选课</a>
		<a  href="javascript:void(0)" onclick="getInfo()">公布结果</a>
	</div>
	<div class="contain">
		<table class="table table-striped ">
			<thead>
			<tr height="50">
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>电话</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="stu" items="${list}">
				<tr height="40">
				<td>${stu.stNo }</td>
				<td>${stu.stName }</td>
				<td>${stu.stSex }</td>
				<td>${stu.stPhone }</td>
				<td>
					<a  href="javascript:void(0)" data-toggle="modal" data-target=".bs-example-modal-lg1" onclick="updateInfo(${stu.stNo },'${stu.stSex }','${stu.stName }','${stu.stPhone }')">编辑</a>
					<a href="javascript:void(0)" onclick="deleteById(${stu.stNo })">删除</a>
				</td>
			</tr>
			</c:forEach>
			
			</tbody>
		</table>
	</div>
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		     	<div class="panel panel-default">
					<div class="panel-heading" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						<h4 class="panel-title">
							<span>添加信息
								<span style="color:red;">*</span>
							</span>
						</h4>
					</div>
					<div >
						<div class="panel-body">
							<table>
								<tr height="50">
									<td>姓名</td>
									<td><input type="text" id="stName" name="stName"></td>
								
									<td>性别</td>
									<td><input type="text" id="stSex" name="stSex"></td>
								</tr>
								<tr height="50">
									<td>电话</td>
									<td><input type="text" id="stphone" name="stphone"></td>
									<td></td>
									<td></td>
								</tr>
							</table>		
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
	
	<div class="modal fade bs-example-modal-lg1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
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
						<input type="hidden" id="stNo">
							<table>
								<tr height="50">
								
									<td>姓名</td>
									<td><input type="text" id="stName1" name="stName"></td>
								
									<td>性别</td>
									<td><input type="text" id="stSex1" name="stSex"></td>
								</tr>
								<tr height="50">
									<td>电话</td>
									<td><input type="text" id="stphone1" name="stphone"></td>
									<td></td>
									<td></td>
								</tr>
							</table>		
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
</div>
</body>
</html>