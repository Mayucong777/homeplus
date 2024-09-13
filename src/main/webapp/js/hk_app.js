$(document).ready(function () {
    loginSuccess();
    $(".log-out").click (function () {
        logout();
    })

    loadApp();
})

function loadApp() {
    var url = "app/getVaildApp";
    $.ajax ({
        "url": url,
        "type": "Post",
        "success": function (json) {
            var list = json.data;
            for (var i = 0; i < list.length; i++) {
                var optionData = "<tr>\n" +
                    "<th>#{id}</th>\n" +
                    "<th>#{type}</th>\n" +
                    "<th>#{address}</th>\n" +
                    "<th>#{phone}</th>\n" +
                    "<th>#{datetime}</th>\n" +
                    "<th>\n" +
                    "<button id='#{btn-id}' #{disabled} class=\"submit-apply btn btn-primary\">#{btn-status}</button>\n" +
                    "</th>\n" +
                    "</tr>";
                optionData = optionData.replace("#{id}", i+1);
                optionData = optionData.replace("#{type}", list[i].appType);
                optionData = optionData.replace("#{address}", list[i].appAddress);
                optionData = optionData.replace("#{phone}", list[i].appPhone);
                optionData = optionData.replace("#{datetime}", formatDate(list[i].appBeginTime));
                optionData = optionData.replace("#{btn-id}", list[i].id);
                if (comphkID(list[i].applyList, list[i].hkID)) {
                    optionData = optionData.replace("#{btn-status}", "已经申请");
                    optionData = optionData.replace("#{disabled}", "disabled");
                } else {
                    optionData = optionData.replace("#{btn-status}", "申请");
                }
                $("tbody").append(optionData);
            }
            submitApply();
        }
    })
}

function comphkID(list, hkID) {
    var result = false;
    for (var i = 0; i < list.length; i ++) {
        if (list[i] == hkID) {
            result = true;
            break;
        }
    }
    return result;
}

function submitApply() {
    $(".submit-apply").click(function () {
        $(this).text("已经申请");
        $(this).attr({"disabled": "disabled"})
        var url = "app/apply";
        var data = "id=" + $(this).attr("id");
        $.ajax ({
            "url": url,
            "data": data,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    swal({
                        title: "提醒",
                        text: "申请成功!"
                    })
                } else {
                    alert(json.message);
                    window.location.href = "hk_person.jsp";
                }
            }
        })
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