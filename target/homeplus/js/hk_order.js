$(document).ready(function () {
    loginSuccess();
    $(".log-out").click (function () {
        logout();
    })
    loadHKOrder();
})

// 加载家政人员的所有订单
function loadHKOrder() {
    var url = "order/getOrderListByHKID";
    $.ajax ({
        "url": url,
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                var list = json.data;
                for (var i = 0; i < list.length; i ++) {
                    var optionData = "<tr>\n" +
                        "<th>#{id}</th>\n" +
                        "<th>#{beginTime}</th>\n" +
                        "<th>#{endTime}</th>\n" +
                        "<th>#{address}</th>\n" +
                        // "<th>#{money}</th>\n" +
                        "<th>#{phone}</th>\n" +
                        "<th>\n" +
                        "<button id='#{accept-btn}' style='display: #{accept-status}' class=\"submit-accept btn btn-primary\">接受</button>\n" +
                        "<button id='#{finish-btn}' style='display: #{finish-status}' class=\"submit-finish btn btn-primary\">完成</button>\n" +
                        "<button id='#{cancel-btn}' style='display: #{cancel-status}' class=\"submit-cancel btn btn-primary\">取消</button>\n" +
                        "<button id='#{delete-btn}' style='display: #{delete-status}' class=\"submit-delete btn btn-primary\">删除</button>\n" +
                        "</th>\n" +
                        "</tr>";
                    if (list[i].orderStatus == 0) {
                        optionData = optionData.replace("#{endTime}", formatDate(list[i].orderEndTime));
                        optionData = optionData.replace("#{accept-status}", "none");
                        optionData = optionData.replace("#{finish-status}", "none");
                        optionData = optionData.replace("#{cancel-status}", "none");
                        optionData = optionData.replace("#{delete-status}", "block");
                    } else if (list[i].orderStatus == 1) {
                        optionData = optionData.replace("#{endTime}", "未知");
                        optionData = optionData.replace("#{accept-status}", "none");
                        optionData = optionData.replace("#{finish-status}", "block");
                        optionData = optionData.replace("#{cancel-status}", "none");
                        optionData = optionData.replace("#{delete-status}", "none");
                    } else if (list[i].orderStatus == -1) {
                        optionData = optionData.replace("#{endTime}", "未知");
                        optionData = optionData.replace("#{accept-status}", "block");
                        optionData = optionData.replace("#{finish-status}", "none");
                        optionData = optionData.replace("#{cancel-status}", "block");
                        optionData = optionData.replace("#{delete-status}", "none");
                    }
                    optionData = optionData.replace("#{id}", i + 1);
                    optionData = optionData.replace("#{beginTime}", formatDate(list[i].orderBeginTime));
                    optionData = optionData.replace("#{address}", list[i].orderAddress);
                    optionData = optionData.replace("#{phone}", list[i].orderPhone);
                    // optionData = optionData.replace("#{phone}", list[i].orderPhone);
                    optionData = optionData.replace("#{accept-btn}", list[i].id);
                    optionData = optionData.replace("#{finish-btn}", list[i].id);
                    optionData = optionData.replace("#{cancel-btn}", list[i].id);
                    optionData = optionData.replace("#{delete-btn}", list[i].id);
                    $("tbody").append(optionData);
                }
                acceptOrder();
                finishOrder();
                cancelOrder();
                deleteOrder();;
            }
        }
    })
}

function acceptOrder() {
    $(".submit-accept").parent().on("click", ".submit-accept", function () {
        var url = "order/acceptOrder";
        var idVal = $(this).attr("id");
        $.ajax ({
            "url": url,
            "data": "id=" + idVal,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    swal ({
                        title: "提醒",
                        text: "接受成功"
                    })
                }

            }
        })
    })
}

function finishOrder() {
    $(".submit-finish").parent().on("click", ".submit-finish", function () {
        var url = "order/finishOrder";
        var idVal = $(this).attr("id");
        $.ajax ({
            "url": url,
            "data": "id=" + idVal,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    swal ({
                        title: "提醒",
                        text: "完成该项订单"
                    })
                }
            }
        })
    })
}

function cancelOrder() {
    $(".submit-cancel").parent().on("click", ".submit-cancel", function() {
        var idVal = $(this).attr("id");
        $.ajax ({
            "url": "order/cancelOrder",
            "data": "id=" + idVal,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    swal ({
                        title: "提醒",
                        text: "取消成功"
                    })
                }
            }
        })
    })
}

function deleteOrder() {
    $(".submit-delete").parent().on("click", ".submit-delete", function() {
        var url = "";
        var idVal = $(this).attr("id");
        $.ajax ({
            "url": url,
            "data": "id=" + idVal,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                swal ({
                    title: "提醒",
                    text: "删除成功"
                })
            }
        })
    })
}


function loginSuccess() {
    $(".log-out").css({"display": "none"});
    $.ajax({
        "url": "user/loginSuccess",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                $(".log-out").css({"display": "block"});
                $(".log-in").css({"display": "none"});
                $(".register").css({"display": "none"});
                var role = $("#role").text();
                if (role == 0){
                    $(".hk-person").css({"display": "none"});
                }else if (role == 1){
                    $(".cm-person").css({"display": "none"});
                }
            }else if(json.state== 406) {
                alert("用户未登录，请先登录！");
                window.location.href = "login.jsp";
            }
        }
    })
}

// 退出系统
function logout() {
    $.ajax ({
        "url": "user/logout",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                alert("退出成功...");
            }
        }
    })
}

function formatDate(mills) {
    var newTime = new Date(mills);
    var year = newTime.getFullYear();
    var month = newTime.getMonth() + 1;
    var day = newTime.getDate();
    var hour = newTime.getHours();
    var minute = newTime.getMinutes();
    var second = newTime.getSeconds();
    return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
}