<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.ssh.domain.DeviceImage"%>
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
<script src="assets/js/jquery.validate.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/table.js"></script>
<script src="assets/js/layer/layer.js"></script>
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/new.css" rel="stylesheet">
<script type="text/javascript">
/* 			$('newform').submit(function(){ 
				alert($(this).serialize()); 
				return false; 
				}); */
                    function edit(value) {
                        var txt = "detail" + value;
                        var data = "row" + value;
                        var door = $("#" + data).children("#doorData").html();
                        var seat = $("#" + data).children("#seatData").html();
                        $("#door" + value + " #" + door + "d").attr("selected", "true");
                        $("#seat" + value + " #" + seat + "p").attr("selected", "true");
                        $("#" + txt).slideToggle(500);
                    }

                    function showPic(value) {
                        layer.open({
                            type: 2,
                            title: false,
                            shadeClose: true,
                            shade: 0.8,
                            area: ["95%", '95%'],
                            content: 'viewDeviceImageAction?deviceModelId='+value
                        });
                    }
                </script>
</head>

<body class="admin">
	<%@include file="../navbar.jsp"%>
	<div></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 hidden-xs navlist">
				<div class="nav-list">
					<ul class="nav nav-list active menu">
						<li><a href="">Device Management</a></li>
					</ul>
					<ul class="nav nav-list menu">
						<li><a href="viewUserAction">Customer Management</a></li>
					</ul>
					<ul class="nav nav-list menu">
						<li><a href="viewOrderRecordAction">Order Management</a></li>
					</ul>
					<ul class="nav nav-list menu">
						<li><a href="dispatcherAction!goAddDeviceImage">Picture Upload</a></li>
					</ul>
				</div>
			</div>
			<div id="ajaxShow" class="col-sm-9 col-xs-12 list">
				<div>
					<button id="create" class="btn btn-warning createbtn ">
						<i class="glyphicon glyphicon-plus"></i>New
					</button>
					<div id="newform" class="header">
					<!-- 	<form action="addDeviceModelAction" method="post"> -->
					  	<form  action="addDeviceModelAction" method="post"> 
							<fieldset>
								<div>
									<legend class="">Add Device</legend>
								</div>
								<div>
									<label class="control-label" for="input01">Name</label> <input
										type="text" id = "name" placeholder="" class="input-xlarge"
										name="deviceModel.modelName">
								</div>
								<div class="row-fluid">
										<label class="control-label">Warranty</label>
										<select class="input-xlarge" id = "doorCount" name="deviceModel.doorCount">
											<option value="4">4</option>
											<option value="2">2</option>
										</select>
										<label class=" control-label">Brand</label>
										<select class="input-xlarge" id = "seatCount" name="deviceModel.seatCount">
											<option value="2">2</option>
											<option value="5">5</option>
											<option value="7">7</option>
											<option value="9">9</option>
										</select>
								</div>
								<div>
									<label class="control-label" for="input01">Price</label> <input
										type="text" placeholder="" id = "price" class="input-xlarge"
										name="deviceModel.price">
								</div>
								<div>
									<label class="control-label" for="input01">Number</label> <input
										type="text" placeholder="" id = "enginSpeed" class="input-xlarge"
										name="deviceModel.engineSpeed">
								</div>
								<div>
									<label class="control-label" for="input01">Model</label> <input
										type="text" placeholder="" id = "color" class="input-xlarge"
										name="deviceModel.color">
								</div>
								<div>
									<label class="control-label" for="input01">Stock#</label> <input
										type="text" placeholder="" id = "storage" class="input-xlarge"
										name="deviceModel.storage">
								</div>
								<div class="controls">
