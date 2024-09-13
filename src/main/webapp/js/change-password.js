$(document).ready(function () {
    $(".submit-update").click(function () {
        if (!checkPassword()) {
            alert("两次新密码输入不同，请重新输入");
        } else {
            updatePassword();
        }
    })
})

function checkPassword() {
    var newPwd = $("#newPassword").val();
    var againNewPwd = $("#againNewPassword").val();
    if (newPwd != againNewPwd) {
        return false;
    } else {
        return true;
    }
}

function updatePassword() {
    var url = "updatePassword";
    var oldPassword = $("#oldPassword").val();
    var newPassword = $("#newPassword").val();
    var data = "oldPassword=" + oldPassword + "&newPassword=" + newPassword;
    $.ajax({
        "url": url,
        "data": data,
        "dataType": "json",
        "type": "Post",
        "success": function (json) {
            if (json.state == 200) {
                alert("修改成功...")
                window.location.href = "../login.jsp";
            } else if (json.state == 405) {
                alert(json.message)
            }
        }
    })
}