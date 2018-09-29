var PageContext = $("#PageContext").val();
var cssload = $("#cssload");
$(function () {
    $("#query").click(function () {
        var oid = $("#oid").val();
        if (oid == null || oid === "") {
            alert("请输入订单号");
        } else {
            cssload.css("display", "block");

            $.ajax({
                url:PageContext+"/order/queryOrder",
                type:"POST",
                data:{"oid":oid},
                success:function (data) {
                    var result = data.result;
                    cssload.css("display", "none");

                    if (result === "success") {
                        $("#content").text("");
                        $("#content").css("display","block");
                        $("#content").append('<ul>\n' +
                            '        <li>商品名称：' + data.order.oName + '</li>\n' +
                            '        <li>派送地址：' + data.order.oAddress + '</li>\n' +
                            '        <li>派送时间：' + data.order.oTime + '</li>\n' +
                            '        <li>附加信息：' + data.order.oDesc + '</li>\n' +
                            '        <li>联系人：' + data.order.oUser + '</li>\n' +
                            '        <li>手机号码：' + data.order.oPhone + '</li>\n' +
                            '        <li>订单状态：' + data.status + '</li>\n' +
                            '    </ul>');
                    } else {
                        alert("请输入正确的订单号");
                    }


                },
                error:function (jqXHR, textStatus, errorThrown) {
                    cssload.css("display", "none");

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
            });
        }
    });

});