$(document).ready(function () {
    loadtype();
    loadCompany();
    loadHK();
    $(".type-edit-btn").click(function () {
        $("#selectType").modal("show");
    });

    $(".company-edit-btn").click(function () {
        $("#selectCompany").modal("show");
    });

    $(".submit-update").click(function () {
        updateHK();
    });
})

var typeIDlist = "-1";//默认
var companyID = -1;//默认

function changeType() {

    var type_name = "";
    for (var i = 0; i < $("#type-select").find("option:selected").length; i++) {
        if (i == 0) {
            type_name = $("#type-select").find("option:selected")[i].innerText;
        } else {
            type_name = type_name + ',' + $("#type-select").find("option:selected")[i].innerText;
        }
    }
    $("#type").val(type_name);
    typeIDlist = $("#type-select").val();
    $("#selectType").modal("hide");
}

function changeCompany() {

    var companyName = $("#company-select").find("option:selected").text();
    $("#company").val(companyName);
    companyID = $("#company-select").val();
    $("#selectCompany").modal("hide");

}

//加载所有小类型，因为订单的生成是根据小类型来的
function loadtype() {
    var url = "getAllTypeDetail";
    $.ajax({
        "url": url,
        "type": "post",
        "success": function (json) {
            if (json.state == 200) {
                var list = json.data;
                for (var i = 0; i < list.length; i++) {
                    var appTypeDetailData = "<option id='#{small_type_id}' value='#{value}'>#{small_type_name}</option>";
                    appTypeDetailData = appTypeDetailData.replace("#{small_type_name}", list[i].name);
                    appTypeDetailData = appTypeDetailData.replace("#{small_type_id}", list[i].id);
                    appTypeDetailData = appTypeDetailData.replace("#{value}", list[i].id);
                    $("#type-select").append(appTypeDetailData);
                }
            }
        }
    })
}

function loadHK() {
    $.ajax({
        "url": "getHKPerson",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                $("#slogan").val(json.data.hkSlogan);
                $("#desc").val(json.data.hkDesc);
                $("#desc_detail").val(json.data.hkDescDetail);
                $("#type").val(json.data.typeNameList);
                $("#company").val(json.data.companyName);
                /*$("#type").selectpicker('val', splitList(json.data.typeNameList));
                $("#type").selectpicker('refresh');
                $("#company").selectpicker('val',json.data.companyName);
                $("#company").selectpicker('refresh');*/
                $("#type-select").selectpicker('val', splitList(json.data.typeNameList));
                $("#type-select").selectpicker('refresh');
                $("#company-select").selectpicker('val',json.data.companyName);
                $("#company-select").selectpicker('refresh');
            }
        }
    })
}

function updateHK() {
    var url = "updateHKPerson";
    var data = "slogan=" + $("#slogan").val() + "&desc=" + $("#desc").val() + "&desc_detail="
        + $("#desc_detail").val() + "&typelist=" + typeIDlist/*$("#type").val()*/ + "&company="
        + companyID /*$("#company").val()*/ + "&settle=" + $("#settle_type").val();
    $.ajax({
        "url": url,
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                swal({
                    title: "提醒",
                    text: "修改成功！"
                });
                loadHK();
            }
        }
    })
}

// 加载已经认证过的公司
function loadCompany() {
    $.ajax({
        "url": "getAllCertifyCompany",
        "type": "Post",
        "success": function (json) {
            var list = json.data;
            // $("#company");
            for (var i = 0; i < list.length; i++) {
                var optionData = "<option id='#{id}' value='#{value}'>#{name}</option>";
                optionData = optionData.replace("#{id}", list[i].id);
                optionData = optionData.replace("#{value}", list[i].id);
                optionData = optionData.replace("#{name}", list[i].name);
                $("#company-select").append(optionData);
            }
        }
    })
}

function splitList(str) {
    return str.split(",");
}
