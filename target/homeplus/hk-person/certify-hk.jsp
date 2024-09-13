<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人认证</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/certify-hk.js" charset="UTF-8"></script>
    <style>
        .container {
            max-width: 500px;
        }
        h3 {
            color: #0084ff;
            font-weight: bold;
        }
        label {
            font-weight: lighter;
        }
        form>div {
            margin-top: 20px;
        }
        .btn {
            margin-left: 35%;
        }

        /* 手持身份证的样式 */
        #myFile, #certifyFile {
            opacity: 0;
        }
        img {
            width: 200px;
            height: 150px;
            border: 1px solid #f7f7f7;
            margin-top: 10px;
        }
        .upload-label{
            text-align: center;
            background-color: #0084ff;
            color: #fff;
            display: block;
            width: 120px;
            height: 35px;
            line-height: 35px;
        }
        .col-md-6 {
            width: 200px;
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>家政人员认证</h3>
    <div class="certify-info" style="color: #0084ff; width: 100%; height: 100px; line-height: 100px; text-align: center; font-size: 40px; font-weight: bold">
        认证成功
    </div>
    <form id="certify" action="#" method="post" enctype="multipart/form-data">
        <div>
            <label for="">真实姓名:</label>
            <div>
                <input name="name" type="text" class="form-control">
            </div>
        </div>
        <div>
            <label for="">身份证号:</label>
            <div>
                <input name="cardID" type="text" class="form-control">
            </div>
        </div>
        <div>
            <div class="col-md-6">
                <label for="">手持身份证:</label>
                <div>
                    <label class="upload-label" for="myFile">上传手持身份证图片</label>
                    <img for="myFile" id="head-img" src="../images/list-head.png" alt="默认图片">
                    <input name="cardPhoto" type="file" id="myFile">
                </div>
            </div>

            <div class="col-md-6">
                <label for="">资格照片:</label>
                <div>
                    <label class="upload-label" for="certifyFile">上传资格图片</label>
                    <img for="certifyFile" id="certify-img" src="../images/list-head.png" alt="默认图片">
                    <input name="certifyPhoto" type="file" id="certifyFile">
                </div>
            </div>
        </div>
        <div>
            <button class="submit-certify btn btn-primary">确认修改</button>
        </div>
    </form>
</div>
</body>
</html>
<script>

</script>

