var PageContext = $("#PageContext").val();
var cssload = $("#cssload");
function oderDesc(obj,oid) {
    obj.dialog2 = jqueryAlert({
        'width':"70%",
        'content': "下单成功，请等待配送。<br/>订单号："+oid+"<br/><br/>长按复制到剪切板",
        'modal': true,
        'buttons': {
            '确定': function () {
                obj.dialog2.close();
                setTimeout(function () {
                    window.location.href = PageContext+"/index";
                },200);
            }
        }
    });
}
$(function() {
    var shop_name = $("#shop_name");
    var shop_address = $("#shop_address");
    var shop_time = $("#shop_time");
    var order_linkman = $("#order_linkman");
    var n_mobiletel = $("#n_mobiletel");
    var verCode = $(".varify-input-code");
    inputBlur(shop_name, "请输入商品名称");
    inputBlur(shop_address, "请输入派送地址");
    inputBlur(shop_time, "请输入派送时间");
    inputBlur(order_linkman, "请输入您的大名");
    inputBlur(n_mobiletel, "请输入手机号码");
    inputBlur(verCode, "请输入验证码");



    $(".simple").codeVerify({
        type : 1,
        width : '200px',
        height : '40px',
        fontSize : '20px',
        codeLength : 5,
        btnId : 'save',
        ready : function() {
        },
        success : function() {
            send();
        },
        error : function() {
            alert('验证码不匹配！');
        }
    });

    function send() {
        var s1 = inputError(shop_name, "请输入商品名称");
        var s2 = inputError(shop_address, "请输入派送地址");
        var s3 = inputError(shop_time, "请输入派送时间");
        var s4 = inputError(order_linkman, "请输入您的大名");
        var s5 = inputError(n_mobiletel, "请输入手机号码");
        var s6 = inputError(verCode, "请输入验证码");
        if (s5) {
            if (!checkMobile(n_mobiletel.val())) {
                alert("请输入正确的手机号");
                return;
            }
        }

        if (s1 && s2 && s3 && s4 && s5) {
            cssload.css("display", "block");
            $.ajax({
                url:PageContext+"/order/save",
                type:"POST",
                data:{"o_name":shop_name.val(),"o_address":shop_address.val(),"o_time":shop_time.val(),
                    "o_desc":$("#shop_desc").val(),"o_linkman":order_linkman.val(),"o_phone":n_mobiletel.val()},
                success:function (data) {
                    cssload.css("display", "none");
                    var result = data.result;
                    if (result === "success") {
                        $("#order_from")[0].reset();
                        var btn_save = $("#save");

                        oderDesc(btn_save,data.orderid)
                    }else if (result === "empty") {
                        alert("请填写有效信息")
                    }else if (result === "failed") {
                        alert("下单失败，请重新提交");
                    } else {
                        alert("请检查网络");
                    }
                },
                error:function (jqXHR, textStatus, errorThrown) {
                    cssload.css("display", "none");

                    console.log(jqXHR.responseText);
                    console.log(jqXHR.status);
                    console.log(jqXHR.readyState);
                    console.log(jqXHR.statusText);
                    /*弹出其他两个参数的信息*/
                    console.log(textStatus);
                    if (jqXHR.status===500) {
                        alert("服务器请求错误，请稍候重试");
                    }
                    if (textStatus === "error") {
                        alert("服务器请求错误，请稍候重试");
                    }else if (textStatus === "timeout") {
                        alert("服务器请求超市，请稍候重试");
                    }

                }

            })
        }else {
            alert("请填写有效信息");
        }
    }



    function inputError(obj, msg) {
        obj.removeClass("input_exist exist");
        var text = obj.val();
        if (text==null || text === "") {
            obj.addClass("input_not invalid");
            obj.attr("placeholder", msg);
            return false;
        } else {
            return true;
        }
    }

    function inputBlur(obj, msg) {
        obj.blur(function () {
            obj.removeClass("input_exist exist");
            var text = obj.val();
            if (text.length === 0 || text === "") {
                obj.addClass("input_not invalid");
                obj.attr("placeholder", msg);
            }
        });

        obj.focus(function () {
            obj.removeClass("input_not invalid");
            obj.addClass("input_exist exist");
        });
    }
});