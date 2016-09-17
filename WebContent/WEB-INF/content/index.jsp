<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MoDooh</title>
<meta charset="utf-8">
<link rel="icon" href="Favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">
<script src="assets/js/jquery-2.2.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/layer/layer.js"></script>

</head>

<body>
	<%@include file="navbar.jsp"%>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<h1 style="font-size: 58px;">You never see before!</h1>
					<h1>Better Digital Transit Solutions</h1>
					<a class="indexbtn btn btn-warning btn-lg" href="viewDeviceModelAction">Go to management console</a>
				</div>
				<div class="col-lg-6">
					<img class="img-responsive" src="assets/img/front.png" alt="">
				</div>
				<!-- /col-lg-6 -->

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<div class="container">
		<div class="row mt centered">
			<div class="col-lg-6 col-lg-offset-3">
				<h1>
					MoDooh Transit Solutions<br />We are the ONE!
				</h1>
				<h3>Design, Engineering, Fabrication</h3>
			</div>
		</div>
		<!-- /row -->

		<div class="row mt centered">
			<div class="col-lg-4">
				<img src="assets/img/ser01.png" width="180" alt="">
				<h4>Maintenance</h4>
				<p>Option1</p>
				<p>Option2</p>
				<p>Option3</p>
				<p>Option4</p>
			</div>
			<!--/col-lg-4 -->

			<div class="col-lg-4">
				<img src="assets/img/ser02.png" width="180" alt="">
				<h4>24-Hour Tech Support</h4>
				<p>Option1</p>
				<p>Option2</p>
				<p>Option3</p>
				<p>Option4</p>

			</div>
			<!--/col-lg-4 -->

			<div class="col-lg-4">
				<img src="assets/img/ser03.png" width="180" alt="">
				<h4>Build Your Own</h4>
				<p>Option1</p>
				<p>Option2</p>
				<p>Option3</p>
				<p>Option4</p>

			</div>
			<!--/col-lg-4 -->
		</div>
		<!-- /row -->
	</div>
	<div class="container">
		<hr>
		<p class="centered">Created by Jeremy Zhang - 2016</p>
	</div>


</body>
</html>