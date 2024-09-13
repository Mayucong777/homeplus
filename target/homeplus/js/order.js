$(document).ready(function () {
    loginSuccess();
    $(".log-out").click (function () {
        logout();
    })

    loadOrder(1);

    $("#confPageNum").click(function () {
        var pageNum = $("#pageNum").val();
        var pages = $(".pages").text();
        if (pageNum > pages) {
            swal({
                title: "提醒",
                text: "超过了最大的页数"
            })
        } else {
            loadOrder($("#pageNum").val())
        }
    })
})


// 加载订单
function loadOrder(x) {
    $.ajax ({
        "url": "order/getAllOrder",
        "data": "pageNum=" + x,
        "type": "Post",
        "success": function (json) {
            var list = json.data.list;
            $("tbody").html("");
            for (var i = 0; i < list.length; i ++) {
                var optionData = "<tr>\n" +
                    "<th>#{hk_name}</th>\n" +
                    "<th>#{order_dur}</th>\n" +
                    // "<th>#{order_money}</th>\n" +
                    "<th>#{order_status}</th>\n" +
                    "<th>\n" +
                    "<button id='#{btn-id}' class=\"#{btn-see} btn btn-primary\">#{btn_status}</button>\n" +
                    "<button id='#{btn-id}' class=\"#{btn-assess} btn btn-primary\" style=\"display: none \">#{btn_comment}</button>\n" +
                    "</th>\n" +
                    "</tr>";
                if (list[i].orderStatus == 0) {
                    optionData = optionData.replace("#{order_status}", "已完成");
                    optionData = optionData.replace("#{order_dur}", list[i].orderDur);
                    optionData = optionData.replace("#{order_money}", list[i].orderMoney);
                    optionData = optionData.replace("#{btn_comment}", "评价");
                    optionData = optionData.replace("#{btn-assess}", "btn-assess");
                    optionData = optionData.replace("#{btn_status}", "查看");
                    optionData = optionData.replace("#{btn-see}", "btn-see");
                } else if (list[i].orderStatus == 1) {
                    optionData = optionData.replace("#{order_status}", "进行中");
                    optionData = optionData.replace("#{order_dur}", "未知");
                    optionData = optionData.replace("#{order_money}", "未知");
                    optionData = optionData.replace("#{btn_status}", "查看");
                    optionData = optionData.replace("#{btn-see}", "btn-see")
                    // optionData = optionData.replace("#{display}","none");
                }else if(list[i].orderStatus == -1){
                    optionData = optionData.replace("#{order_status}", "待确认");
                    optionData = optionData.replace("#{order_dur}", "未知");
                    optionData = optionData.replace("#{order_money}", "未知");
                    optionData = optionData.replace("#{btn_status}", "查看");
                    optionData = optionData.replace("#{btn-see}", "btn-see")
                    // optionData = optionData.replace("#{display}","none");
                }
                optionData = optionData.replace("#{btn-id}", list[i].id);
                optionData = optionData.replace("#{hk_name}", list[i].hkName);
                $("tbody").append(optionData);
            }
            $(".pages").text(json.data.pages);
            $(".prev").click(function () {
                if (json.data.prePage <= 0) {
                    // alert ("当前为第一页");
                } else {
                    loadOrder(json.data.prePage)
                }
            })

            $(".next").click(function () {
                if (json.data.pageNum > json.data.pageSize) {
                    // alert ("这是最后一页");
                } else {
                    loadOrder(json.data.pageNum + 1)
                }
            })

            showModal();
            // deleteOrder();
            //assessOrder();
        }
    })
}

var order_ID = "默认";//订单id的全局变量
// 查看单项订单
function showModal() {
    $(".btn-see").parent().on("click", ".btn-see", function () {
        var data = "orderID=" + $(this).attr("id");
        order_ID = $(this).attr("id");
        //alert(data);
        $.ajax({
            "url": "order/getOrderByID",
            "data": data,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    if (json.data.orderStatus == 0) {
                        $(".status").val("已完成")
                        $(".end-time").val(formatDate(json.data.orderEndTime));
                        $(".money").val(json.data.orderMoney)
                    } else if(json.data.orderStatus == 1){
                        $(".status").val("进行中")
                        $(".end-time").val("未知");
                        $(".money").val("未知")
                    } else if(json.data.orderStatus == -1){
                        $(".status").val("等待家政人员接受")
                        $(".end-time").val("未知");
                        $(".money").val("未知")
                    }
                    $(".name").val(json.data.hkName);
                    $(".begin-time").val(formatDate(json.data.orderBeginTime));
                    $(".address").val(json.data.orderAddress)
                }
            }
        })
        loadOrderComment($(this).attr("id"));
        $("#myModal").modal("show");
    })
}


