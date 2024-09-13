<!-- 获取参数 -->
var request = {
    QueryString : function(val) {
        var uri = window.location.search;
        var re = new RegExp("" +val+ "\=([^\&\?]*)", "ig");
        return ((uri.match(re))?(uri.match(re)[0].substr(val.length+1)):null);
    },
    QueryStrings : function() {
        var uri = window.location.search;
        var re = /\w*\=([^\&\?]*)/ig;
        var retval=[];
        while ((arr = re.exec(uri)) != null)
            retval.push(arr[0]);
        return retval;
    },
    setQuery : function(val1, val2) {
        var a = this.QueryStrings();
        var retval = "";
        var seted = false;
        var re = new RegExp("^" +val1+ "\=([^\&\?]*)$", "ig");
        for(var i=0; i<a.length; i++) {
            if (re.test(a[i])) {
                seted = true;
                a[i] = val1 +"="+ val2;
            }
        }
        retval = a.join("&");
        return "?" +retval+ (seted ? "" : (retval ? "&" : "") +val1+ "=" +val2);
    }
}
var id = request.QueryString("id");



$(document).ready(function () {
    loginSuccess();
    showDiff();
    showContent(id);
    loadComment(id);
    initCompanyInfo(id);
    message(id);
    $(".log-out").click (function () {
        logout();
    })
})

//加载公司地址和图片
function initCompanyInfo(id) {
    var url = "hk-person/loadCompanyInfo";
    var data = "param=" + id;
    $.ajax ({
        "url": url,
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                $(".address").text(json.data.address);
                //$(".head").attr({"src": json.data.busLicPhoto});
                var serviceArray = json.data.companyService.split("-");
                for(var i=0;i < serviceArray.length; i++){
                    var serviceData = "<li>\n" +
                        "<img src=\"images/checked.png\"  alt=\"勾选图片\">\n" +
                        "<span>#{service}</span>\n" +
                        "</li>";
                    serviceData = serviceData.replace("#{service}",serviceArray[i]);
                    $("#companyService").append(serviceData);
                }
            }
        }
    })
}

// 加载家政人员的信息
function showContent(id) {
    var url = "hk-person/loadContent";
    var data = "param=" + id;
    $.ajax ({
        "url": url,
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                $(".title").text(json.data.hkName);
                $(".slogan").text(json.data.hkSlogan);
                $(".nickname").text(json.data.hkNickname);
                $(".describe").text(json.data.hkDesc);
                $(".company").text(json.data.companyName);
                //$(".address").text();
                $(".phone").text(displayPhone(json.data.hkPhone));
                $(".desc_detail").text(json.data.hkDescDetail);
                $(".head").attr({"src": json.data.hkHeadphoto});
                showPhone(json.data.hkPhone);
            }
        }
    })
}

function showPhone(str) {
    $(".contact-btn").parent().on("click", "button", function () {
        $("#myModal").modal("show");
        $(".app_phone").text(str)
    })
}

// 发送消息
function message(id) {
    $(".left-msg").click(function () {
        $("#messageModal").modal("show");
    })

    $(".submit-msg").click(function () {
        var url = "message/insertMessage";
        var data = "id=" + id + "&msgContent=" + $(".msg-input").val();
        $.ajax({
            "url": url,
            "data": data,
            "dataType": "json",
            "type": "Post",
            "success": function (json) {
                if (json.state == 200) {
                    swal ({
                        title: "提醒",
                        text: "留言成功"
                    })
                    $("#messageModal").modal("hide");
                } else if (json.state == 409) {
                    swal ({
                        title: "提醒",
                        text: json.message
                    })
                }
            }
        })
    })
}


