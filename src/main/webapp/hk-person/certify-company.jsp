<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人认证</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/sweetalert.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/sweeralert.min.js"></script>
    <script src="../js/certify-company.js" charset="UTF-8"></script>
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
            margin-top: 10px;
        }
        .btn {
            margin-left: 35%;
        }

        /* 手持身份证的样式 */
        #myFile {
            opacity: 0;
        }
        img {
            width: 200px;
            height: 150px;
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
    </style>
</head>
<body>
    <div class="container">
        <h3>公司认证</h3>
        <div class="certify-info" style="color: #0084ff; width: 100%; height: 100px; line-height: 100px; text-align: center; font-size: 40px; font-weight: bold">
            认证成功
        </div>
        <form  action="#" method="post" enctype="multipart/form-data">
            <div>
                <label for="">公司名字:</label>
                <div>
                    <input name="name" type="text" class="form-control" readonly="readonly">
                </div>
            </div>
            <div>
                <label for="">公司手机号:</label>
                <div>
                    <input name="phone" type="text" class="form-control" readonly="readonly">
                </div>
            </div>

            <div>
                <label for="">公司地址:</label>
                <div>
                    <input name="address" type="text" class="form-control" readonly="readonly">
                </div>
            </div>

            <div>
                <label for="">公司营业执照注册号:</label>
                <div>
                    <input name="regID" type="text" class="form-control" readonly="readonly">
                </div>
            </div>

            <div>
                <label for="">公司营业执照注册照片:</label>
                <div>
                    <label id="upload-label-show" for="myFile-show"  style="display: none">上传营业执照注册图片</label>
                    <img for="myFile" id="head-img-show" src="../images/list-head.png" alt="默认图片">
                    <input name="regPhoto" type="file" id="myFile-show" style="display: none">
                </div>
            </div>
            <div>
                <button class="register-company btn btn-primary" type="button">申请注册新公司</button>
                <button class="submit-certify btn btn-primary" style="display: none">提交注册</button>
                <button class="btn btn-default" style="display: none">取消</button>
            </div>
        </form>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="registerCompany" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel2">
                            注册新公司
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form id="certify" role="form" action="#" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="input-line">
                                    <label for="">公司名字:</label>
                                    <div>
                                        <input name="name" type="text" class="form-control">
                                    </div>
                                </div>
                                <div>
                                    <label for="">公司手机号:</label>
                                    <div>
                                        <input name="phone" type="text" class="form-control">
                                    </div>
                                </div>

                                <div>
                                    <label for="">公司地址:</label>
                                    <div>
                                        <input name="address" type="text" class="form-control">
                                    </div>
                                </div>

                                <div>
                                    <label for="">公司营业执照注册号:</label>
                                    <div>
                                        <input name="regID" type="text" class="form-control">
                                    </div>
                                </div>

                                <div>
                                    <label for="">公司营业执照注册照片:</label>
                                    <div>
                                        <label id="upload-label" for="myFile" >上传营业执照注册图片</label>
                                        <img for="myFile" id="head-img" src="../images/list-head.png" alt="默认图片">
                                        <input name="regPhoto" type="file" id="myFile">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="submit-certify btn btn-primary">提交注册</button>
                        <button class="btn btn-default">取消</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </div>
</body>
</html>
<script>

</script>

