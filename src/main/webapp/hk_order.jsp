<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商家订单页</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/order.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweeralert.min.js"></script>
    <script src="js/hk_order.js" charset="UTF-8"></script>
</head>
<body>
    <!-- 页面上的最上面导航 -->
    <nav class="navbar navbar-default">
    <div class="navbar-header">
        <a href="index.jsp"></a>
    </div>

    <div>
        <ul class="nav navbar-nav">
            <span style="display: none" id="role">${role}</span>
            <li>
                <a href="index.jsp">
                    <span class="glyphicon glyphicon-home"></span>
                    首页
                </a>
            </li>
            <li class="register">
                <a href="register.jsp">
                    <span class="glyphicon glyphicon-user"></span>
                    注册
                </a>
            </li>
            <li class="log-in">
                <a href="login.jsp">
                    <span class="glyphicon glyphicon-log-in"></span>
                    登录
                </a>
            </li>
            <li class="log-out">
                <a href="login.jsp">
                    <span class="glyphicon glyphicon-log-out"></span>
                    退出
                </a>
            </li>
            <li class="cm-person space">
                <a href="#">个人中心</a>
                <ul class="next-menu">
                    <li>
                        <a href="person.jsp">个人资料</a>
                    </li>
                    <li>
                        <a href="order.jsp">我的订单</a>
                    </li>
                    <li>
                        <a href="cm_app.jsp">我的预约</a>
                    </li>
                </ul>
            </li>
            <li class="hk-person space">
                <a href="#">家政人员中心</a>
                <ul class="next-menu">
                    <li>
                        <a href="hk_person.jsp">商家资料</a>
                    </li>
                    <li>
                        <a href="hk_app.jsp">预约列表</a>
                    </li>
                    <li>
                        <a href="hk_order.jsp">我的订单</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

    <div class="container">
        <h3>我的订单</h3>
        <div>

            <table class="table table-condensed table-hover ">
                <thead>
                    <tr style="height: 50px; line-height: 50px; background-color: #0084ff; color: #fff">
                        <th>编号</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>地点</th>
                        <th>预留电话</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <!--<tr>-->
                        <!--<th>01</th>-->
                        <!--<th>2019-02-14</th>-->
                        <!--<th>2020-03-14</th>-->
                        <!--<th>南京-寻乌-互通</th>-->
                        <!--<th>200</th>-->
                        <!--<th>18796283605</th>-->
                        <!--<th>-->
                            <!--<button class="btn btn-primary">完成</button>-->
                            <!--<button class="btn btn-primary">取消</button>-->
                            <!--<button class="btn btn-primary">删除</button>-->
                        <!--</th>-->
                    <!--</tr>-->
                </tbody>
            </table>

            <!-- 取消模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                取消订单
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form action="#" role="form">
                                <div class="form-group">
                                    <div class="input-line">
                                        取消原因：
                                        <input  class="reason form-control" type="text">
                                    </div>

                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="button" class="submit-reason btn btn-primary" data-dismiss="modal">提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

        </div>
    </div>
</body>
</html>
<script>

</script>