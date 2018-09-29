<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2018/9/18
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单填写</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="full-screen" content="yes">
    <meta name="browsermode" content="application">
    <meta name="x5-fullscreen" content="true">
    <meta name="x5-page-mode" content="app">
    <link rel="stylesheet" type="text/css" href="css/lxs_index.css"/>
    <link rel="stylesheet" type="text/css" href="css/lxsHeadFoot.css">
    <link rel="stylesheet" type="text/css" href="css/order_new.css"/>
    <link rel="stylesheet" type="text/css" href="css/verify.css"/>
    <link rel="stylesheet" type="text/css" href="css/alert.css"/>
    <link rel="stylesheet" type="text/css" href="css/loading.css"/>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/verify.min.js"></script>
    <script src="js/alert.js"></script>
</head>
<body>
<div class="cell" id="cssload" style="display: none;" >
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

<div class="content">
    <div class="headTop">
        <a href="javascript:history.go(-1)" class="back"><i class="iconBack"></i></a><span>订单填写</span><a class="more"><i
            class="iconDian"></i><i class="iconDian"></i><i class="iconDian"></i></a>
    </div>
</div>


<div class="j_main m-main" data-role="page">
    <!-- <div class="o_logo">
        <span>登录预订更便捷</span><a href="" rel="nofollow">马上登录</a>
    </div> -->
    <form action="${pageContext.request.contextPath}/order/save" method="post" name="form_1" id="order_from">

        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />

        <div class="tit">
            <i></i>填写订单信息
        </div>
        <div class="txt">
            <dl>
                <dt>商品名称</dt>
                <dd class="line30"><input id="shop_name" maxlength="20" type="text" name="o_name" class="o_man"
                                          placeholder="商品名称（必填）" value="">
                </dd>
            </dl>
            <dl>
                <dt>派送地址</dt>
                <dd class="line30"><input id="shop_address" maxlength="20" type="text" name="o_address" class="o_man"
                                          placeholder="派送地址（必填）列如:1号楼101" value=""></dd>
            </dl>
            <dl>
                <dt>派送时间</dt>
                <dd><input id="shop_time" type="time" name="o_time" class="o_man" placeholder="派送时间（必填）" value=""></dd>
            </dl>
            <dl class="J_price">
                <dt>附加信息</dt>
                <!-- <dd class="box-flex-1 price pd0" id="adult_price_span"><span>￥ <span id="price_child_d">0</span></span></dd>
                <dd class="box-flex-2"><span class="subadd j_num"><span class="sub" data-type="adults"></span><input id="shop_number" type="number" min="0" max="99" class="text_num" value="0" name="child_num"><span class="add" data-type="adults"></span></span>
                </dd>-->
                <dd><textarea name="o_dessc" id="shop_desc" cols="30" rows="10" placeholder="填写信息"></textarea></dd>
            </dl>
        </div>
        <div class="tit">
            <i></i>提示信息<br>
            <p style="font-size:14px">可派送任何商品，提供各种服务。只有你想不到，没有我们做不到！</p>
            <span>派送费用：白天2元。晚上4元。药品免费。</span>
        </div>
        <div class="txt txt2 J_baoxian">
        </div>

        <script></script>
        <div class="tit">
            <i></i>填写联系人信息
        </div>
        <div class="txt">
            <dl>
                <dt>联系人</dt>
                <dd><input id="order_linkman" maxlength="20" type="text" name="o_linkman" class="o_man"
                           placeholder="真实姓名（必填）" value=""></dd>
            </dl>
            <dl>
                <dt>手机号码</dt>
                <dd class="pd0"><input type="tel" name="o_phone" id="n_mobiletel" class="o_number" maxlength="11"
                                       placeholder="手机号码（必填）" value=""></dd>
            </dl>
            <dl>
                <dt>验证码</dt>
                <dd class="simple"></dd>
            </dl>
        </div>
        <div class="booking_notes">
            <label><i class="on"></i>我已阅读并同意此产品的</label><a href="javascript:void(0);" class="btn_notes">预订须知</a>
            <p>
                温馨提示：为了保障您的购买权益，请填写真实详细信息。
            </p>
        </div>
    </form>
    <div class="submintFix">
        <dd class="sbmFix">
            <button type="button" id="save">提交订单</button>
        </dd>
    </div>
</div>
<script src="js/min_com.js"></script>
<script src="js/order_xianlu.js"></script>

</body>
</html>
