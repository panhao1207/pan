<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>医院就医平台后台管理登录</title>
<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/login.css" />
</head>
<body style="background:url('img/yiyuanlogin.jpg') no-repeat; background-size: 100%">
<div class="page">
	<div class="loginwarrp">
		<div class="logo">医院就医平台后台管理登陆</div>
        <div class="login_form">
			<form id="Login" name="Login" method="post" onsubmit="" action="adminLogin">
				<li class="login-item">
					<span>工号：</span>
					<input type="text" id="username" name="Abianhao_wq" class="login_input" >
                    <span id="count-msg" class="error"></span>
				</li>
				<li class="login-item">
					<span>密　码：</span>
					<input type="password" id="password" name="Apwd_wq" class="login_input" >
                    <span id="password-msg" class="error"></span>
				</li>
				
				<li>
					<div class="radio" style="margin-top: 15px;">
					<label>选择登录用户类型:</label>
						<input  type="radio" name="userType"  style="margin-left: 15px;"  checked="checked" value="1" />管理员
						<input  type="radio" name="userType"  value="2" />医生
					</div>
				</li>
				
				<li style="margin-top: 15px;">
					<span style="color:red">${message }</span>
					</li>
				<li class="login-sub">
					<input type="submit" name="Submit" value="登录" />
                                    
				</li> 
			</form>
				
</div>
</body>
</html>