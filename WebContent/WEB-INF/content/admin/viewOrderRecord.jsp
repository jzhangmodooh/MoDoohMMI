<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="icon" href="Favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome</title>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-table.css" rel="stylesheet">
<script src="assets/js/jquery-2.2.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/table.js"></script>
<script src="assets/js/layer/layer.js"></script>
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/new.css" rel="stylesheet">
<script type="text/javascript">
                function userIDChange(object, userName) {
                    var user = new Array();
                    user = [{
                        name: 'id',
                        value: object.value
                    }];
                    $.get("getUserByIdAction", user,
                        function (data, statusText) {
                            $("#" + userName).attr("value", data);
                        }, "html");
                }

                function deviceIDChange(object, deviceName) {
                    var user = new Array();
                    user = [{
                        name: 'id',
                        value: object.value
                    }];
                    $.get("getDeviceModelByIdAction", user,
                        function (data, statusText) {
                            $("#" + deviceName).attr("value", data);
                        }, "html");
                }

                function edit(value) {
                    var txt = "detail" + value;
                    var date = "20" + $("#" + txt + " #date").attr("value");
                    if (date.charAt(6) == "-")
                        date = date.substring(0, 5) + "0" + date.substring(5, date.length);
                    if (date.length == 9)
                        date = date.substring(0, 8) + "0" + date.substring(8, date.length);
                    $("#" + txt + " #date").attr("value", date);
                    $("#" + txt).slideToggle(500);
                }
            </script>
</head>

