<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户中心</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/person.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/hk_person.js"></script>
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
        <div class="col-md-2 left-nav">
            <h3>账户设置</h3>
            <ul class="list-group">
                <li class="list-group-item one" id="/hk-person/info-hk">
                    个人信息
                </li>
                <li class="list-group-item" id="/hk-person/edit-hk">
                    家政资料
                </li>
                <li class="list-group-item" id="/message-hk">
                    消息管理
                </li>
                <li class="list-group-item" id="/hk-person/certify-hk">
                    家政认证
                </li>
                <li class="list-group-item" id="/hk-person/certify-company">
                    公司认证
                </li>

            </ul>
        </div>

        <div class="col-md-10">
            <iframe id="myIframe" height="100%" width="100%" scrolling="no" src="hk-person/info-hk.jsp" frameborder="0"></iframe>
        </div>
    </div>
</body>
</html>