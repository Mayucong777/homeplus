$(document).ready(function () {
    showAllMessage();
    showContent();
})

var msgID = "默认";  //留言id的全局变量
var this_;
// 展示所有的消息
function showAllMessage() {
    var url = "message/getMessageByToID";
    $.ajax({
        "url": url,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            var list = json.data;
            $(".num").text(list.length);
            for (var i = 0; i < list.length; i ++) {
                var optionData = "<tr>\n" +
                    "<th class=\"msg-content\">#{content}</th>\n" +
                    "<th>#{createdDate}</th>\n" +
                    "<th>\n" +
                    "<button class=\"see btn btn-primary\" id='#{sid}'>查看</button>\n" +
                    "<button class=\"delete btn btn-primary\" id='#{did}' disabled='disabled'>删除</button>\n" +
                    "</th>\n" +
                    "</tr>";
                optionData = optionData.replace("#{content}", showOmit(list[i].content));
                optionData = optionData.replace("#{createdDate}", formatDate(list[i].createdTime));
                optionData = optionData.replace("#{sid}", list[i].id);
                optionData = optionData.replace("#{did}", list[i].id);
                $("tbody").append(optionData);
                $(".see").parent().on("click", ".see", function () {
                    //全局变量赋值
                    msgID = $(this).attr("id");
                    this_ = $(this);
                    showContent($(this))
                })

                $(".delete").parent().on("click", ".delete", function () {
                    deleteSingleMessage($(this))
                    $(this).parent().parent().remove();
                })
            }
        }
    })
}

// 展示一条信息的内容
function showContent(elem) {
    $.ajax({
        "url": "message/getSingleMessage",
        "data": "id=" + elem.attr("id"),
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            $(".note-content-list-node").empty();
            $(".note-content-follow-list").empty();
            var data = json.data;
            $("#msgID").val(data.id);
            var msgData = "<p>#{fName}：&nbsp;&nbsp;&nbsp;<span @>#{tName}</span></p>\n" +
                "<p>#{msgTime}</p>\n" +
                "<p>#{msgContent}</p>";
            msgData = msgData.replace("#{fName}",data.fromName);
            msgData = msgData.replace("#{tName}",data.toName);
            msgData = msgData.replace("#{msgTime}",formatDate(data.createdTime));
            msgData = msgData.replace("#{msgContent}",data.content);
            $(".note-content-list-node").append(msgData);
            /*swal({
                title: "消息详情",
                text: "消息:"+json.data
            })*/
            var replyData = json.data.replyList;
            for (var i=0;i<replyData.length;i++){
                var liData = "<li  class=\"note-content-follow-list-node\">\n" +
                    "<p>#{fromName}：&nbsp;<span>@#{toName}</span></p>\n" +
                    "<p onclick='deleteReply(#{id})' >删除</p>\n" +
                    "<p>#{createTime}</p>\n" +
                    "<p>#{content}</p>\n" +
                    "</li>";
                liData = liData.replace("#{id}",replyData[i].id);
                liData = liData.replace("#{fromName}",replyData[i].fromNickname);
                liData = liData.replace("#{toName}",replyData[i].toNickname);
                liData = liData.replace("#{createTime}",replyData[i].replyTime);
                liData = liData.replace("#{content}",replyData[i].replyContent);
                $(".note-content-follow-list").append(liData);
            }
        }
    })
    $("#myModal").modal("show");
}

//回复一条消息
function replyMsg(){
    $(".reply-input").val("");
    $("#replyModal").modal("show");
    $(".submit-reply").off("click").click(function () {
        if ($(".reply-input").val() != ""){
            var url = "message/insertReply";
            var data = "messageID=" + msgID + "&replyContent=" + $(".reply-input").val();
            $.ajax({
                "url": url,
                "data": data,
                "dataType": "json",
                "type": "Post",
                "success": function (json) {
                    if (json.state == 200) {
                        swal ({
                            title: "提醒",
                            text: "回复成功"
                        })
                        $("#replyModal").modal("hide");
                        showContent(this_);
                    } else if (json.state == 406) {
                        swal ({
                            title: "提醒",
                            text: "回复出错了：" + json.state
                        })
                    }
                }
            })
        } else{
            alert("请先填写回复内容！");
        }

    })

}

//删除一条回复
function deleteReply(id) {
    $.ajax({
        "url": "message/deleteSingleReply",
        "data": "id=" + id,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                swal({
                    title: "删除成功！",
                    type: "success"
                })
                showContent(this_);
            }else{
                swal({
                    title: "提醒",
                    text: "删除出错了:" + json.state
                })
            }
        }
    })
}


// 删除一条消息
function deleteSingleMessage(elem) {
    $.ajax({
        "url": "person/deleteSingleMessage",
        "data": "id=" + elem.attr("id"),
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                swal({
                    title: "删除成功！",
                    type: "success"
                })
            }
        }
    })
}

// 展示简略的内容
function showOmit(str) {
    var result = "";
    if (str.length <= 20) {
        result = str;
    } else {
        result = str.substr(0, 20);
        result = result + ". . .";
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