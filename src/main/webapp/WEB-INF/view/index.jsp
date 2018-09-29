<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2018/9/18
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>微笑奶爸</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<div id="index">
    <div class="slider"></div>

    <div class="content">
        <div class="left center">
            <a href="${pageContext.request.contextPath}/order" class="center">
                <img class="index_img" src="img/buy.png" alt="">
                <span>帮我买</span>
            </a>
        </div>
        <div class="right">
            <div class="r_top center">
                <a href="${pageContext.request.contextPath}/order" class="center">
                    <img class="index_img" src="img/present.png" alt="">
                    <span>帮我送</span>
                </a>
            </div>
            <div class="r_bottom center">
                <a href="${pageContext.request.contextPath}/orderQuery" class="center">
                    <img class="index_img" src="img/oderquery.png" alt="">
                    <span>订单查询</span>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
