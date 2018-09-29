<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2018/9/21
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="full-screen" content="yes">
    <meta name="browsermode" content="application">
    <meta name="x5-fullscreen" content="true">
    <meta name="x5-page-mode" content="app">
    <title>微校奶爸</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="css/orderQuery.css">
    <link rel="stylesheet" href="css/loading.css">

</head>
<body>

<div class="cell" id="cssload" style="display: none">
    <div id="loading">
        <div id="loading-center">
            <div id="loading-center-absolute">
                <div class="object" id="object_one">微</div>
                <div class="object" id="object_two">校</div>
                <div class="object" id="object_three">奶</div>
                <div class="object" id="object_four">爸</div>
            </div>
        </div>
    </div>
</div>

<div class="msg">
    <div id="top">
        <label for="oid">订单号：</label><input type="text" id="oid">
        <input id="query" type="button" value="查询">
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/>
    </div>
    <div id="content"></div>
</div>

<script src="js/orderQuery.js"></script>
</body>
</html>
