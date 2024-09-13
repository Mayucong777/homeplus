<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>搜索结果页</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/appointment.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/sweeralert.min.js"></script>
    <script src="js/search-result.js" charset="UTF-8"></script>

    <!--<script src="js/index.js"></script>-->
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
<div class="container" style="max-width: 800px">
    <!-- 筛选条件 -->
    <div class="clearfix filter">
        <ul class="select">
            <li class="select-list">
                <dl id="select2">
                    <dt>支付类型：</dt>
                    <dd class="select-all selected"><a href="#">全部</a></dd>
                    <dd><a href="#" class="settle" id="0">按单支付</a></dd>
                    <!--<dd>按单支付</dd>-->
                    <dd><a href="#" class="settle" id="1">按小时支付</a></dd>
                </dl>
            </li>
            <li class="select-list">
                <dl id="select3">
                    <dt>认证类型：</dt>
                    <dd class="select-all selected"><a href="#">全部</a></dd>
                    <dd><a href="#" class="type" id="single-type">个人认证</a></dd>
                    <dd><a href="#" class="type" id="company-type">公司认证</a></dd>
                </dl>
            </li>
            <li class="select-result">
                <dl>
                    <dt>已选条件：</dt>
                    <dd class="select-no">暂时没有选择过滤条件</dd>
                </dl>
            </li>
        </ul>
    </div>

    <!--家政人员列表项-->
    <div class="housekeeper-list clearfix">


    </div>
</div>
</body>
</html>
<script>

</script>