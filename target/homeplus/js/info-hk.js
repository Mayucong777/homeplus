$(document).ready(function () {
    previewHead();
    $(".edit-btn").click(function () {
        $(this).prev("input").removeAttr("readonly");
        $(this).prev("input").css({"border": "1px solid #0084ff"})
    });
    $(".pwd-edit-btn").click(function () {
        $("#changePwd").modal("show");
    });
    loadHousekeeperInfo();

    // 点击按钮上传资料
    $(".submit-info").off("click").click(function () {
        uploadInfo();
    });

})

function changePassword() {
    var pwd = $("#pwd").val();
    var newpwd = $("#new-pwd").val();
    var newpwdagain = $("#new-pwd-again").val();
    if(newpwd != newpwdagain){
        alert("两次输入密码不一致！请重试!");
    }else if (pwd != $(".password").val()){
        alert("原密码输入错误！请重试！");
    }else{
        $(".password").val(newpwd);
        $("#changePwd").modal("hide");
    }
}

// 加载用户的信息
function loadHousekeeperInfo() {
    var url = "getHKPerson";
    $.ajax({
        "url": url,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                $(".name").val(json.data.hkName);
                $(".hksex").val(json.data.hkSex);
                $(".nickname").val(json.data.hkNickname);
                $(".phone").val(json.data.hkPhone);
                $(".password").val(json.data.hkPassword);
                $(".email").val(json.data.hkEmail);
                $("#head-img").attr("src", "../" + json.data.hkHeadphoto);
            } else if (json.state == 407) {
                alert(json.message);
            }
        }
    })
}

function uploadInfo() {
    var formData = new FormData($("#info")[0]);
    var url = "updateHousekeeperInfo";
    $.ajax({
        "url": url,
        "data": formData,
        "dataType": "json",
        "type": "Post",
        "contentType": false,
        "processData": false,
        "success": function (json) {
            if (json.state == 200) {
                alert("个人信息修改成功");
                loadHousekeeperInfo();
            } else if (json.state == 408) {
                alert("个人信息修改失败");
            }
        }
    })

}


// 用户头像的展示
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