<!-- 								    <input type="button" id = "addajax" value="add" onClick="addcall();" class="button">
								    <input type="cancel" class="btn btn-danger" value="cancel"/> -->
									<div id="submit" class="btn btn-success">Submit</div>
									<div id="cancel" class="btn btn-primary">Cancel</div>
								</div>
							</fieldset>
							<s:token></s:token>
						</form>
					</div>
				</div>
				<div id = "showDevice">
					<table class="table table-hover">
						<tr>
							<td></td>
							<td>ID</td>
							<td>Name</td>
							<td>Warranty</td>
							<td>Brand</td>
							<td>Price</td>
							<td>Number</td>
							<td>Model</td>
							<td>Stock#</td>
							<td>Operation</td>
						</tr>
						<s:iterator value="#request.deviceModelList" id="deviceModelList"
							status="devices">
							<tr id="row<s:property value=" #devices.getIndex() "/>">
								<td><button data="<s:property value="#deviceModelList.id" />"
										onclick="showPic(<s:property value=" #deviceModelList.id"/>)">
										<i class="glyphicon glyphicon-picture"></i>
									</button></td>
								<td><s:property value="#deviceModelList.id" /></td>
								<td><s:property value="#deviceModelList.modelName" /></td>
								<td id="doorData"><s:property
										value="#deviceModelList.doorCount" /></td>
								<td id="seatData"><s:property
										value="#deviceModelList.seatCount" /></td>
								<td><s:property value="#deviceModelList.price" /></td>
								<td><s:property value="#deviceModelList.engineSpeed" /></td>
								<td><s:property value="#cdeviceModelList.color" /></td>
								<td><s:property value="#deviceModelList.storage" /></td>
								<td><a id="update<s:property value=" #devices.getIndex() "/>"
									class="btn btn-success tablebtn"
									onclick="edit(<s:property value=" #devices.getIndex() "/>)"> <i
										class="glyphicon glyphicon-pencil"></i>Update
								</a> <a id="delete"
									href="deleteDeviceModelAction?id=<s:property value=" #deviceModelList.id " />"
									class="btn btn-danger tablebtn"> <i
										class="glyphicon glyphicon-remove"></i>Delete
								</a></td>
							</tr>
							<tr>
								<td class="nopadding" colspan="10">
									<div id="detail<s:property value=" #devices.getIndex() "/>"
										class="detail">
										<form action="editDeviceModelAction" method="post">
											<fieldset>
												<input type="hidden"
													value="<s:property value=" #deviceModelList.id " />"
													name="deviceModel.id">
												<div class="clearfix">
													<!-- Text input-->
													<div class="detailitem">
														<label class="control-label" for="input01">Name</label> <input
															type="text" placeholder="" class="input-xlarge"
															style="margin-left: 2em;"
															value="<s:property value=" #deviceModelList.modelName " />"
															name="deviceModel.modelName">
													</div>

													<div class="detailitem">
														<label class="control-label" for="input01">Model</label> <input
															type="text" placeholder="" class="input-xlarge"
															style="margin-left: 3em;"
															value="<s:property value=" #deviceModelList.color " />"
															name="deviceModel.color">
													</div>
												</div>
												<div class="clearfix">
													<div class="detailitem">
														<label class="control-label">Warranty</label> <select
															id="door<s:property value=" #devices.getIndex() "/>"
															class="input-xlarge" style="margin-left: 3em;"
															name="deviceModel.doorCount">
															<option id="4d" value="4">4</option>
															<option id="2d" value="2">2</option>
														</select>
													</div>
													<div class="detailitem">
														<label class="control-label">Brand</label> <select
															id="seat<s:property value=" #devices.getIndex() "/>"
															class="input-xlarge" style="margin-left: 2em;"
															name="deviceModel.seatCount">
															<option id="2p" value="2">2</option>
															<option id="5p" value="5">5</option>
															<option id="7p" value="7">7</option>
															<option id="9p" value="9">9</option>
														</select>
													</div>
												</div>
												<div class="clearfix">
													<div class="detailitem">
														<label class="control-label" for="input01">Price</label> <input
															type="text" placeholder="" class="input-xlarge"
															style="margin-left: 3em;"
															value="<s:property value=" #deviceModelList.price " />"
															name="deviceModel.price">
													</div>
													<div class="detailitem">
														<label class="control-label" for="input01">Number</label> <input
															type="text" placeholder="" class="input-xlarge"
															value="<s:property value=" #deviceModelList.engineSpeed " />">
													</div>
												</div>
												<div class="clearfix">
													<div class="detailitem">
														<label class="control-label" for="input01">Stock#</label> <input
															type="text" placeholder="" class="input-xlarge"
															style="margin-left: 3em;"
															value="<s:property value=" #deviceModelList.storage " />"
															name="deviceModel.storage">
													</div>
												<div class="clearfix">
													<div id="submit<s:property value=" #devices.getIndex() "/>"
														class="btn btn-success detailbtn"
														onclick="dataSubmit(<s:property value=" #devices.getIndex() " />)">Submit</div>
													</div>
													<div id="cancel<s:property value=" #devices.getIndex() "/>"
														class="btn btn-danger detailbtn"
														onclick="cancel(<s:property value=" #devices.getIndex() "/>)">Cancel</div>
												</div>
											</fieldset>
										</form>
									</div>
								</td>
							</tr>
						</s:iterator>
					</table>
				</div>
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
						<li><a href="viewDeviceModelAction?page=<%=curPage - 1%>"
							aria-label="Previous"><span aria-hidden="true">&laquo;</span>
						</a></li>
						<%
							}
						%>
						<li id="pageTab1"><a href="viewDeviceModelAction?page=1">1</a></li>
						<li id="leftDot"><a>...</a></li>
						<%
							for (int i = 2; i < maxPage; i++) {
						%>
						<li id="pageTab<%=i%>"><a
							href="viewDeviceModelAction?page=<%=i%>"> <%=i%>
						</a></li>
						<%
							}
						%>
						<li id="rightDot"><a>...</a></li>
						<%
							if (maxPage != 1) {
						%>
						<li id="pageTab<%=maxPage%>"><a
							href="viewDeviceModelAction?page=<%=maxPage%>"> <%=maxPage%>
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
						<li><a href="viewDeviceModelAction?page=<%=curPage + 1%>"
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