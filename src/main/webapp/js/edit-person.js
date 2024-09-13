$(document).ready(function () {
    previewHead();
    $(".edit-btn").click(function () {
        $(this).prev("input").removeAttr("readonly");
        $(this).prev("input").css({"border": "1px solid #0084ff"})
    })
    loadCustomerInfo();

    // 点击按钮上传资料
    $(".submit-info").click(function () {
        uploadInfo();
        loadCustomerInfo();
    })

})

// 加载用户的信息
function loadCustomerInfo() {
    var url = "selectCustomer";
    $.ajax({
        "url": url,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                $(".name").val(json.data.cmName);
                $(".nickname").val(json.data.cmNickname);
                $(".phone").val(json.data.cmPhone);
                $(".email").val(json.data.cmEmail);
                $(".address").val(json.data.cmAddress);
                $("#head-img").attr("src", json.data.cmHeadPhoto);
                if(json.data.cmSex=="1"){
                    $(".cmsex").val("男");
                }else if(js.data.cmSex=="0"){
                    $(".cmsex").val("女");
                }
            } else if (json.state == 407) {
                alert(json.message);
            }
        }
    })
}

function uploadInfo() {
    var formData = new FormData($("#info")[0]);
    var url = "updateCustomer";
    $.ajax({
        "url": url,
        "data": formData,
        "dataType": "json",
        "type": "Post",
        "contentType": false,
        "processData": false,
        "success": function (json) {
            if (json.state == 200) {
                alert("更新成功！");
            } else if (json.state == 408) {
                alert("更新失败！"+json.message);
            } else if (json.state== 406){
                alert("用户未登录！请先登录！")
                window.location.href = "../login.jsp";
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