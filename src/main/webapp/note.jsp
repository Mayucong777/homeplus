<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>留言板</title>
    <link rel="stylesheet" href="css/common.css"/>
    <link rel="stylesheet" href="css/nav.css" />
    <link rel="stylesheet" href="css/note.css" />
    <link rel="shortcut icon" href="./ico/icon.png" type="image/x-icon">
</head>
<body>
<div class="note">
    <!-- 导航栏 -->
    <div class="general-nav">
        <div class="general-nav-content">
            <div class="general-nav-content-bloger">
                <ul>
                    <li><a href="index.html"><!-- <img src="img/icon.jpg"/> --></a></li>
                    <li><a href="index.html"><p>卷卷毛's 主页</p></a></li>
                </ul>
            </div>
            <div class="general-nav-content-links">
                <ul>
                    <li><a href="blog.html">博客园</a></li>
                    <li><a href="./friends.html">友人录</a></li>
                    <li><a href="./resource.html">资源墙</a></li>
                    <li class="general-nav-content-links-selected"><a href="./note.html">留言板</a></li>
                    <li><a href="http://www.wayne-lee.cn:1024/搜索.html" target="_blank">习题册</a></li>
                    <li><a href="http://www.wayne-lee.cn:2119/" target="_blank">单词簿</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- <div class="note-title">
        <h2>有什么想对博主说的，快写下来吧</h2>
    </div> -->

    <!-- 留言区 -->
    <div class="note-editor">
        <!-- 留言框 -->
        <textarea class="note-editor-text"
                  placeholder="说点什么吧..."
                  @focus="isEditing = true"
                  @focusout="isEditing = false"
                  v-model="noteNew.content">

				</textarea>
        <!-- 提交按钮 -->
        <button class="note-editor-submit" @click="submitReply">提交</button>
        <!-- 私密发送 -->
        <div class="note-editor-secret">
            <span @click="isSecret = !isSecret,changeSecret()">悄悄话</span>
            <input type="checkbox" v-model="isSecret" @change="changeSecret"/>
        </div>
        <!-- 昵称框 -->
        <input class="note-editor-nickname"
               type="input"
               placeholder="怎么称呼你呢..."
               v-model="noteNew.nickname"
               maxlength="12"
               @focus="isEditing = true"
               @focusout="isEditing = false"/>
        <span>{{noteNew.nickname.length}}/12</span>
        <span v-show="replyInfo.respondent != ''" @click="cancelReply">撤销回复</span>
        <span v-show="isEditing || replyInfo.respondent != ''">{{replyInfo.respondent == '' ? (isSecret ? '说点悄悄话，仅博主可见...' : '留言中...') : ('正在回复  ' + replyInfo.respondent + '  的留言...')}}</span>
    </div>
    <!-- 留言列表 -->
    <div class="note-content">

        <ul class="note-content-list">
            <!-- 留言项 -->
            <li v-for="(note,idx) in noteList" class="note-content-list-node">
                <p>{{note.nickname}}：&nbsp;&nbsp;&nbsp;<span @click="reply(note.id,note.id,note.nickname)">回复</span></p>
                <p>{{note.time}}</p>
                <p>{{note.content}}</p>

                <!-- 回复项 -->
                <ul class="note-content-follow-list">
                    <li v-for="(follow,idx1) in note.follows" class="note-content-follow-list-node">
                        <p>{{follow.nickname}}：&nbsp;<span>@{{follow.respondent}}</span></p>
                        <p @click="reply(note.id,follow.id,follow.nickname)">回复</p>
                        <p>{{follow.time}}</p>
                        <p>{{follow.content}}</p>
                    </li>
                </ul>

            </li>

        </ul>
    </div>
    <footer class="footer">

    </footer>
</div>

</body>
</html>
<script src="js/vue.js"></script>
<script src="js/jquery-3.5.1.js"></script>
<script src="js/commen.js"></script>
<script src="js/note.js"></script>