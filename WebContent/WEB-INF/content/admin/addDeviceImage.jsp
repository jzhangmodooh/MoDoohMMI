<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=car-width, initial-scale=1.0">
<title>Welcome</title>
<link rel="icon" href="Favicon.ico" />
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-table.css" rel="stylesheet">
<script src="assets/js/jquery-2.2.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/table.js"></script>
<script src="assets/js/layer/layer.js"></script>
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/new.css" rel="stylesheet">
</head>

<body>
	<%@include file="../navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 hidden-xs navlist">
				<div class="nav-list">
					<ul class="nav nav-list menu">
						<li><a href="viewDeviceModelAction">Device Management</a></li>
					</ul>
					<ul class="nav nav-list menu">
						<li><a href="viewUserAction">Customer Management</a></li>
					</ul>
					<ul class="nav nav-list menu">
						<li><a href="viewOrderRecordAction">Order Management</a></li>
					</ul>
					<ul class="nav nav-list active menu">
						<li><a href="">Picture Upload</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-xs-12 list">
				<button onclick="addFile()" class="btn btn-info addbtn">
					<i class="glyphicon glyphicon-plus glyphicon "></i>Add
				</button>
				<button onclick="subFile()" class="btn btn-danger addbtn">
					<i class="glyphicon glyphicon-minus glyphicon "></i>Delete
				</button>
				<form id="addFile" action="addDeviceImageAction" method="post"
					enctype="multipart/form-data">
					<input id="firstFile" type="file" class="form-control file"
						name="uploadFile"> <input id="deviceID"
						name="deviceModelId" placeholder="Device ID"> <input
						class="btn btn-success" type="submit" value="Upload">
						<s:token></s:token>
				</form>
			</div>
		</div>
	</div>
</body>

</html>