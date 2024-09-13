$(document).ready(function () {
    loginSuccess();
    $(".log-out").click (function () {
        logout();
    })
    loadApp();
})

function loadApp() {
    var url = "app/getAppCustomer";
    $.ajax ({
        "url": url,
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                var list = json.data;
                for (var i = 0; i < list.length; i++) {
                    var optionData = "<tr>\n" +
                        "<th>#{index}</th>\n" +
                        "<th>#{type}</th>\n" +
                        "<th>#{address}</th>\n" +
                        "<th>#{beginTime}</th>\n" +
                        "<th>#{status}</th>\n" +
                        "<th>\n" +
                        "<button id='#{id}' class=\"see btn btn-primary\">查看</button>\n" +
                        "</th>\n" +
                        "<th>\n" +
                        "<button id='#{op-id}' class=\"operate btn btn-primary\">#{operation}</button>\n" +
                        "</th>\n" +
                        "</tr>";
                    if (list[i].appStatus == 1) {
                        if (list[i].applyList.length <= 0) {
                            optionData = optionData.replace("#{status}", "无人申请");
                            optionData = optionData.replace("#{operation}", "取消");
                        } else {
                            optionData = optionData.replace("#{status}", "待通过");
                            optionData = optionData.replace("#{operation}", "删除");
                        }
                    } else {
                        optionData = optionData.replace("#{status}", "已完成");
                        optionData = optionData.replace("#{operation}", "删除");
                    }
                    optionData = optionData.replace("#{index}", i+1);
                    optionData = optionData.replace("#{type}", list[i].appType);
                    optionData = optionData.replace("#{address}", list[i].appAddress);
                    optionData = optionData.replace("#{beginTime}", formatDate(list[i].appBeginTime));
                    optionData = optionData.replace("#{id}", list[i].id);
                    optionData = optionData.replace("#{op-id}", list[i].id);
                    $("tbody").append(optionData);
                }
                showModal();
                operateApp();
            }

        }
    })
}

function showModal() {
    $(".see").parent().on("click", "button", function () {
        var idVal = $(this).attr("id");
        var data = "id=" + $(this).attr("id");
        $.ajax({
            "url": "app/getSingleApp",
            "data": data,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                var data = json.data;
                $(".type").val(data.appType);
                $(".address").val(data.appAddress);
                $(".beginTime").val(formatDate(data.appBeginTime));
                if (data.appStatus == 0) {
                    $(".app-status").val("已完成");
                    $(".apply-list").html();
                } else {
                    $(".app-status").val("进行中...");
                    $(".apply-list").html(appendList(data.applyNameList, data.applyList));
                }
                $(".address").val(data.appAddress);
                confirmHK(idVal);
            }
        })
        $("#myModal").modal("show");
    });
}

function operateApp() {
    $(".operate").parent().on("click", "button", function () {
        var idVal = $(this).attr("id");
        if ($(this).text() == "删除") {
            alert("删除")
            deleteApp($(this), idVal);
        } else if ($(this).text() == "取消") {
            alert("取消" + idVal)
            cancelApp($(this), idVal);
        }
    })
}

function deleteApp(container, id) {
    $.ajax ({
        "url": "app/deleteApp",
        "data": "id=" + id,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                swal({
                    title: "提示",
                    text: "删除成功！"
                })
            }
            container.parent().parent().remove();
        }
    })
}

function cancelApp(container, id) {
    $.ajax ({
        "url": "app/updateAppStatus",
        "data": "id=" + id,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                swal({
                    title: "提示",
                    text: "取消成功！"
                })
                container.val("删除");
                $("#myModal").modal("hide");
            }
        }
    })
}

function confirmHK(id) {
    $(".confirm").parent().on("click", "button", function () {
        var url = "app/confirmHK";
        var data = "id=" + id + "&hkID=" + $(this).attr("id");
        $.ajax ({
            "url": url,
            "data": data,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    swal({
                        title: "提醒",
                        text: "确定成功！"
                    })
                }
            }
        })
    })
}

function appendList(nameList, idList) {
    var result = "";
    for (var i = 0; i < nameList.length; i ++) {
        result += "<li><a href=\"housekeeper.jsp\">" + nameList[i] + "</a><button id='" + idList[i] + "' class='confirm btn btn-primary'>确认申请</button></li>";
    }
    return result;
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

// 登录成功
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