<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2018/9/19
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>后台订单</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/alert.css"/>
    <style>
        * {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #nav {
            width: 300px;
            height: 40px;
            border: 1px solid white;
            border-radius: 10px;
            margin: 18px auto;
            display: flex;
            flex-direction: row;
            overflow: hidden;
        }

        .navbar {
            width: 33.333333%;
            height: 100%;
            text-align: center;
            line-height: 40px;
            border-right: 1px solid white;
            color: white;
        }

        .navbar:nth-child(3) {
            border-right: 0;
        }

        .navbar-focus {
            background: #4A9AC3;
        }

        .order-list {
            width: 90%;
            height: 100%;
            margin: 0 auto;
            border: 1px solid white;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            overflow: scroll;
        }

        .order-list .list-item {
            width: 90%;
            height: 70px;
            display: flex;
            flex-wrap: wrap;
            flex-shrink: 0;
            margin: 10px 15px;
            border-bottom: 1px solid white;
            position: relative;

        }

        .order-list .list-item:active {
            background: #4A9AC3;
        }

        .order-list .list-item .item-left {
            width: 60%;
            height: 33.333333%;
            font-size: 14px;
        }

        .order-list .list-item .item-name {

        }

        .order-list .list-item .item-address {

        }

        .order-list .list-item .item-phone {

        }

        .order-list .list-item .item-btn {
            position: absolute;
            right: 0;
            top: 35px;
            width: 30%;
            height: 0;
        }

        .order-list .list-item .item-btn .enter {
            background-color: #06c1ae;
            border: 1px solid white;
            border-radius: 6px;
            padding: 6px;
            font-size: 16px;
        }
    </style>
</head>
<body background="img/login-bg.png">
<div id="nav">
    <div class="navbar nav1" tabindex="1">未完成</div>
    <div class="navbar nav2" tabindex="2">待完成</div>
    <div class="navbar nav3" tabindex="3">已完成</div>
</div>
<div id="order-list1" class="order-list">
    <c:forEach items="${UnOrderList}" var="order">
        <ul id="${order.oid}" class="list-item"
            ondblclick="oderDesc(this,'${order.oName}','${order.oTime}','${order.oDesc}','${order.oDownorderTime}')">
            <li class="item-left item-name">姓名：${order.oUser}</li>
            <li class="item-left item-phone">电话：${order.oPhone}</li>
            <li class="item-left item-address">派送地址：${order.oAddress}</li>
            <li class="item-btn" onclick="getOrder(this,'${order.oid}')"><span class="enter">接单</span></li>
        </ul>
    </c:forEach>
</div>

<div id='order-list2' class='order-list'>
</div>

<div id="order-list3" class="order-list">
</div>

<script src="js/alert.js"></script>

