<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商家资料</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/sweetalert.css">

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/sweeralert.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
    <script src="../js/edit-hk.js" charset="UTF-8"></script>
    <style>
        .container {
            max-width: 700px;
        }

        .submit-update {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 style="color: #0084ff; font-weight: bold">
        商家资料
    </h3>
    <form action="#">
        <div>
            <label for="slogan">宣传口号</label>
            <div>
                <input id="slogan" type="text" class="form-control">
            </div>
        </div>

        <div>
            <label for="desc">家政服务的简述</label>
            <div>
                <input id="desc" type="text" class="form-control">
            </div>
        </div>

        <div>
            <label for="desc_detail">家政服务的详述</label>
            <textarea id="desc_detail" class="form-control" rows="3" name=textarea></textarea>
        </div>

        <div>
            <label for="type">服务类别</label>
            <div>
                <input id="type" type="text" class="form-control" readonly="readonly">
            </div>
            <a class="type-edit-btn" style="color: #00BDEF">
                <label for="type">修改</label>
            </a>
        </div>

        <div>
            <label for="company">所在公司</label>
            <div>
                <input id="company" type="text" class="form-control" readonly="readonly">
            </div>
            <a class="company-edit-btn" style="color: #00BDEF;">
                <label for="company">修改</label>
            </a>
        </div>

        <div>
            <label for="settle_type">结算方式</label>
            <select id="settle_type" class="form-control">
                <option value="0">按单结算</option>
                <option value="1">按小时结算</option>
            </select>
        </div>

        <div>
            <button class="submit-update btn btn-primary">确认修改</button>
        </div>
    </form>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="selectType" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">
                        修改服务类型
                    </h4>
                </div>
                <div class="modal-body">
                    <form action="#" role="form">
                        <div class="form-group">
                            <select id="type-select" name="type" class="selectpicker show-tick form-control" multiple
                                    data-live-search="true">
                                <%--<option value="1">小时工</option>
                                <option value="2">月嫂</option>
                                <option value="3">护工</option>
                                <option value="4">长期雇佣</option>--%>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="type-btn" onclick="changeType()">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="selectCompany" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        修改所属公司
                    </h4>
                </div>
                <div class="modal-body">
                    <form action="#" role="form">
                        <div class="form-group">
                            <select id="company-select" name="company" class="selectpicker show-tick form-control"
                                    data-live-search="true">
                                <!--<option value="0">公司01</option>-->
                                <!--<option value="1">公司02</option>-->
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="company-btn" onclick="changeCompany()">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</div>
</body>
</html>
<script>


</script>