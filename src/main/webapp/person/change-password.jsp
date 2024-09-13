<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/change-password.js" charset="UTF-8"></script>
    <style>
        .container {
            max-width: 500px;
        }
        h3 {
            color: #0084ff;
            font-weight: bold;
        }
        form>div {
            margin-top: 20px;
        }
        label {
            font-weight: lighter;
        }
        .btn {
            margin-left: 35%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>
            密码设置
        </h3>
        <form action="#">
            <div>
                <label for="">旧密码</label>
                <div>
                    <input id="oldPassword" type="password" class="form-control">
                </div>
            </div>
            <div>
                <label>
                    新密码
                </label>
                <div>
                    <input id="newPassword" type="password" class="form-control">
                </div>
            </div>
            <div>
                <label>
                    确认密码
                </label>
                <div>
                    <input id="againNewPassword" type="password" class="form-control">
                </div>
            </div>
            <div>
                <button class="submit-update btn btn-primary">确认修改</button>
            </div>
        </form>
    </div>

</body>
</html>
<script>


</script>