<body class="admin">
	<%@include file="../navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 hidden-xs navlist">
				<ul class="nav nav-list menu">
					<li><a href="viewDeviceModelAction">Device Management</a></li>
				</ul>
				<ul class="nav nav-list menu">
					<li><a href="viewUserAction">Customer Management</a></li>
				</ul>
				<ul class="nav nav-list active menu">
					<li><a href="">Order Management</a></li>
				</ul>
				<ul class="nav nav-list menu">
					<li><a href="dispatcherAction!goAddDeviceImage">Picture Upload</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-xs-12 list">
				<div>
					<button id="create" class="btn btn-warning createbtn">
						<i class="glyphicon glyphicon-plus"></i>New
					</button>
					<div id="newform" class="header" style="width: 400px;">
						<form class="form-horizontal" action="addOrderRecordAction"
							method="post">
							<fieldset>
								<div id="legend" class="">
									<legend>New Order</legend>
								</div>
								<div class="control-group">
									<!-- Text input-->
									<label class="control-label" for="input01">Customer ID</label> <input
										onchange="userIDChange(this,'userNamebyID')" type="text"
										placeholder="" class="input-xlarge" name="orderRecord.userID">
								</div>
								<div class="control-group">
									<!-- Text input-->
									<label class="control-label" for="input01">Customer Name</label> <input
										id="userNamebyID" readonly="readonly" type="text"
										style="background-color: #dfdfdf;" placeholder=""
										class="input-xlarge" name="orderRecord.userName" value="null">
								</div>
								<div class="control-group">
									<!-- Text input-->
									<label class="control-label" for="input01">Device ID</label> <input
										onchange="deviceIDChange(this,'deviceNamebyID')" type="text"
										placeholder="" class="input-xlarge" name="orderRecord.deviceID">
								</div>
								<div class="control-group">
									<!-- Text input-->
									<label class="control-label" for="input01">Device Name</label> <input
										id="deviceNamebyID" readonly="readonly" type="text"
										style="background-color: #dfdfdf;" placeholder=""
										class="input-xlarge" name="orderRecord.deviceName" value="null">
								</div>
								<div class="control-group">
									<!-- Text input-->
									<label class="control-label" for="input01">Price</label> <input
										type="text" placeholder="" class="input-xlarge"
										name="orderRecord.price">
								</div>
								<div class="control-group">
									<!-- Text input-->
									<label class="control-label" for="input01">Discount</label> <input
										type="text" placeholder="" class="input-xlarge"
										name="orderRecord.discount">
								</div>
								<div class="control-group">
									<!-- Text input-->
									<label class="control-label" for="input01">Order Date</label> <input
										type="date" placeholder="" class="input-xlarge"
										style="height: 26px;" name="orderRecord.time">
								</div>
								<div class="control-group" style="height: 75px;">
									<!-- Text input-->
									<label class="control-label" for="input01">Comments</label>
									<textarea class="input-xlarge" rows="3" cols="30"
										style="float: right; resize: none;" name="orderRecord.note"></textarea>
								</div>
								<div class="controls">
									<div id="submit" class="btn btn-success">Submit</div>
									<div id="cancel" class="btn btn-danger">Cancel</div>
								</div>
							</fieldset>
							<s:token></s:token>
						</form>
					</div>
				</div>
				<table class="table table-hover">
					<tr>
						<td>Order ID</td>
						<td>Customer ID</td>
						<td>Customer Name</td>
						<td>Device ID</td>
						<td>Device Name</td>
						<td>Discount</td>
						<td>Price</td>
						<td>Order Date</td>
						<td>Comments</td>
						<td>Order Options</td>
					</tr>
					<s:iterator value="#request.orderRecordList" id="orderRecordList"
						status="orders">
						<tr id="row<s:property value=" #orders.getIndex() "/>">
							<td><s:property value="#orderRecordList.id" /></td>
							<td><s:property value="#orderRecordList.userID" /></td>
							<td><s:property value="#orderRecordList.userName" /></td>
							<td><s:property value="#orderRecordList.deviceID" /></td>
							<td><s:property value="#orderRecordList.deviceName" /></td>
							<td><s:property value="#orderRecordList.discount" /></td>
							<td><s:property value="#orderRecordList.price" /></td>
							<td><s:property value="#orderRecordList.time" /></td>
							<td><s:property value="#orderRecordList.note" /></td>
							<td><a id="update<s:property value=" #orders.getIndex() "/>"
								class="btn btn-success tablebtn"
								onclick="edit(<s:property value=" #orders.getIndex() "/>)">
									<i class="glyphicon glyphicon-pencil"></i>Update
							</a> <a id="delete"
								href="deleteOrderRecordAction?id=<s:property value=" #orderRecordList.id " />"
								class="btn btn-danger tablebtn"> <i
									class="glyphicon glyphicon-remove"></i>Delete
							</a></td>
						</tr>
						<tr>
							<td class="nopadding" colspan="10">
								<div id="detail<s:property value=" #orders.getIndex() "/>"
									class="detail">
									<form action="editOrderRecordAction" method="post">
										<fieldset>
											<input type="hidden"
												value="<s:property value=" #orderRecordList.id " />"
												name="orderRecord.id">
											<div class="clearfix">
												<div class="detailitem">
													<label class="control-label" for="input01">Customer ID</label> <input
														onchange="userIDChange(this,'userNameEditByID<s:property value=" #orders.getIndex() "/>')"
														type="text" placeholder="" class="input-xlarge"
														style="margin-left: 1em;"
														value="<s:property value=" #orderRecordList.userID " />"
														name="orderRecord.userID">
												</div>
												<div class="detailitem">
													<label class="control-label" for="input01">Customer Name</label> <input
														id="userNameEditByID<s:property value=" #orders.getIndex() "/>"
														readonly="readonly" type="text" placeholder=""
														class="input-xlarge" style="margin-left: 1em;"
														value="<s:property value=" #orderRecordList.userName " />"
														name="orderRecord.userName">
												</div>
											</div>
											<div class="clearfix">
												<div class="detailitem">
													<label class="control-label" for="input01">Device ID</label> <input
														onchange="deviceIDChange(this,'deviceNameEditByID<s:property value=" #orders.getIndex() "/>')"
														type="text" placeholder="" class="input-xlarge"
														style="margin-left: 1em;"
														value="<s:property value=" #orderRecordList.deviceID " />"
														name="orderRecord.deviceID">
												</div>
												<div class="detailitem">
													<label class="control-label" for="input01">Device Name</label> <input
														id="deviceNameEditByID<s:property value=" #orders.getIndex() "/>"
														readonly="readonly" type="text" placeholder=""
														class="input-xlarge" style="margin-left: 1em;"
														value="<s:property value=" #orderRecordList.deviceName " />"
														name="orderRecord.deviceName">
												</div>
											</div>
											<div class="clearfix">
												<div class="detailitem">
													<label class="control-label" for="input01">Discount</label> <input
														type="text" placeholder="" class="input-xlarge"
														style="margin-left: 2em;"
														value="<s:property value=" #orderRecordList.discount " />"
														name="orderRecord.discount">
												</div>
												<div class="detailitem">
													<label class="control-label" for="input01">Price</label> <input
														type="text" placeholder="" class="input-xlarge"
														style="margin-left: 2em;"
														value="<s:property value=" #orderRecordList.price " />"
														name="orderRecord.price">
												</div>
											</div>
											<div class="clearfix">
												<div class="detailitem">
													<label class="control-label" for="input01">Comments</label>
													<textarea class="input-xlarge" rows="3" cols="30"
														type="text" class="input-xlarge"
														style="resize: none; margin-left: 2em;"
														name="orderRecord.note"><s:property
															value=" #orderRecordList.note " /></textarea>
												</div>
												<div class="detailitem">
													<label class="control-label" for="input01">Date</label> <input
														id="date" type="date" placeholder="" class="input-xlarge"
														style="margin-left: 2em;"
														value="<s:property value=" #orderRecordList.time " />"
														name="orderRecord.time">
												</div>
											</div>

											<div id="cancel<s:property value=" #orders.getIndex() "/>"
												class="btn btn-danger right detailbtn"
												onclick="cancel(<s:property value=" #orders.getIndex() "/>)">Cancel</div>
											<div id="submit<s:property value=" #orders.getIndex() "/>"
												class="btn btn-success right detailbtn"
												onclick="dataSubmit(<s:property value=" #orders.getIndex() " />)">Submit</div>
										</fieldset>
									</form>
								</div>
							</td>
						</tr>
					</s:iterator>
				</table>
				<%
					String temp = request.getParameter("page");
					int curPage;
					int maxPage;
					maxPage = (int) request.getAttribute("pageCount");
					if (temp == null) {
						curPage = 1;
					} else {
						curPage = Integer.parseInt(temp);
					}
				%>
				<nav>
					<ul class="pagination pages right">
						<%
							if (curPage == 1) {
						%>
						<li class="disabled"><a aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span></a></li>
						<%
							} else {
						%>
						<li><a href="viewOrderRecordAction?page=<%=curPage - 1%>"
							aria-label="Previous"><span aria-hidden="true">&laquo;</span>
						</a></li>
						<%
							}
						%>
						<li id="pageTab1"><a href="viewOrderRecordAction?page=1">1</a></li>
						<li id="leftDot"><a>...</a></li>
						<%
							for (int i = 2; i < maxPage; i++) {
						%>
						<li id="pageTab<%=i%>"><a
							href="viewOrderRecordAction?page=<%=i%>"> <%=i%>
						</a></li>
						<%
							}
						%>
						<li id="rightDot"><a>...</a></li>
						<%
							if (maxPage != 1) {
						%>
						<li id="pageTab<%=maxPage%>"><a
							href="viewOrderRecordAction?page=<%=maxPage%>"> <%=maxPage%>
						</a></li>
						<%
							}
							if (curPage == maxPage) {
						%>
						<li class="disabled"><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						<%
							} else {
						%>
						<li><a href="viewOrderRecordAction?page=<%=curPage + 1%>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
						<%
							}
						%>
					</ul>
				</nav>
				<script type="text/javascript">
                                    $(document).ready(function () {
                                        var current = <%=curPage%>;
                                        var max = <%=maxPage%>;
                                        if (current > 4) {
                                            for (var i = 2; i < current - 2; i++) {
                                                var pageTab = "pageTab" + i;
                                                $("#" + pageTab).remove();
                                            }
                                        } else {
                                            $("#leftDot").remove();
                                        }
                                        if (current < max - 3) {
                                            for (var i = max - 1; i > current + 2; i--) {
                                                var pageTab = "pageTab" + i;
                                                $("#" + pageTab).remove();
                                            }
                                        } else {
                                            $("#rightDot").remove();
                                        }
                                        var currentPage = "pageTab" + current;
                                        $("#" + currentPage).attr("class", "active");
                                        $("#" + currentPage).children().attr("href", "");
                                    });
                                </script>
				<div class="footer">
					<hr>
					<p>Created by Jeremy Zhang - 2016</p>
				</div>
			</div>
		</div>
	</div>
</body>

</html>