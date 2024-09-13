<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>首页</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/index.css">
		<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" language="JavaScript" src="js/index.js" charset="utf-8"></script>
        <script src="js/jsAddress.js" type="text/javascript" charset="UTF-8"></script>
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
			<div class="search">
				<div class="input-group">
					<form action="">
						<input type="text" class="search-input form-control">
					</form>
					<span class="search-btn input-group-addon btn btn-default">搜索</span>
				</div>
			</div>
			
			<div class="main">
				<div>
					<div class="col-md-3 type">

						<ul class="list-group col-md-12 big-type">

						</ul>

						<ul style="margin-top: 40px" class="list-group col-md-12 recommend">
							<li style="text-align: center; font-weight: bold; font-size: 16px" class="list-group-item">好评推荐</li>
						</ul>
					</div>
				
					<div class="col-md-6 middle">
						<div id="myCarousel" class="carousel slide">
							<!-- 轮播（Carousel）指标 -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>   
							<!-- 轮播（Carousel）项目 -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="images/carousel04.png" alt="First slide">
								</div>
								<div class="item">
									<img src="images/carousel01.png" alt="Second slide">
								</div>
								<div class="item">
									<img src="images/carousel03.png" alt="Third slide">
								</div>
							</div>
							<!-- 轮播（Carousel）导航 -->
							<a class="carousel-control left" href="#myCarousel" data-slide="prev"> 
								<span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
							</a>
							<a class="carousel-control right" href="#myCarousel" data-slide="next">
								<span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>

						<!--家政人员列表项-->
						<div class="housekeeper-list clearfix">
							<div class="housekeeper-list-hour clearfix"><span>家庭服务</span></div>
							<div class="housekeeper-list-repair clearfix"><span>维修</span></div>
							<div class="housekeeper-list-move clearfix"><span>搬运</span></div>
						</div>
					</div>
					
					
					<div class="col-md-3 appoint">
						<h4>预约服务</h4>
						
						<form action="#" role="form">
							<div class="form-group">

								<div class="input-line">
									<input id="app_time" type="date" class="form-control" placeholder="请选择时间">
								</div>

								<div class="input-line">
									<select class="form-control" id="app_type">
										<option selected="selected">请选择服务类型</option>


									</select>
								</div>
								
								<div>
									<div class="col-md-4 input-line">
										<select class="form-control" id="app_address_province" name="app_address_province">
											<%--<option selected="selected">请选择省份</option>--%>

										</select>
									</div>

									<div class="col-md-4 input-line">
										<select class="form-control" id="app_address_city" name="app_address_city">
											<%--<option selected="selected">请选择城市</option>--%>

										</select>
									</div>

									<div class="col-md-4 input-line">
										<select class="form-control" id="app_address_area" name="app_address_area">
											<%--<option selected="selected">请选择地区</option>--%>

										</select>
									</div>
								</div>
								
								<div class="input-line">
									<input id="app_address_detail" type="text" class="form-control" placeholder="请输入详细地址">
								</div>
								
								<div class="input-line">
									<input id="app_phone" type="text" class="form-control" placeholder="请输入联系方式">
								</div>
								
								<div class="input-line">
									<button id="mkAppSubmit" class="btn btn-primary btn-block">立即发布</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</body>
</html>
<script>

    $("#mkAppSubmit").click(function () {
        var role = $("#role").text();
        if (role == 1) {
            alert("目前预约服务仅限于消费者单向发布，功能有待完善，带来不便，还请谅解！");
        } else if (!testFull()) {
            alert("请将预约的内容填写完整!");
        } else {
			var url = "app/mkApp";
			var appTypeData= $("#app_type").val();
			var appAddressProvinceData = $("#app_address_province").val();
			var appAddressCityData = $("#app_address_city").val();
			var appAddressAreaData = $("#app_address_area").val();
			var appAddressDetailData = $("#app_address_detail").val();
			var appPhoneData = $("#app_phone").val();
			var appTime = $("#app_time").val();
			var data = "app_type=" + appTypeData + "&app_address_province=" + appAddressProvinceData + "&app_address_city=" + appAddressCityData + "&app_address_area=" +
				appAddressAreaData + "&app_address_detail=" + appAddressDetailData + "&app_phone=" +appPhoneData +
				"&app_time=" + appTime;
			//alert(appTypeData + "-" + appAddressProvinceData + "-" + appAddressCityData + "-" + appAddressAreaData + "-" + appPhoneData);
			//alert(data);
			$.ajax({
				"url": url,
				"data": data,
				"type": "Post",
				"dataType": "json",
				"success": function (json) {
					if (json.state == 200) {
						alert("预约成功!");
					} else if (json.state == 406) {
						alert(json.message);
                        //window.location.href = "login.jsp";
					} else if (json.state == 407) {
						alert(json.message);
						//window.location.href = "login.jsp";
					}
				}
			})
			//alert("结束");
		}
    })

	// 用于校验发布预约的内容是否填写完整, 如果填写不完整会返回 false,否则返回 true
	function testFull() {
        var appTypeData= $("#app_type").val();
        var appAddressProvinceData = $("#app_address_province").val();
        var appAddressCityData = $("#app_address_city").val();
        var appAddressAreaData = $("#app_address_area").val();
        var appAddressDetailData = $("#app_address_detail").val();
        var appPhoneData = $("#app_phone").val();
        //appTypeData == "请选择服务类型" || appAddressCityData == "请选择城市" || appAddressAreaData == "请选择地区" ||
        if (appAddressProvinceData =="" || appTypeData == "请选择服务类型" || appAddressCityData == "" || appAddressAreaData == "" || appAddressDetailData == "" || appPhoneData == "") {
			return false;
		} else {
            return true;
		}
    }
</script>