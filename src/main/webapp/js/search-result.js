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
var typeid = request.QueryString("typeid");

// 页面加载函数...
$(document).ready(function () {
    filter();
    loadResult($(".housekeeper-list"), typeid);
    loginSuccess();
    filterResult($(".housekeeper-list"), typeid);
    $(".log-out").click(function () {
        logout();
    })
})

// 加载搜索结果
function loadResult(container, param) {
    var url = "result/loadSearchResult";
    var data = "param=" + param;
    $.ajax ({
        "url": url,
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                container.html("");
                var list = json.data;
                for (var i = 0; i < list.length; i ++) {
                    var optionData= "<div class=\"housekeeper-list-item clearfix\">\n" +
                        "<div class=\"col-md-3 headImg\">\n" +
                        "<img style='width: 170px; height: 130px;' src=\"#{hk_headPhoto}\" alt=\"家政人员照片\" class=\"img-rounded\">\n" +
                        "</div>\n" +
                        "<div class=\"col-md-6\">\n" +
                        "<div class=\"h4\">#{hk_Slogan}</div>\n" +
                        "<div>#{hk_hkDesc}</div>\n" +
                        "<div><a href=\"#\">#{hk_companyName}</a></div>\n" +
                        "<div>\n" +
                        // "<span class=\"badge\">金牌认证</span>\n" +
                        // "<span class=\"badge\">带娃能手</span>\n" +
                        "#{span_list}\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "<div class=\"col-md-3\">\n" +
                        "<a href=\"housekeeper.jsp?id=#{hk_id}\" class=\"btn btn-primary go-single\">进去看看</a>\n" +
                        "</div>\n" +
                        "</div>";
                    optionData = optionData.replace("#{hk_headPhoto}", list[i].hkHeadphoto);
                    optionData = optionData.replace("#{hk_id}", list[i].id);
                    optionData = optionData.replace("#{hk_hkDesc}", list[i].hkDesc);
                    optionData = optionData.replace("#{hk_Slogan}", list[i].hkSlogan);
                    optionData = optionData.replace("#{hk_companyName}", list[i].companyName);
                    optionData = optionData.replace("#{span_list}", getLabelList(list[i].hkLabel));
                    container.append(optionData);
                }
            }
        }
    })
}

// 实现筛选
function filterResult(container, id) {
    $(".select-list a").click(function () {
        if ($(this).text() == "全部") {
            loadResult($(".housekeeper-list"), typeid);
        } else {
            loadFilterResult(container, id, $(this).attr("id"));
        }
    })
}

function loadFilterResult(container, id, settle) {
    var url = "result/loadSearchResult";
    var data = "param=" + id;
    $.ajax({
        "url": url,
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            container.html("");
            if (json.state == 200) {
                var list = json.data;
                for (var i = 0; i < list.length; i ++) {
                    var optionData = "<div class=\"housekeeper-list-item clearfix\">\n" +
                        "<div class=\"col-md-3 headImg\">\n" +
                        "<img style='width: 170px; height: 130px;' src=\"#{hk_headPhoto}\" alt=\"家政人员照片\" class=\"img-rounded\">\n" +
                        "</div>\n" +
                        "<div class=\"col-md-6\">\n" +
                        "<div class=\"h4\">#{hk_Slogan}</div>\n" +
                        "<div>#{hk_hkDesc}</div>\n" +
                        "<div><a href=\"#\">#{hk_companyName}</a></div>\n" +
                        "<div>\n" +
                        // "<span class=\"badge\">金牌认证</span>\n" +
                        // "<span class=\"badge\">带娃能手</span>\n" +
                        "#{span_list}\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "<div class=\"col-md-3\">\n" +
                        "<a href=\"housekeeper.jsp?id=#{hk_id}\" class=\"btn btn-primary go-single\">进去看看</a>\n" +
                        "</div>\n" +
                        "</div>";
                    if (list[i].hkSettle == settle) {
                        optionData = optionData.replace("#{hk_headPhoto}", list[i].hkHeadphoto);
                        optionData = optionData.replace("#{hk_id}", list[i].id);
                        optionData = optionData.replace("#{hk_hkDesc}", list[i].hkDesc);
                        optionData = optionData.replace("#{hk_Slogan}", list[i].hkSlogan);
                        optionData = optionData.replace("#{hk_companyName}", list[i].companyName);
                        optionData = optionData.replace("#{span_list}", getLabelList(list[i].hkLabel));
                        container.append(optionData);
                    }else if (settle == "company-type" && list[i].companyName != "个人"){
                        optionData = optionData.replace("#{hk_headPhoto}", list[i].hkHeadphoto);
                        optionData = optionData.replace("#{hk_id}", list[i].id);
                        optionData = optionData.replace("#{hk_hkDesc}", list[i].hkDesc);
                        optionData = optionData.replace("#{hk_Slogan}", list[i].hkSlogan);
                        optionData = optionData.replace("#{hk_companyName}", list[i].companyName);
                        optionData = optionData.replace("#{span_list}", getLabelList(list[i].hkLabel));
                        container.append(optionData);
                    } else if (settle == "single-type" && list[i].companyName == "个人"){
                        optionData = optionData.replace("#{hk_headPhoto}", list[i].hkHeadphoto);
                        optionData = optionData.replace("#{hk_id}", list[i].id);
                        optionData = optionData.replace("#{hk_hkDesc}", list[i].hkDesc);
                        optionData = optionData.replace("#{hk_Slogan}", list[i].hkSlogan);
                        optionData = optionData.replace("#{hk_companyName}", list[i].companyName);
                        optionData = optionData.replace("#{span_list}", getLabelList(list[i].hkLabel));
                        container.append(optionData);
                    }
                }
            }
        }
    })
}

// 获取家政人员的徽章列表
function getLabelList(str) {
    var result = "";
    var list = str.split("-");
    for (var i = 0; i < list.length; i ++) {
        var optionData = "<span class=\"badge\">"+ list[i] +"</span>";
        result += optionData;
    }
    return result;
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
    $.ajax({
        "url": "user/logout",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                alert("退出成功...");
            }
        }
    })
}

// 筛选条件的函数
function filter() {
    $("#select2 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectB").remove();
        } else {
            var copyThisB = $(this).clone();
            if ($("#selectB").length > 0) {
                $("#selectB a").html($(this).text());
            } else {
                $(".select-result dl").append(copyThisB.attr("id", "selectB"));
            }
        }
    });
    $("#select3 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectC").remove();
        } else {
            var copyThisC = $(this).clone();
            if ($("#selectC").length > 0) {
                $("#selectC a").html($(this).text());
            } else {
                $(".select-result dl").append(copyThisC.attr("id", "selectC"));
            }
        }
    });
    $(".select dd").click(function () {
        if ($(".select-result dd").length > 1) {
            $(".select-no").hide();
        } else {
            $(".select-no").show();
        }
    });
}

