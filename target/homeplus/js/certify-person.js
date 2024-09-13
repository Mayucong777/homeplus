$(document).ready(function () {
    previewHead();

    loadCertifyStatus();
    loadCertify();
    // 点击发送认证
    $(".submit-certify").click(function () {
        certifyCustomer();
    })
})

function certifyCustomer() {
    var url = "certifyCustomer";
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

function loadCertifyStatus() {
    $.ajax ({
        "url": "getCertifyStatus",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                if (json.data == 1) {
                    $(".certify-info").show();
                    $("#certify input").attr("readonly","readonly");
                    $("#certify").show();
                } else if (json.data == 0) {
                    $(".certify-info").text("还未提交认证资料")
                    $(".certify-info").show()
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

// 加载认证信息...
function loadCertify() {
    var url = "selectCertifyCustomer";
    $.ajax({
        "url": url,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            $("input[name='name']").val(json.data.cmName);
            $("input[name='cardID']").val(json.data.cmCardID);
            $("#head-img").attr("src", json.data.cmCardPhoto);
        }
    })
}

// 头像预览
function previewHead() {
    var file = document.getElementById("myFile");
    file.onchange = function(){  // 文本框内容改变时触发
        var files = this.files; // 获取文件的数量
        for(var i=0;i<files.length;i++){
            readers(files[i])
        }
    }
    function readers(fil){
        var reader = new FileReader();  // 异步读取存储在用户计算机上的文件
        reader.readAsDataURL(fil); // 开始读取指定的Blob对象或File对象中的内容
        reader.onload = function(){
            document.getElementById("head-img").src = reader.result;  // 添加图片到指定容器中
        };
    }
}