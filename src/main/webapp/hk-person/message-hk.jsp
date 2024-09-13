<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>消息界面</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/sweeralert.min.js"></script>
    <link href="../css/sweetalert.css">
    <script src="../js/message-hk.js" charset="UTF-8"></script>
    <style>
        h3, h4 {
            color: #0084ff;
            font-weight: bold;
        }
        .news-head {
            height: 40px;
            line-height: 40px;
            background-color: #efefef;
            padding-left: 10px;
        }
        .news-head span {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>消息管理</h3>
    <div class="container">
        <h4>我的消息</h4>
        <div class="news-head">
            <select name="" id="">
                <option value="">全部</option>
                <option value="">已读</option>
                <option value="">未读</option>
            </select>
            <span>
                    共 <label for="" class="num">0</label> 条消息
                </span>
        </div>
        <div>
            <table class="table table-condensed table-hover ">
                <thead>
                <tr>
                    <th>消息内容</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <!--<tr>-->
                <!--<th class="msg-content">周尔康最帅周尔康最帅周尔康最帅周尔康最帅周尔康最帅</th>-->
                <!--<th>2019/04/14 18:08</th>-->
                <!--<th>-->
                <!--<button class="see btn btn-primary">查看</button>-->
                <!--<button class="btn btn-primary">删除</button>-->
                <!--</th>-->
                <!--</tr>-->
                <!--<tr>-->
                <!--<th>周尔康最帅</th>-->
                <!--<th>2019/04/14 18:08</th>-->
                <!--<th>-->
                <!--<button class="see btn btn-primary">查看</button>-->
                <!--<button class="btn btn-primary">删除</button>-->
                <!--</th>-->
                <!--</tr>-->
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
<script>


</script>