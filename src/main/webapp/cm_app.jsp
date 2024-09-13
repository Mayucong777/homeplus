<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>预约</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/appointment.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweeralert.min.js"></script>
    <script src="js/cm_app.js" charset="UTF-8"></script>
    <style>
        .confirm {
            height: 20px;
            padding-top: 0px;
            margin-left: 100px;
        }
    </style>
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
        <h3>我的预约</h3>
        <div>
            <table class="table table-condensed table-hover ">
                <thead>
                    <tr style="height: 50px; line-height: 50px; background-color: #0084ff; color: #fff">
                        <th>编号</th>
                        <th>预约类型</th>
                        <th>预约的地点</th>
                        <th>预约时间</th>
                        <th>预约状态</th>
                        <th>查看</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <ul class="page">
                <span class="prev" style="margin-right: 10px">&laquo;上一页</span>
                <span class="next">下一页&raquo;</span>
                <span>
                        共<span>0</span>页
                    </span>
                <span>
                        到第
                        <input id="pageNum" type="text">
                        页
                    </span>
                <span>
                        <input id="confPageNum" type="button" value="确定">
                    </span>
            </ul>
        </div>

        <!-- 模态框 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            预约详情
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form action="#" role="form">
                            <div class="form-group">
                                <div class="input-line">
                                    预约类型：
                                    <input  class="type form-control" type="text" readonly="readonly">
                                </div>

                                <div class="input-line">
                                    预约的地点：
                                    <input class="address form-control" type="text" readonly="readonly">
                                </div>

                                <div class="input-line">
                                    预约的时间：
                                    <input class="beginTime form-control" type="text" readonly="readonly">
                                </div>

                                <div class="input-line">
                                    预约的状态：
                                    <input class="app-status form-control" type="text" readonly="readonly">
                                </div>

                                <div class="input-line">
                                    候选人：
                                    <ul class="apply-list">

                                    </ul>
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>
</body>
</html>
<script>

</script>