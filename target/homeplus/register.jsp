<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"> 
		<title>用户注册</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/register.css">
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/jsAddress.js" type="text/javascript" charset="UTF-8"></script>
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
			<div class="h2">
				用户注册
			</div>
			
			<div class="col-md-8">
				<form class="form-horizontal" role="form" action="#">
					
					<div class="form-group">
						<label class="col-md-2 control-label">手机号码</label>
						<div class="col-md-10">
							<input name="username" class="form-control" type="text" placeholder="请输入当前手机号码">
						</div>
						<div class="small info text-danger">
							<span class="phone-check">号码格式不正确,请重新输入!</span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label">昵称</label>
						<div class="col-md-10">
							<input name="nickname" class="form-control" type="text" placeholder="请输入昵称">
						</div>
						<div class="small info text-danger">
							<span class="nickname-check">昵称不能为空,请重新输入!</span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">密码</label>
						<div class="col-md-10">
							<input name="password" class="form-control" type="password" placeholder="请输入密码">
						</div>
						<div class="small info text-danger">
							<span class="pwd-check">密码不能为空,请重新输入!</span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">确认密码</label>
						<div class="col-md-10">
							<input name="again-password" class="form-control" type="password" placeholder="请输入确认密码">
						</div>
						<div class="small info text-danger">
							<span class="againPwd-check">确认密码不能为空,请重新输入!</span>
						</div>
							
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label">邮箱</label>
						<div class="col-md-10">
							<input name="email" class="form-control" type="text" placeholder="请输入邮箱">
						</div>
						<div class="small info text-danger">
							<span class="email-check">邮箱格式不正确,请重新输入!</span>
						</div>
					</div>

					<div class="address form-group" id="address">
						<label class="col-md-2 control-label">地址</label>
						<div>
							<div class="col-md-3 input-line">
								<select class="form-control" id="app_address_province" name="app_address_province">
									<%--<option selected="selected">请选择省份</option>--%>
								</select>
							</div>

							<div class="col-md-3 input-line">
								<select class="form-control" id="app_address_city" name="app_address_city">
									<%--<option selected="selected">请选择城市</option>--%>
								</select>
							</div>

							<div class="col-md-3 input-line">
								<select class="form-control" id="app_address_area" name="app_address_area">
									<%--<option selected="selected">请选择地区</option>--%>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label" for="sex">性别</label>
						<div class="col-md-10" id="sex">
							<div class="col-md-6">
								<input name="sex-type" value="1" type="radio" id="sex1" checked="checked">
								<label for="sex1">男</label>
							</div>
							<div class="col-md-6">
								<input name="sex-type" value="0" type="radio" id="sex2">
								<label for="sex2">女</label>
							</div>
						</div>
						<div class="small info text-danger">
							<span class="sex-check">性别不能为空!</span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label" for="role">角色类型</label>
						<div class="col-md-10" id="role">
							<div class="col-md-6">
								<input name="user-type" value="0" type="radio" id="radio1" checked="checked">
								<label for="radio1">普通用户</label>
							</div>
							<div class="col-md-6">
								<input name="user-type" value="1" type="radio" id="radio2">
								<label for="radio2">家政人员</label>
							</div>
						</div>
						<div class="small info text-danger">
							<span class="user-type-check">登录名称不能为空!</span>
						</div>
					</div>
					
					<div class="form-group" style="text-align: center">
						<input id="submit" type="button" class="btn btn-primary" value="注册">
						<input type="button" class="btn btn-default" value="取消">
					</div>
					
					<div class="text-center small">
						点击"注册"按钮即表示同意并愿意遵守<a>用户协议</a>
					</div>
				</form>
			</div>
			
			
			<div class="col-md-4">
				<img alt="图片" src="images/main.png">
			</div>
		</div>

	</body>
