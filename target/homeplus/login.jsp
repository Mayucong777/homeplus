<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/login.css">
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a href="index.jsp"></a>
		</div>

		<div>
			<ul class="nav navbar-nav">
				<li>
					<a href="index.jsp">
						<span class="glyphicon glyphicon-home"></span>
						首页
					</a>
				</li>
				<li>
					<a href="register.jsp">
						<span class="glyphicon glyphicon-user"></span>
						注册
					</a>
				</li>
				<li>
					<a href="login.jsp">
						<span class="glyphicon glyphicon-log-in"></span>
						登录
					</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h2>用户登录</h2>
		<form class="form-horizontal" action="#" role="form">
			<div class="form-group">
				<label class="col-md-2 control-label">手机号码</label>
				<div class="col-md-10">
					<input name="username" class="form-control" type="text" placeholder="请输入手机号码">
				</div>
				<div class="small info text-danger">
					<span class="phone-check"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-2 control-label">密码</label>
				<div class="col-md-10">
					<input name="password" class="form-control" type="password" placeholder="请输入密码">
				</div>
				<div class="small info text-danger">
					<span class="pwd-check"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-2 control-label">验证码</label>
				<div class="col-md-10">
					<div class="col-md-6 code1">
						<input name="vertifyCode" class="form-control" type="text" placeholder="请输入验证码">
					</div>
					<div class="col-md-6 code2">
						<canvas width="222" height="34" id="vertifyCode"></canvas>
					</div>
				</div>
				<div class="small info text-danger">
					<span class="code-check"></span>
				</div>
			</div>

			<div class="to-register">
				<a class="text-warning" href="register.jsp">还没有账号？立即注册</a>
			</div>

			<div class="form-group" style="text-align: center">
				<input id="submit" type="button" class="btn btn-primary" value="登录">
				<input type="button" class="btn btn-default" value="取消">
			</div>
		</form>
	</div>

</body>
</html>
<script>
	<!--页面加载获得后台生成的验证码-->
	$(document).ready(updateVertifyCode())

    $(".form-control").eq(0).blur(
        function () {
            var pattern = /^1[34578]\d{9}$/;
            var flag = false;
            if ($(this).val() == "") {
                $(".phone-check").html("手机号码不能为空！请重新填写。");
                flag = true;
            } else if ($(this).val().length != 11) {
                $(".phone-check").html("请输入有效的手机号码!");
                flag = true;
            } else if (!(pattern.test($(this).val()))) {
                flag = true;
            } else {
                flag = false;
            }

            if (flag) {
                $(".phone-check").show();
            } else {
                $(".phone-check").hide();
            }
        }
    );
    $(".form-control").eq(1).blur(
        function () {
            if ($(this).val() == "") {
                $(".pwd-check").html("密码不能为空！请重新填写。");
                $(".pwd-check").show();
            } else {
                $(".pwd-check").hide();
            }
        }
    );

    $(".form-control").eq(2).blur(function () {
        var thisVal = $(this).val();
        var codeVal = $(".form-control").eq(3).text();
        if (thisVal == "") {
            $(".code-check").html("验证码不能为空！请重新填写。")
        }
		$(".code-check").show();
    })

	$("#vertifyCode").click(function () {
        updateVertifyCode();
    })

    document.onkeydown = function(){
        if(window.event.keyCode == 13){
            $("#submit").click();
		}
	}


	$("#submit").click(function () {
	    var url = "user/login";
		var username = $("input[name='username']").val();
		var password = $("input[name='password']").val();
		var vertifyCode = $("input[name = 'vertifyCode']").val();
		var data = "username=" + username + "&password=" + password + "&vertifyCode=" + vertifyCode;
		$.ajax({
			"url": url,
			"data": data,
			"dataType": "json",
			"success": function (json) {
				if (json.state == 200) {
				    alert("登录成功！");
				    if (json.data == -1) {
						window.location.href = "admin-index.jsp";
					} else {
				    	window.location.href = "index.jsp";
					}
				} else if (json.state == 404) {
				    alert(json.message)
				} else if (json.state == 405) {
					alert(json.message);
				} else if (json.state == 502) {
					$(".code-check").html("验证码输入错误，请重新填写！")
					updateVertifyCode();
				}
            }
		})
    })

	// 更换验证码
	function updateVertifyCode() {
        var url = "user/refresh";
        $.ajax({
            "url": url,
            "dataType": "json",
            "success": function (json) {
                draw(json.data);
            }
        })
    }

    //随机生成RGB颜色
    function randomRgbColor(min, max) {
        var r = randomNum(min, max);
        var g = randomNum(min, max);
        var b = randomNum(min, max);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
    // 对验证码的进行绘图
	function draw(value) {
        var canvas=document.getElementById("vertifyCode");
        var width=canvas.width;
        var height=canvas.height;
        var ctx = canvas.getContext('2d');
        ctx.textBaseline = 'bottom';

        /* 绘制背景色 */
        ctx.fillStyle = randomRgbColor(180, 240); //颜色若太深可能导致看不清
        ctx.fillRect(0,0,width,height);
        /* 绘制文字 */
        var str = value;
        for(var i=0; i<4; i++){
            var txt = str[i];
            ctx.fillStyle = randomRgbColor(50, 160);  //随机生成字体颜色
            ctx.font = randomNum(30,40)+'px SimHei'; //随机生成字体大小
            var x = 20+i*40;
            var y = 35;
            var deg = randomNum(-45, 45);
            //修改坐标原点和旋转角度
            ctx.translate(x,y);
            ctx.rotate(deg*Math.PI/180);
            ctx.fillText(txt, 0,0);
            //恢复坐标原点和旋转角度
            ctx.rotate(-deg*Math.PI/180);
            ctx.translate(-x,-y);
        }
        /* 绘制干扰线 */
        for(var i=0; i<4; i++){
            ctx.strokeStyle = randomRgbColor(40, 180);
            ctx.beginPath();
            ctx.moveTo( randomNum(0,width), randomNum(0,height) );
            ctx.lineTo( randomNum(0,width), randomNum(0,height) );
            ctx.stroke();
        }
        /* 绘制干扰点 */
        for(var i=0; i<100; i++){
            ctx.fillStyle = randomRgbColor(0, 255);
            ctx.beginPath();
            ctx.arc(randomNum(0,width),randomNum(0,height), 1, 0, 2*Math.PI);
            ctx.fill();
        }
    }
    // 生成随机数
    function randomNum(min,max){
        return Math.floor( Math.random()*(max-min)+min);
    }


</script>