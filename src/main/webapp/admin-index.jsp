<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="家政服务后台管理">
    <meta name="keywords" content="家政服务后台管理">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>家政服务后台管理</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/admin-index.js"></script>
    <script src="js/address.js"></script>
    <script src="js/echarts-all.js"></script>
    <script>
        $(function() {
            $(".meun-item").click(function() {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function() {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function() {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function() {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function() {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function() {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/slide.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
    <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
    <script src="js/sweeralert.min.js"></script>
    <style type="text/css">
        input {
            color: #0084ff;
        }
    </style>
</head>

<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="家政服务后台管理" src="images/logo.png"><span>后台管理系统</span></p>
        </div>
        <div id="personInfor">
            <p>当前用户:<p id="userName">Admin</p></p>
            <p>
                <a href="../user/logout">退出登录</a>
            </p>
        </div>
        <div class="meun-title">账号管理</div>
        <div class="meun-item meun-item-active" href="#sour" aria-controls="sour" role="tab" data-toggle="tab"><img src="images/icon_source.png">量化查看</div>
        <!--<div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">权限管理</div>-->
        <div class="meun-item" id="login-manager" href="#user" aria-controls="user" role="tab" data-toggle="tab"><img src="images/icon_user_grey.png">账户管理</div>
        <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">修改密码</div>
        <div class="meun-title">认证管理</div>
        <div class="meun-item" href="#customer-scho" aria-controls="customer-scho" role="tab" data-toggle="tab"><img src="images/icon_card_grey.png">消费者认证</div>
        <div class="meun-item" href="#housekeeper-scho" aria-controls="housekeeper-scho" role="tab" data-toggle="tab"><img src="images/icon_card_grey.png">家政人员认证</div>
        <div class="meun-item" href="#company-scho" aria-controls="company-scho" role="tab" data-toggle="tab"><img src="images/icon_house_grey.png">商家认证</div>

    </div>
    <!-- 右侧具体内容栏目 -->
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- 资源管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="sour">
                <div id="orders" style="width: 50%;height:626px;float: left">

                </div>
                <div id="apps" style="width: 50%;height:626px;float: left">

                </div>
            </div>
            <!--用户管理模块-->
            <div role="tabpanel" class="tab-pane" id="user">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加用户 </button>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" class="search-input form-control input-sm" placeholder="输入手机号搜索">
                        <button class="search-btn btn btn-white btn-xs ">查 询 </button>
                    </div>
                    <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
                        <label for="paixu">排序:&nbsp;</label>
                        <select class=" form-control" >
                            <option>地区</option>
                            <option>地区</option>
                            <option>班期</option>
                            <option>性别</option>
                            <option>年龄</option>
                            <option>份数</option>
                        </select>
                    </div>
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2">
                            编号
                        </div>
                        <div class="col-xs-2">
                            注册号码
                        </div>
                        <div class="col-xs-2">
                            密码
                        </div>
                        <div class="col-xs-2">
                            角色
                        </div>
                        <div class="col-xs-2">
                            状态
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <div class="tablebody admin-tablebody">
                        <div class="row">
                            <div class="col-xs-2 ">
                                goodmoning
                            </div>
                            <div class="col-xs-2">
                                XXX地区
                            </div>
                            <div class="col-xs-2">
                                Admin
                            </div>
                            <div class="col-xs-2">
                                19912355555
                            </div>
                            <div class="col-xs-2">
                                状态
                            </div>
                            <div class="col-xs-2">
                                <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser">修改</button>
                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser">删除</button>
                            </div>
                        </div>

                    </div>

                </div>
                <!--页码块-->
                <footer class="footer">
                    <ul class="pagination">
                        <li>
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                            页
                        </li>
                        <li class="gray">
                            共20页
                        </li>
                        <li>
                            <i class="glyphicon glyphicon-menu-left">
                            </i>
                        </li>
                        <li>
                            <i class="glyphicon glyphicon-menu-right">
                            </i>
                        </li>
                    </ul>
                </footer>

                <!--弹出添加用户窗口-->
                <div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">角色：</label>
                                            <div class="col-xs-8">
                                                <select class="type form-control select-duiqi">
                                                    <option value="-1">管理员</option>
                                                    <option value="0" selected>消费者</option>
                                                    <option value="1">家政人员</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group option">
                                            <label for="sName" class="col-xs-3 control-label">用户名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="" class="nickname form-control input-sm duiqi" id="sName" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group option option-name">
                                            <label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="" class="name form-control input-sm duiqi" id="sLink" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group option option-gender">
                                            <label for="sOrd" class="col-xs-3 control-label">性别：</label>
                                            <div class="col-xs-8">
                                                <!--<input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">-->
                                                <select class="gender form-control select-duiqi">
                                                    <option value="1">男</option>
                                                    <option value="0">女</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group option option-phone">
                                            <label for="sKnot1" class="col-xs-3 control-label">电话：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="phone form-control input-sm duiqi" id="sKnot1" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group option">
                                            <label for="sKnot2" class="col-xs-3 control-label">邮箱：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="email form-control input-sm duiqi" id="sKnot2" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group option option-password">
                                            <label for="sKnot3" class="col-xs-3 control-label">初始密码：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="init-password form-control input-sm duiqi" id="sKnot3" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group option">
                                            <label for="sKnot4" class="col-xs-3 control-label">地址：</label>
                                            <div class="col-xs-8" id="sKnot4">
                                                <select class="province form-control select-duiqi" id="province" name="province"></select>
                                                <select class="city form-control select-duiqi" id="city" name="city"></select>
                                                <select class="area form-control select-duiqi" id="area" name="area"></select>
                                            </div>
                                        </div>



                                        <!-- 状态栏 -->
                                        <!--<div class="form-group option">-->
                                            <!--<label for="situation" class="col-xs-3 control-label">状态：</label>-->
                                            <!--<div class="col-xs-8">-->
                                                <!--<label class="control-label" for="anniu">-->
                                                    <!--<input type="radio" name="situation" id="normal" checked="checked" value="1">正常</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                                                <!--<label class="control-label" for="meun">-->
                                                    <!--<input type="radio" name="situation" id="forbid" value="0"> 禁用</label>-->
                                            <!--</div>-->
                                        <!--</div>-->
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="submit btn btn-xs btn-green" id="submit">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--弹出修改用户窗口-->
                <div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <!--<div class="form-group ">-->
                                            <!--<label for="sName" class="col-xs-3 control-label">用户名：</label>-->
                                            <!--<div class="col-xs-8 ">-->
                                                <!--<input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">-->
                                            <!--</div>-->
                                        <!--</div>-->
                                        <!--<div class="form-group">-->
                                            <!--<label for="sLink" class="col-xs-3 control-label">真实姓名：</label>-->
                                            <!--<div class="col-xs-8 ">-->
                                                <!--<input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">-->
                                            <!--</div>-->
                                        <!--</div>-->
                                        <!--<div class="form-group">-->
                                            <!--<label for="sOrd" class="col-xs-3 control-label">性别：</label>-->
                                            <!--<div class="col-xs-8">-->
                                                <!--<input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">-->
                                            <!--</div>-->
                                        <!--</div>-->
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">密码：</label>
                                            <div class="col-xs-8">
                                                <input type="" class="user-password form-control input-sm duiqi" id="sKnot" placeholder="">
                                            </div>
                                        </div>
                                        <!--<div class="form-group">-->
                                            <!--<label for="sKnot" class="col-xs-3 control-label">地区：</label>-->
                                            <!--<div class="col-xs-8">-->
                                                <!--<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">-->
                                            <!--</div>-->
                                        <!--</div>-->
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">权限：</label>
                                            <div class="col-xs-8">
                                                <select class="user-role form-control select-duiqi">
                                                    <option value="-1">管理员</option>
                                                    <option value="0" selected>消费者</option>
                                                    <option value="1">家政人员</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="situation" class="col-xs-3 control-label">状态：</label>
                                            <div class="col-xs-8">
                                                <label class="control-label" for="anniu">
                                                    <input type="radio" name="user-status" id="normal" value="1">正常</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <label class="control-label" for="meun">
                                                    <input type="radio" name="user-status" id="forbid" value="0"> 禁用</label>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="submit-info btn btn-xs btn-green">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--弹出删除用户警告窗口-->
                <div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该用户？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="submit-delete btn  btn-xs btn-danger">确 定</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>

                <!-- /.modal -->

            </div>
            <!-- 修改密码模块 -->
            <div role="tabpanel" class="tab-pane" id="chan">
                <div class="check-div">
                </div>
                <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">原密码：</label>
                            <div class="col-xs-5">
                                <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">新密码：</label>
                            <div class="col-xs-5">
                                <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
                            <div class="col-xs-5">
                                <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green">保 存</button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <!--认证管理模块-->
            <!-- 消费者认证模块 -->
            <div role="tabpanel" class="tab-pane" id="customer-scho">
                <h4>消费者认证模块</h4>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            编号
                        </div>
                        <div class="col-xs-2 ">
                            真实姓名
                        </div>
                        <div class="col-xs-3">
                            身份证号
                        </div>
                        <div class="col-xs-2">
                            查看
                        </div>
                        <div class="col-xs-3">
                            操作
                        </div>
                    </div>
                    <div class="cm-tablebody tablebody">

                    </div>

                </div>

                <!--弹出消费者不予认证的窗口-->
                <div class="modal fade" id="uncertifyCustomer" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">原因：</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <textarea class="form-control" style="width: 80%;margin-left: 10px" rows="3"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-green">提 交</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!-- 消费者认证详情模态框 -->
                <div class="modal fade" id="customerDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                    <h5 class="modal-title" id="myModalLabel">
                                        消费者认证详情
                                    </h5>
                            </div>
                            <div class="modal-body">
                                <form action="#" role="form">
                                    <div class="form-group">
                                        <div class="input-line">
                                            真实姓名：
                                            <input style="color: #000;" class="cm-name form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            联系方式：
                                            <input style="color: #000;" class="cm-phone form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            身份证号：
                                            <input style="color: #000;" class="cm-cardID form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            身份证照片：
                                            <div>
                                                <img style="width: 370px; height: 250px;" class="cm-cardPhoto" src="" alt="加载中...">
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

            </div>

            <!-- 家政人员认证模块 -->
            <div role="tabpanel" class="tab-pane" id="housekeeper-scho">
                <h4>家政人员认证模块</h4>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            编号
                        </div>
                        <div class="col-xs-2 ">
                            真实姓名
                        </div>
                        <div class="col-xs-3">
                            身份证号
                        </div>
                        <div class="col-xs-2">
                            查看
                        </div>
                        <div class="col-xs-3">
                            操作
                        </div>
                    </div>
                    <div class="hk-tablebody tablebody">

                    </div>

                </div>

                <!--弹出家政人员不予认证的窗口-->
                <div class="modal fade" id="uncertify-housekeeper" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">原因</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <textarea class="form-control" style="width: 80%;margin-left: 10px" rows="3"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-green">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!-- 家政人员认证详情模态框 -->
                <div class="modal fade" id="housekeeperDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        家政人员认证详情
                                    </h4>
                            </div>
                            <div class="modal-body">
                                <form action="#" role="form">
                                    <div class="form-group">
                                        <div class="input-line">
                                            真实姓名：
                                            <input style="color: #000;"  class="hk-name form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            联系方式：
                                            <input style="color: #000;" class="hk-phone form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            身份证号：
                                            <input style="color: #000;" class="hk-cardID form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            身份证照片：
                                            <div>
                                                <img style="width: 370px; height: 250px;" class="hk-cardPhoto" src="" alt="加载中...">
                                            </div>
                                        </div>

                                        <div class="input-line">
                                            资格照片：
                                            <div>
                                                <img style="width: 370px; height: 250px;" class="hk-certifyPhoto" src="" alt="加载中...">
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>

            <!-- 公司认证模块 -->
            <div role="tabpanel" class="tab-pane" id="company-scho">
                <h4>公司认证模块</h4>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            编号
                        </div>
                        <div class="col-xs-2 ">
                            公司姓名
                        </div>
                        <div class="col-xs-2">
                            公司联系方式
                        </div>
                        <div class="col-xs-2">
                            注册号
                        </div>
                        <div class="col-xs-2">
                            查看
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <div class="cp-tablebody tablebody">

                    </div>

                </div>

                <!--弹出公司认证的窗口-->
                <div class="modal fade" id="uncertify-company" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改地区</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <textarea class="form-control" style="width: 80%;margin-left: 10px" rows="3"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-green">保 存</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!-- 公司认证详情模态框 -->
                <div class="modal fade" id="companyDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        公司认证详情
                                    </h4>
                            </div>
                            <div class="modal-body">
                                <form action="#" role="form">
                                    <div class="form-group">
                                        <div class="input-line">
                                            公司姓名：
                                            <input style="color: #000;"  class="cp-name form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            公司联系方式：
                                            <input style="color: #000;" class="cp-phone form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            公司地址：
                                            <input style="color: #000;" class="cp-address form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            公司营业注册号：
                                            <input style="color: #000;" class="cp-regID form-control" type="text" readonly="readonly">
                                        </div>

                                        <div class="input-line">
                                            公司营业执照照片：
                                            <div>
                                                <img style="width: 370px; height: 250px;" class="cp-regPhoto" src="" alt="加载中...">
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

            </div>

        </div>
    </div>
</div>

<script src="js/jquery.nouislider.js"></script>


<script>
    //min/max slider
    function huadong(my, unit, def, max) {
        $(my).noUiSlider({
            range: [0, max],
            start: [def],
            handles: 1,
            connect: 'upper',
            slide: function() {
                var val = Math.floor($(this).val());
                $(this).find(".noUi-handle").text(
                    val + unit
                );
                console.log($(this).find(".noUi-handle").parent().parent().html());
            },
            set: function() {
                var val = Math.floor($(this).val());
                $(this).find(".noUi-handle").text(
                    val + unit
                );
            }
        });
        $(my).val(def, true);
    }
    huadong('.slider-minmax1', "分钟", "5", 30);
    huadong('.slider-minmax2', "分钟", "6", 15);
    huadong('.slider-minmax3', "分钟", "10", 60);
    huadong('.slider-minmax4', "次", "2", 10);
    huadong('.slider-minmax5', "天", "3", 7);
    huadong('.slider-minmax6', "天", "8", 10);
</script>
</body>

</html>