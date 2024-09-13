<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>消息界面</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/message.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/sweeralert.min.js"></script>
    <link href="../css/sweetalert.css">
    <script src="../js/message-person.js" charset="UTF-8"></script>
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

                </tbody>
            </table>
        </div>
    </div>

    <!-- 模态框（Modal） 不能写在非div标签内部，否则容易遮罩一层黑屏 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">消息详情</h4>
                </div>
                <%--<div class="modal-body">
                    <form action="#" class="form-horizontal" role="form">
                        <div class="form-group">
                                 <label for="fromName" class="col-md-2 control-label">发送者</label>
                            <div class="col-md-3">
                                <input type="text" id="fromName" class="form-control" readonly="readonly"/>
                            </div>
                            <label for="toName" class="col-md-2 control-label">接收者</label>
                            <div class="col-md-3">
                                <input type="text" id="toName" class="form-control" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="msgContent" class="col-md-2 control-label">消息内容</label>
                            <div class="col-md-8">
                                <textarea type="text" id="msgContent" class="form-control" readonly="readonly"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="createdTime" class="col-md-2 control-label">发送时间</label>
                            <div class="col-md-8">
                                <input type="text" id="createdTime" class="form-control" readonly="readonly"/>
                            </div>
                        </div>
                    </form>
                </div>--%>
                <!-- 留言列表 -->
                <div class="note-content">
                    <span id="msgID" style="display: none"></span>
                    <ul class="note-content-list">
                        <!-- 留言项 -->
                        <li class="note-content-list-node">

                        </li>
                            <!-- 回复项 -->
                            <ul class="note-content-follow-list">

                            </ul>

                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="reply_btn" onclick="replyMsg()">回复</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 模态框 -->
    <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="replyModalLabel">
                        回复
                    </h4>
                </div>
                <div class="modal-body">
                    <form action="#" role="form">
                        <div class="form-group">
                            <div class="input-line">
                                回复内容：
                                <textarea  class="reply-input type form-control" type="text"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="submit-reply btn btn-primary">发送
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