</html>
<script>

	$(document).ready(function () {
        addressInit('app_address_province','app_address_city','app_address_area');

        /*var address = document.getElementById("address")
        address.style.display = "none";
        if ($("input[name='user-type']:checked").val() == 0){
            address.style.display = "none";
        } else{
            address.style.display = "";
        }*/
        $("input[name='user-type']").change(
            function () {
                var address = document.getElementById("address")
                if ($("input[name='user-type']:checked").val() == 1){
                    address.style.display = "none";
                } else{
                    address.style.display = "";
                }
            }
		);
    });

	$(".form-control").eq(0).blur(
		function () {
			var pattern = /^1[34578]\d{9}$/;
			var flag = false;
			if ($(this).val() == "") {
				$(".phone-check").html("手机号码不能为空!");
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
                $(".nickname-check").show();
            } else {
                $(".nickname-check").hide();
            }
        }
	);

	$(".form-control").eq(2).blur(
		function () {
			if ($(this).val() == "") {
				$(".pwd-check").show();
			} else {
				$(".pwd-check").hide();
			}
		}
	);
	
	$(".form-control").eq(3).blur(
		function () {
			var thisVal = $(this).val();
			var lastVal = $(".form-control").eq(2).val();
			if ($(this).val() == "") {
				$(".againPwd-check").show();
			} else if (thisVal != lastVal){
				$(".againPwd-check").html("两次输入的密码不一致，请重新输入!");
			} else {
				$(".againPwd-check").hide();
			}
		}
	);

    $(".form-control").eq(4).blur(
        function () {
            if ($(this).val() == "") {
                $(".email-check").show();
            } else {
                $(".email-check").hide();
            }
        }
    );

    /*$(".form-control").eq(7).blur(
        function () {
            var address = document.getElementById("address");
			if ($(this).checkbox().val() == 1){
			    address.style.display = "none";
			} else{
			    address.style.display = "";
			}
        }
	);*/

	// 点击按钮，提交内容
	$("#submit").click(function () {
	    if (!testFull()) {
	        alert("请将注册信息填写完整！");
		} else {
            var url = "user/register"
            var username = $("input[name='username']").val();
            var nickname = $("input[name='nickname']").val();
            var email = $("input[name='email']").val();
            var password = $("input[name='password']").val();
            var againPassword = $("input[name='again-password']").val();
            var role = $("input[name='user-type']:checked").val();
            var sex = $("input[name='sex-type']:checked").val();
            var addressProvinceData = $("#app_address_province").val();
            var addressCityData = $("#app_address_city").val();
            var addressAreaData = $("#app_address_area").val();
            var userAddress = addressProvinceData + "-" + addressCityData + "-" + addressAreaData;
            var data = "username="+username+"&password="+password+"&role="+role+"&nickname="+nickname+"&email="+email+"&sex="+sex+"&userAddress="+userAddress;
            $.ajax({
                "url": url,
                "data": data,
                "type": "Post",
                "dataType": "json",
                "success": function(json) {
                    if (json.state == 200) {
                        alert("注册成功！");
                        window.location.href = "login.jsp";
                    } else if (json.state == 401) {
                        alert("注册失败！" + json.message);
                    }
                }
            })
		}
    })

	// 判断注册的内容是否填写完整
	function testFull() {
        var username = $("input[name='username']").val();
        var nickname = $("input[name='nickname']").val();
        var email = $("input[name='email']").val();
        var password = $("input[name='password']").val();
        var againPassword = $("input[name='again-password']").val();
        var role = $("input[name='user-type']:checked").val();
        var sex = $("input[name='sex-type']:checked").val();
        var addressProvinceData = $("#app_address_province").val();
        var addressCityData = $("#app_address_city").val();
        var addressAreaData = $("#app_address_area").val();
        var userAddress = addressProvinceData + "-" + addressCityData + "-" + addressAreaData;
        if (username == "" || password == "" || againPassword == "" || role == "" || sex == "" || nickname == "" || email == "") {
            return false;
		} else {
            return true;
		}
    }
</script>