<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2018/9/19
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>微校奶爸后台登陆</title>
    <link rel="stylesheet" href="css/login.css" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/wxnb.js"></script>
</head>
<body>
<div class="login">
    <div class="login-form">
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
        <div class="login-inp"><label>用户</label><input id="user" type="text" value="${cookie.username.value}"/></div>
        <div class="login-inp" id="pwds"><label>密码</label><input id="pwd" type="password" value="${cookie.password.value}"/></div>
        <div class="login-inp" style="border: 0"><label>记住密码</label><input style="margin-left: 10px" id="remember" type="checkbox"/></div>
        <div class="login-inp"><a id="bt_login" href="javascript:void(0);" >立即登录</a></div>
    </div>
</div>
</body>
</html>
