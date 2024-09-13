$(document).ready(function () {

    previewCardFile();
    previewCertifyFile();

    loadCertify();
    loadCertifyStatus();

    // 点击发送认证
    $(".submit-certify").click(function () {
        certifyHousekeeper();
    })
})

// 加载家政人员的认证状态
function loadCertifyStatus() {
    $.ajax ({
        "url": "getCertifyStatus",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                if (json.data == 1) {
                    $(".certify-info").show();
                    $("#certify input").attr("readonly","readonly");
                } else if (json.data == 0) {
                    $(".certify-info").text("还未提交认证资料");
                    $(".certify-info").show();
                    $("#certify").show();
                } else if (json.data == 2) {
                    $(".certify-info").text("审核中...")
                    $(".certify-info").show();
                    $("#certify input").attr("readonly","readonly");
                }
            }
        }
    })
}

// 家政人员认证
function certifyHousekeeper() {
    var url = "certifyHKPerson";
    var formData = new FormData($("#certify")[0]);
    $.ajax ({
        "url": url,
        "data": formData,
        "dataType": "json",
        "type": "Post",
        "contentType": false,
        "processData": false,
        "success": function (json) {
            if (json.state == 200) {
                alert("已经开始认证...");
            } else {
                alert();
            }
        }
    })
}

// 加载认证信息...
function loadCertify() {
    var url = "getHKPerson";
    $.ajax({
        "url": url,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                var data = json.data;
                $("input[name='name']").val(data.hkName);
                $("input[name='cardID']").val(data.hkCardID);
                $("#head-img").attr("src", "../" + data.hkCardPhoto);
                $("#certify-img").attr("src", "../" + data.hkCertifyPhoto);
            }
        }
    })
}

// 预览身份证
function previewCardFile() {
    var file = document.getElementById("myFile");
    file.onchange = function(){  // 文本框内容改变时触发
        var files = this.files; // 获取文件的数量
        for(var i=0;i<files.length;i++){
            readers(files[i])
        }
    }
    function readers(file){
        var reader = new FileReader();  // 异步读取存储在用户计算机上的文件
        reader.readAsDataURL(file); // 开始读取指定的Blob对象或File对象中的内容
        reader.onload = function(){
            document.getElementById("head-img").src = reader.result;  // 添加图片到指定容器中
        };
    }
}

function previewCertifyFile() {
    var file = document.getElementById("certifyFile");
    file.onchange = function(){  // 文本框内容改变时触发
        var files = this.files; // 获取文件的数量
        for(var i=0;i<files.length;i++){
            readers(files[i])
        }
    }
    function readers(file){
        var reader = new FileReader();  // 异步读取存储在用户计算机上的文件
        reader.readAsDataURL(file); // 开始读取指定的Blob对象或File对象中的内容
        reader.onload = function(){
            document.getElementById("certify-img").src = reader.result;  // 添加图片到指定容器中
        };
    }
}