<script>

    //查看详情
    function oderDesc(obj, name, time, desc,downTime) {
        obj.dialog2 = jqueryAlert({
            'width':"70%",
            'content': "商品名称：" + name + "<br/>派送时间：" + time + "<br/>附加信息：" + desc+"<br/>下单时间：" +downTime,
            'modal': true,
            'buttons': {
                '确定': function () {
                    obj.dialog2.close();
                }
            }
        });
    }


    //查看完成详情
    function successOrder(obj, name, time, desc,downTime,receoderTime,okTime) {
        obj.dialog2 = jqueryAlert({
            'width':"70%",
            'content': '<ul>\n' +
                '\t\t\t<li>商品名称：'+name+'</li>\n' +
                '\t\t\t<li>派送时间：'+time+'</li>\n' +
                '\t\t\t<li>附加信息：'+desc+'</li>\n' +
                '\t\t\t<li>下单时间：'+downTime+'</li>\n' +
                '\t\t\t<li>接单时间：'+receoderTime+'</li>\n' +
                '\t\t\t<li>完成时间：'+okTime+'</li>\n' +
                '\t\t</ul>',
            'modal': true,
            'buttons': {
                '确定': function () {
                    obj.dialog2.close();
                }
            }
        });
    }


    //接单
    function getOrder(obj, oid) {
        $.ajax({
            url: "${pageContext.request.contextPath}/setToOderList",
            type: "POST",
            data: {"oid": oid},
            success: function (data) {
                var result = data.result;
                if (result === "success") {
                    obj.dialog1 = jqueryAlert({
                        'content': '接单成功'
                    });
                    var ss = obj.className;
                    $("." + ss).parent("#" + oid).remove();
                } else {
                    obj.dialog1 = jqueryAlert({
                        'content': '接单失败，请重新尝试'
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status === 500) {
                    alert("服务器请求错误，请稍候重试");
                }
                if (textStatus === "error") {
                    alert("服务器请求错误，请稍候重试");
                } else if (textStatus === "timeout") {
                    alert("服务器请求超市，请稍候重试");
                }

            }

        })
    }

    //完成订单
    function setOkOrder(obj, oid) {
        $.ajax({
            url: "${pageContext.request.contextPath}/setThreeOderList",
            type: "POST",
            data: {"oid": oid},
            success: function (data) {
                var result = data.result;
                if (result === "success") {
                    obj.dialog1 = jqueryAlert({
                        'content': '订单完成'
                    });
                    var ss = obj.className;
                    $("." + ss).parent("#" + oid).remove();
                } else {
                    obj.dialog1 = jqueryAlert({
                        'content': '接单失败，请重新尝试'
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status === 500) {
                    alert("服务器请求错误，请稍候重试");
                }
                if (textStatus === "error") {
                    alert("服务器请求错误，请稍候重试");
                } else if (textStatus === "timeout") {
                    alert("服务器请求超市，请稍候重试");
                }

            }

        })
    }
    $(function () {
        var orderList1 = $("#order-list1");
        var orderList2 = $("#order-list2");
        var orderList3 = $("#order-list3");
        orderList2.hide();
        orderList3.hide();
        var nav1 = $(".nav1");
        var nav2 = $(".nav2");
        var nav3 = $(".nav3");
        nav1.addClass("navbar-focus");
        navToggle(nav1, nav2, nav3, orderList1, orderList2, orderList3);
        navToggle(nav2, nav1, nav3, orderList2, orderList1, orderList3);
        navToggle(nav3, nav1, nav2, orderList3, orderList1, orderList2);


        nav1.click(function () {
            $(".enter").show().text("接单");
        });
        nav2.click(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/toOrderList",
                type: "POST",
                success: function (data) {
                    if (data != null) {
                        $("#order-list2").text("");
                        for (var i = 0; i < data.length; i++) {
                            $("#order-list2").append("<ul id='" + data[i].oid + "' class='list-item' ondblclick='oderDesc(this,\""+data[i].oName+"\",\""+data[i].oTime+"\",\""+data[i].oDesc+"\",\""+data[i].oDownorderTime+"\")' >\n" +
                                "            <li class='item-left item-name'>姓名："+data[i].oUser+"</li>\n" +
                                "            <li class='item-left item-phone'>电话："+data[i].oPhone+"</li>\n" +
                                "            <li class='item-left item-address'>派送地址："+data[i].oAddress+"</li>\n" +
                                "            <li class='item-btn' onclick='setOkOrder(this,\""+data[i].oid+"\")'><span class='enter'>接单</span></li>\n" +
                                "        </ul>");
                        }

                        $(".enter").text("完成");
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status === 500) {
                        alert("服务器请求错误，请稍候重试");
                    }
                    if (textStatus === "error") {
                        alert("服务器请求错误，请稍候重试");
                    } else if (textStatus === "timeout") {
                        alert("服务器请求超市，请稍候重试");
                    }

                }

            })

        });
        nav3.click(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/threeOrderList",
                type: "POST",
                success: function (data) {
                    if (data != null) {
                        $("#order-list3").text("");
                        for (var i = 0; i < data.length; i++) {
                            $("#order-list3").append("<ul id='" + data[i].oid + "' class='list-item' ondblclick='successOrder(this,\""+data[i].oName+"\",\""+data[i].oTime+"\",\""+data[i].oDesc+"\",\""+data[i].oDownorderTime+"\",\""+data[i].oReceoderTime+"\",\""+data[i].oOkoderTime+"\")' >\n" +
                                "            <li class='item-left item-name'>姓名："+data[i].oUser+"</li>\n" +
                                "            <li class='item-left item-phone'>电话："+data[i].oPhone+"</li>\n" +
                                "            <li class='item-left item-address'>派送地址："+data[i].oAddress+"</li>\n" +
                                "            <li class='item-btn' onclick='getOrder(this,'"+data[i].oid+"')'><span class='enter'>接单</span></li>\n" +
                                "        </ul>");
                        }

                        $(".enter").hide();
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status === 500) {
                        alert("服务器请求错误，请稍候重试");
                    }
                    if (textStatus === "error") {
                        alert("服务器请求错误，请稍候重试");
                    } else if (textStatus === "timeout") {
                        alert("服务器请求超市，请稍候重试");
                    }

                }

            })
        });

        function navToggle(obj1, obj2, obj3, oder1, oder2, oder3) {
            obj1.click(function () {
                obj1.addClass("navbar-focus");
                obj2.removeClass("navbar-focus");
                obj3.removeClass("navbar-focus");

                oder1.show();
                oder2.hide();
                oder3.hide();
            })
        }
    });

</script>
</body>
</html>