function JudgeOrderStatus(orderID) {
    var data = "orderID=" + orderID;
    var orderStatus = "null";
    $.ajax({
        "url": "order/getOrderByID",
        "data": data,
        "dataType": "json",
        "type": "Post",
        async: false,//ajax是异步的，所以大多时候没执行完AJAX就return了，所以会一直返回undefined,这里将ajax请求改为同步就可以返回
        "success": function (json) {
            if (json.state == 200) {
                /*switch (json.data.orderStatus) {
                    case -1:
                        return -1;//未接受
                        break;
                    case 1:
                        return 1;//接受 未完成
                        break;
                    case 0:
                        return 0;//接受 已完成
                        break;
                }*/
                if(json.data.orderStatus == -1){
                    orderStatus = -1;
                    return orderStatus;
                }else if (json.data.orderStatus == 1){
                    orderStatus = 1;
                    return orderStatus;
                }else if (json.data.orderStatus == 0){
                    orderStatus = 0;
                    return orderStatus;
                }
            }else{
                orderStatus = "error"
            }
        }
    })
    return orderStatus;
}

function loadOrderComment(orderID) {
    var data = "orderID=" + orderID;
    //alert(JudgeOrderStatus(orderID));
    //具有true和false属性的属性，就使用prop()，比如checked    selected   disabled等，其他的使用attr()
    $("#good").prop("checked",false);
    $("#mid").prop("checked",false);
    $("#bad").prop("checked",false);
    $.ajax({
        "url": "order/getOrderCommentByID",
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            var comment = document.getElementById("comment");
            var commentBtn = document.getElementById("comment-btn");
            if (json.state == 200) {
                //订单已完成，但还未评论
                if(json.data == null && JudgeOrderStatus(orderID) == 0){
                    //$("#comment").style.display="none";
                    comment.style.display="none";
                    commentBtn.style.display="";
                    //commentBtn.onclick = assessOrder(orderID);
                    //$("#comment-btn").style.display="";
                }
                //订单未完成的，无法加载评论信息以及评论功能
                else if (json.data == null && JudgeOrderStatus(orderID) == 1){
                    comment.style.display="none";
                    commentBtn.style.display="none";
                }
                //订单未接受，未完成的，无法加载评论信息以及评论功能
                else if (json.data == null && JudgeOrderStatus(orderID) == -1){
                    comment.style.display="none";
                    commentBtn.style.display="none";
                }
                //订单已完成，且已评论的，仅显示评论信息
                else if(json.data.commentContent != null){
                    comment.style.display="";
                    commentBtn.style.display="none";
                    switch (json.data.commentStar) {
                        case 2:
                            $("#good").prop("checked",true);
                            break;
                        case 1:
                            $("#mid").prop("checked",true);
                            break;
                        case 0:
                            $("#bad").prop("checked",true);
                            break;
                    }
                    $(".comment-content1").val(json.data.commentContent);
                    $(".commentTime1").val(formatDate(json.data.commentTime));
                }
            }
        }
    })
}

// 评价订单
function assessOrder() {
    /*$(".btn-assess").parent().on("click", ".btn-assess", function () {
        $("#assessModal").modal("show");
        var orderID = $(this).attr("id");
        submitAssess(orderID);
    })*/
    //var orderID = $(".btn-see").attr("id");
    //alert(order_ID);
    $("#assessModal").modal("show");
    submitAssess(order_ID);
}

function submitAssess(orderID) {
    $(".submit-assess").parent().on("click", ".submit-assess", function () {
        var url = "order/assessOrder";
        var data = "orderID=" + orderID + "&commentStar=" + $("input[name='assess']:checked").val()
            + "&commentContent=" + $(".comment-content").val();
        $.ajax({
            "url": url,
            "data": data,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    swal({
                        title: "提示",
                        text: "评价成功！"
                    })
                }
            }
        })
    })
}

// function deleteOrder() {
//     $(".btn-del").parent().on("click", "button", function () {
//         var data = "orderID=" + $(this).attr("id");
//         $.ajax({
//             "url": "order/deleteOrderByID",
//             "data": data,
//             "dataType": "json",
//             "type": "Post",
//             "success": function (json) {
//                 if (json.state == 200) {
//                     swal({
//                         title: "提示",
//                         text: "删除成功！"
//                     })
//                     loadOrder(1);
//                 }
//             }
//         })
//     })
// }

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