
$(document).ready(function () {
    previewHead();

    loadCompanyCertifyInfo();

    $("#registerCompany").modal("hide");
    //点击注册新公司
    $(".register-company").click(function () {
        /*$(".submit-certify").style.display="";
        $(".btn-default").style.display="";
        $("#upload-label").style.display="";
        $(".form-control").removeAttr("readonly");*/
        $("#registerCompany").modal("show");
    });

    // 点击发送认证
    $(".submit-certify").click(function () {
        certifyCompany();
    });

    //取消
    $(".btn-default").click(function () {
        /*$(".submit-certify").style.display="none";
        $(".btn-default").style.display="none";
        $("#upload-label").style.display="none";
        $(".form-control").setAttribute("readonly",readOnly);*/
        $("#registerCompany").modal("hide");
    });


})

function loadCompanyCertifyInfo() {
    var url = "loadCompanyCertifyInfo";
    $.ajax({
        "url": url,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if(json.state == 200){
                    var data = json.data;
                    $("input[name='name']").val(data.name);
                    $("input[name='phone']").val(data.phone);
                    $("input[name='address']").val(data.address);
                    $("input[name='regID']").val(data.busRegNum);
                    $("#head-img-show").attr("src", "../" + data.busLicPhoto);
                    $(".certify-info").show();
            }else if (json.state == 406){
                $(".certify-info").text("还未提交认证资料");
                $(".certify-info").show();
            }
        }
    })
}

function certifyCompany() {
    var url = "certifyCompany";
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
                swal({
                    title: "提醒",
                    text: "提交注册成功！"
                })
                $("#registerCompany").modal("hide");
            } else {
                alert("修改失败");
            }
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