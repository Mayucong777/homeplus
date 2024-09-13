<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单页</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/order.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweeralert.min.js"></script>
    <script src="js/order.js" charset="UTF-8"></script>
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
                        <th>家政人员名称</th>
                        <th>服务时长(小时)</th>
                        <!--<th>实收金额(元)</th>-->
                        <th id="status">状态
                            <ul>
                                <li>已完成</li>
                                <li>未完成</li>
                                <li>已取消</li>
                            </ul>
                        </th>
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
                    共<span class="pages">0</span>页
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

            <!-- 模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                订单详情
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form action="#" role="form">
                                <div class="form-group">
                                    <div class="input-line">
                                        家政人员名称：
                                        <input  class="name form-control" type="text" readonly="readonly">
                                    </div>

                                    <div class="input-line">
                                        开始时间：
                                        <input class="begin-time form-control" type="text" readonly="readonly">
                                    </div>

                                    <div class="input-line">
                                        结束时间：
                                        <input class="end-time form-control" type="text" readonly="readonly">
                                    </div>

                                    <div class="input-line">
                                        地址：
                                        <input class="address form-control" type="text" readonly="readonly">
                                    </div>

                                    <div class="input-line">
                                        金额：
                                        <input class="money form-control" type="text" readonly="readonly">
                                    </div>

                                    <div class="input-line">
                                        订单状态：
                                        <input class="status form-control" type="text" readonly="readonly">
                                    </div>

                                    <div class="input-line" id="comment">
                                        评价星级：
                                        <div class="radio">
                                            <label class=".radio-inline col-md-4">
                                                <input type="radio"  value="2" id="good" disabled="disabled"> 好评
                                            </label>

                                            <label class=".radio-inline col-md-4">
                                                <input type="radio" value="1" id="mid" disabled="disabled"> 中评
                                            </label>

                                            <label class=".radio-inline col-md-4">
                                                <input type="radio" value="0" id="bad" disabled="disabled"> 差评
                                            </label>
                                        </div>

                                        <div class="input-line">
                                            评价内容：
                                            <textarea class="comment-content1 form-control" rows="3" readonly="readonly"></textarea>
                                        </div>

                                        <div class="input-line">
                                            评价时间：
                                            <input type="text" class="commentTime1 form-control" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="comment-btn" style="display: none" onclick="assessOrder()">评价</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <!-- 评价模态框 -->
            <div class="modal fade" id="assessModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="assessModalLabel">
                                评价订单
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form action="#" role="form">
                                <div class="form-group">

                                    <div class="input-line">
                                        评价星级：
                                        <div class="radio">
                                            <label class=".radio-inline col-md-4">
                                                <input type="radio" name="assess" value="2" checked> 好评
                                            </label>

                                            <label class=".radio-inline col-md-4">
                                                <input type="radio" name="assess" value="1"> 中评
                                            </label>

                                            <label class=".radio-inline col-md-4">
                                                <input type="radio" name="assess" value="0"> 差评
                                            </label>
                                        </div>

                                        <div class="input-line">
                                            评价内容：
                                            <textarea class="comment-content form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="button" class="submit-assess btn btn-primary" data-dismiss="modal">提交
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