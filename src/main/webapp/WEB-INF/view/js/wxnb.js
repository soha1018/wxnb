$(function () {
    var PageContext = $("#PageContext").val();
    var name = $("#user");
    var pwd = $("#pwd");

    if (name.val() != null && name.val() !== "") {
        $("#remember").prop("checked", "checked");
    } else {
        $("#remember").prop("checked", "");
    }

    $("#bt_login").click(function () {
        var s1 = inputError(name);
        var s2 = inputError(pwd);
        //是否选中
        var remember = $("#remember").prop("checked");
        if (remember) {
            remember = 1;
        } else {
            remember = 0;
        }

        if (s1 && s2) {
            $.ajax({
                url: PageContext + "/user/login",
                type: "POST",
                data: {"user": name.val(), "pwd": pwd.val(), "remember": remember},
                success: function (data) {
                    var result = data.result;
                    if (result === "success") {
                        window.location.href = PageContext + "/orderList";
                    } else if (result === "empty") {
                        alert("请输入正确有效的信息");
                    } else {
                        alert("请检查账号密码是否正确");
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
            });
        } else {
            alert("请填写完整有效的信息");
        }


    });

    function inputError(obj) {
        obj.removeClass("input_exist exist");
        var text = obj.val();
        return !(text == null || text === "");
    }

});