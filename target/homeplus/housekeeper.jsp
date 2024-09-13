<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>家政人员界面</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <link rel="stylesheet" href="css/appointment.css">
    <link rel="stylesheet" href="css/housekeeper.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/housekeeper.js"></script>
    <script src="js/address.js"></script>
    <script src="js/sweeralert.min.js"></script>
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
        <div id="desc">
            <div id="head">
                <img  style='width: 150px; height: 150px;' class="head" src="images/list-head.png" alt="头像加载中...">
                <span id="title">
                    <h4 class="title"></h4>
                    <button class="contact-btn btn btn-primary" data-toggle="modal">联系商家</button>
                    <h4 class="slogan"></h4>

                </span>


            </div>
            <div id="detail">
                <div>
                    昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：
                    <span class="nickname"></span>
                </div>
                <div>
                    简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：
                    <span class="describe"></span>
                </div>
                <div>
                    公&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;司：
                    <span class="company"></span>
                </div>
                <div>
                    地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：
                    <span class="address"></span>
                </div>
                <div>
                    联系电话：
                    <span class="phone"></span>
                    <input class="left-msg" type="button" value="给我留言">
                </div>
            </div>
            <ul id="diff">
                <li id="diff-one">商家介绍</li>
                <li id="diff-two">客户评价</li>
            </ul>
        </div>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            联系方式
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form action="#" role="form">
                            <div class="form-group">

                                <div class="input-line app_phone" style="font-size: 40px; color: #0084ff">
                                    11011
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


        <!-- 模态框 -->
        <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="messageModalLabel">
                            留言
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form action="#" role="form">
                            <div class="form-group">
                                <div class="input-line">
                                    留言内容：
                                    <input  class="msg-input type form-control" type="text">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="submit-msg btn btn-primary">发送
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <div id="housekeeper-desc">
            <div id="housekeeper-desc-content">
                <h3>商家简介</h3>
                <div class="desc_detail">
                    矿大胡姐家政保姆公司，大量保姆欢迎来电。我们公司提供以下服务：1、月嫂
                    2、保姆 （全天、上午3、4、5小时、下午3、4、5小时）
                    3、住家保姆（24小时保姆）
                    4、钟点工
                    5、育婴师
                    6、陪护工（全自理、半自理、不能自理）
                    7、照顾小孩（全天、半天、24小时）
                    各种保姆全部都有，无论照顾小孩或老人，无论半天、全天、还是24小时任您选择。
                </div>
            </div>

            <div>
                <h3>擅长服务</h3>
                <ul id="companyService">
                    <%--<li>
                        <img src="images/checked.png"  alt="勾选图片">
                        <span>营养护理</span>
                    </li>
                    <li>
                        <img src="images/checked.png"  alt="勾选图片">
                        <span>科学照料</span>
                    </li>
                    <li>
                        <img src="images/checked.png"  alt="勾选图片">
                        <span>多层管理</span>
                    </li>
                    <li>
                        <img src="images/checked.png"  alt="勾选图片">
                        <span>家庭保洁</span>
                    </li>--%>
                </ul>
            </div>
        </div>

        <div id="comments">
            <h3>评价</h3>
            <div>
                <div class="percent">
                    <span class="good-percent">86%</span><br>
                    好评度
                </div>
                <div class="comment-content">
                    <ul>
                        <li>
                            <img src="images/good.png" alt="好评图片">
                            好评：
                            <div class="progress" style="width: 200px">
                                <div class="good-progress progress-bar" role="progressbar" style="width: 60%" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <label class="good-num">18人</label>
                        </li>
                        <li>
                            <img src="images/middle.png" alt="中评图片">
                            中评：
                            <div class="progress" style="width: 200px">
                                <div class="middle-progress progress-bar" role="progressbar" style="width: 50%" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <label class="middle-num">3人</label>
                        </li>
                        <li>
                            <img src="images/bad.png" alt="差评图片">
                            差评：
                            <div class="progress" style="width: 200px">
                                <div class="bad-progress progress-bar" role="progressbar" style="width: 20%" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <label class="bad-num">2人</label>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="comment">
                <!--<div class="single-comment">-->
                    <!--<div>-->
                        <!--<span>-->
                            <!--<img src="images/good.png" alt="好评">-->
                            <!--好评-->
                        <!--</span>-->
                        <!--<span class="single-comment-author">-->
                            <!--评论者：<span>字牧之</span>-->
                        <!--</span>-->
                    <!--</div>-->
                    <!--<div class="single-comment-content">-->
                        <!--响应很及时，沟通态度不错，收费透明。-->
                    <!--</div>-->
                    <!--<div class="single-comment-time">-->
                        <!--2019/04/18 26:47-->
                    <!--</div>-->
                <!--</div>-->

                <!--<ul class="page">-->
                    <!--<span class="prev" style="margin-right: 10px">&laquo;上一页</span>-->
                    <!--<span class="next">下一页&raquo;</span>-->
                    <!--<span>-->
                        <!--共<span>0</span>页-->
                    <!--</span>-->
                    <!--<span>-->
                        <!--到第-->
                        <!--<input id="pageNum" type="text">-->
                        <!--页-->
                    <!--</span>-->
                    <!--<span>-->
                        <!--<input id="confPageNum" type="button" value="确定">-->
                    <!--</span>-->
                <!--</ul>-->
            </div>
        </div>
    </div>
</body>

</html>