// 加载评价
function loadComment(id) {
    var url = "hk-person/loadComment";
    var data = "param=" + id;
    $.ajax ({
        "url": url,
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                var data = json.data;
                $(".good-percent").text(getGoodPercent(data) + "%");
                $(".good-num").text(getGoodNum(data) + "人");
                $(".middle-num").text(getMiddleNum(data) + "人");
                $(".bad-num").text(getBadNum(data) + "人");
                var goodPercent = getGoodPercent(data) + "%";
                var middlePercent = ((getMiddleNum(data)/data.length)*100).toFixed(1) + "%";
                var badPercent = ((getBadNum(data)/data.length)*100).toFixed(1) + "%";
                $(".good-progress").css("width", goodPercent);
                $(".middle-progress").css("width", middlePercent);
                $(".bad-progress").css("width", badPercent);

                for (var i = 0; i < data.length; i ++) {
                    var optionData = "<div class=\"single-comment\">\n" +
                        "<div>\n" +
                        "<span>\n" +
                        "<img src=\"#{img_src}\" alt=\"好评\">\n" +
                        "#{comment_type}\n" +
                        "</span>\n" +
                        "<span class=\"single-comment-author\">\n" +
                        "评论者：<span>#{comment_publicer}</span>\n" +
                        "</span>\n" +
                        "</div>\n" +
                        "<div class=\"single-comment-content\">\n" +
                        "#{comment_Content}\n" +
                        "</div>\n" +
                        "<div class=\"single-comment-time\">\n" +
                        "#{comment_time}\n" +
                        "</div>\n" +
                        "</div>";
                    if (data[i].commentStar == 2) {
                        optionData = optionData.replace("#{comment_type}", "好评");
                        optionData = optionData.replace("#{img_src}", "images/good.png");
                    } else if (data[i].commentStar == 1) {
                        optionData = optionData.replace("#{comment_type}", "中评");
                        optionData = optionData.replace("#{img_src}", "images/middle.png");
                    } else if (data[i].commentStar == 0) {
                        optionData = optionData.replace("#{comment_type}", "差评");
                        optionData = optionData.replace("#{img_src}", "images/bad.png");
                    }
                    optionData = optionData.replace("#{comment_publicer}", data[i].commentPublicer);
                    optionData = optionData.replace("#{comment_Content}", data[i].commentContent);
                    optionData = optionData.replace("#{comment_time}", formatDate(data[i].commentTime));
                    $(".comment").append(optionData);
                }
            }
        }
    })

}


// 获得好评率
function getGoodPercent(data) {
    var result = (getGoodNum(data)/data.length);
    return (result*100).toFixed(1);
}

// 获得好评数
function getGoodNum(data) {
    var goodNum = 0;
    for (var i = 0; i < data.length; i ++) {
        if (data[i].commentStar == 2) {
            goodNum++;
        }
    }
    return goodNum;
}

// 获得中评数
function getMiddleNum(data) {
    var middleNum = 0;
    for (var i = 0; i < data.length; i ++) {
        if (data[i].commentStar == 1) {
            middleNum ++;
        }
    }
    return middleNum;
}

// 获得差评数
function getBadNum(data) {
    var badNum = 0;
    for (var i = 0; i < data.length; i ++) {
        if (data[i].commentStar == 0) {
            badNum ++;
        }
    }
    return badNum;
}

function displayPhone(phone) {
    return phone.substr(0,4) + "****" + phone.substr(8, 3)
}
// 规范时间格式，将毫秒数转换为正常时间
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

// 点击不同的按钮，显示不同界面
function showDiff() {
    $("#comments").hide();
    $("#diff-one").click(function () {
        $(this).css({"background-color": "#0084ff", "color": "#fff"})
        $("#diff-two").css({"background-color": "#efefef", "color": "#000"})
        $("#housekeeper-desc").show()
        $("#comments").hide()
    })
    $("#diff-two").click(function () {
        $(this).css({"background-color": "#0084ff", "color": "#fff"})
        $("#diff-one").css({"background-color": "#efefef", "color": "#000"})
        $("#housekeeper-desc").hide()
        $("#comments").show()
    })
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