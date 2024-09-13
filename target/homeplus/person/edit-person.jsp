<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑个人资料</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/edit-person.js" charset="UTF-8"></script>
    <style>
        #myFile {
            opacity: 0;
        }
        h3 {
            color: #0084ff;
            font-weight: bold;
        }

        .title {
            font-size: 18px;
            border-bottom: 1px solid #0084ff;
            margin-top: 20px;
            padding-bottom: 5px;
        }
        img {
            width: 120px;
            height: 120px;
            border: 1px solid #f7f7f7;
            margin-top: 10px;
        }
        #upload-label{
            text-align: center;
            background-color: #0084ff;
            color: #fff;
            display: block;
            width: 120px;
            height: 35px;
            line-height: 35px;
        }
        .input-group {
            margin-top: 10px;
        }
        .input-group input {
            margin-left: 20px;
            padding-left: 10px;
            border: 0px;
        }
        .input-group button {
            margin-left: 20px;
        }

        .edit label {
            font-size: 12px;
            font-weight: lighter;
        }
        .edit-btn {
            width: 50px;
            height: 25px;
            background-size: 18px 18px;
            background-image: url("../images/edit.png");
            background-repeat: no-repeat;
            margin-left: 20px;
            cursor: pointer;
        }
        .edit-btn label {
            color: #0084ff;
            padding-left: 17px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>个人资料</h3>
        <!--<div class="head">-->
            <!--<div class="title">修改头像</div>-->
            <!--<div>-->
                <!--<img id="head-img" src="images/list-head.png" alt="默认头像">-->
                <!--<input name="avatarFile" type="file" id="myFile">-->
                <!--<label id="upload-label" for="myFile">上传头像</label>-->
            <!--</div>-->
        <!--</div>-->

        <div class="edit">
            <div class="title">修改个人资料</div>
            <form id="info" action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                <div class="head">
                    <div>
                        <img id="head-img" src="../images/list-head.png" alt="默认头像">
                        <input name="avatarFile" type="file" id="myFile">
                        <label id="upload-label" for="myFile">上传头像</label>
                    </div>
                </div>
                <div class="input-group">
                    <label for="">用户名：</label>
                    <input name="real_name" type="text" class="name" readonly="readonly">
                </div>
                <div class="input-group">
                    <label for="">性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
                    <input name="cmsex" type="text" class="cmsex" readonly="readonly">
                </div>
                <div class="input-group">
                    <label for="">昵&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
                    <input name="nickname" type="text" class="nickname" readonly="readonly">
                    <span class="edit-btn">
                        <label for="">修改</label>
                    </span>
                </div>
                <div class="input-group">
                    <label for="">手&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
                    <input name="phone" type="text" class="phone" readonly="readonly">
                </div>
                <div class="input-group">
                    <label for="">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
                    <input name="email" type="text" class="email" readonly="readonly">
                    <span class="edit-btn">
                        <label for="">修改</label>
                    </span>
                </div>
                <div class="input-group">
                    <label for="">地&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
                    <input name="address" type="text" class="address" readonly="readonly">
                    <span class="edit-btn">
                        <label for="">修改</label>
                    </span>
                </div>
                <div class="input-group">
                    <button class="submit-info btn btn-primary">提交</button>
                    <button class="btn btn-default">取消</button>
                </div>
            </form>

        </div>
    </div>
</body>
</html>
<script>

</script>