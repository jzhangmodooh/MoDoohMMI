<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                function edit(value) {
                    var txt = "detail" + value;
                    var data = "row" + value;
                    var gender = $("#" + data).children("#genderData").html();
                    $("#gender" + value + " #" + gender).attr("selected", "true");
                    $("#" + txt).slideToggle(500);
                }
            </script>
        </head>

        <body class="admin">
            <%@include file="../navbar.jsp"%>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-3 hidden-xs navlist">
                            <div class="nav-list">
                                <ul class="nav nav-list menu">
                                    <li><a href="viewDeviceModelAction">Device Management</a></li>
                                </ul>
                                <ul class="nav nav-list active menu">
                                    <li><a href="">Customer Management</a></li>
                                </ul>
                                <ul class="nav nav-list menu">
                                    <li><a href="viewOrderRecordAction">Order Management</a></li>
                                </ul>
                                <ul class="nav nav-list menu">
                                    <li><a href="dispatcherAction!goAddDeviceImage">Picture Upload</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-9 col-xs-12 list">
                            <div>
                                <button id="create" class="btn btn-warning createbtn ">
                                    <i class="glyphicon glyphicon-plus"></i>New
                                </button>
                                <div id="newform" class="header">
                                    <form class="form-horizontal" action="addUserAction" method="post">
                                        <fieldset>
                                            <div id="legend" name="user.id">
                                                <legend class="">New Customer</legend>
                                            </div>
                                            <div class="control-group">
                                                <!-- Text input-->
                                                <label class="control-label" for="input01">Name</label>
                                                <input type="text" placeholder="" class="input-xlarge" name="user.name">
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Gender</label>
                                                <select class="input-xlarge" style="float: right;" name="user.gender">
                                                    <option id="male">Male</option>
                                                    <option id="female">Female</option>
                                                    <option id="other">other</option>
                                                </select>
                                            </div>
                                            <div class="control-group">
                                                <!-- Text input-->
                                                <label class="control-label" for="input01">Phone Number</label>
                                                <input type="text" placeholder="" class="input-xlarge" name="user.phone">
                                            </div>
                                            <div class="control-group">
                                                <!-- Text input-->
                                                <label class="control-label" for="input01">E-mail</label>
                                                <input type="text" placeholder="" class="input-xlarge" name="user.email">
                                            </div>
                                            <div class="control-group">
                                                <!-- Text input-->
                                                <label class="control-label" for="input01">Age</label>
                                                <input type="text" placeholder="" class="input-xlarge" name="user.age">
                                            </div>
                                            <div class="control-group">
                                                <!-- Text input-->
                                                <label class="control-label" for="input01">Address</label>
                                                <input type="text" placeholder="" class="input-xlarge" name="user.address">
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
                                    <td>ID</td>
                                    <td>Name</td>
                                    <td>Gender</td>
                                    <td>Phone Number</td>
                                    <td>E-Mail</td>
                                    <td>Age</td>
                                    <td>Address</td>
                                    <td>Update</td>
                                </tr>
                                <s:iterator value="#request.userList" id="userList" status="users">
                                    <tr id="row<s:property value=" #users.getIndex() "/>">
                                        <td><s:property value="#userList.id" /></td>
                                        <td><s:property value="#userList.name" /></td>
                                        <td id="genderData"><s:property value="#userList.gender" /></td>
                                        <td><s:property value="#userList.phone" /></td>
                                        <td><s:property value="#userList.email" /></td>
                                        <td><s:property value="#userList.age" /></td>
                                        <td><s:property value="#userList.address" /></td>
                                        <td>
                                            <a id="update<s:property value=" #users.getIndex() "/>" class="btn btn-success tablebtn" onclick="edit(<s:property value=" #users.getIndex() "/>)"> <i class="glyphicon glyphicon-pencil"></i>Update
                                            </a>
                                            <a id="delete" href="deleteUserAction?id=<s:property value=" #userList.id " />" class="btn btn-danger tablebtn"> <i class="glyphicon glyphicon-remove"></i>Delete
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="nopadding" colspan="8">
                                            <div id="detail<s:property value=" #users.getIndex() "/>" class="detail">
                                                <form action="editUserAction" method="post">
                                                    <fieldset>
                                                        <input type="hidden" value="<s:property value=" #userList.id " />" name="user.id">
                                                        <div class="clearfix">
                                                            <div class="detailitem">
                                                                <label class="control-label" for="input01">Name</label>
                                                                <input type="text" placeholder="" class="input-xlarge" style="margin-left: 2em;" value="<s:property value=" #userList.name " />" name="user.name">
                                                            </div>
                                                            <div class="detailitem">
                                                                <label class="control-label">Gender</label>
                                                                <select id="gender<s:property value=" #users.getIndex() "/>" class="input-xlarge" name="user.gender" style="margin-left: 2em;" name="user.gender">
                                                                    <option id="male">Male</option>
                                                                    <option id="female">Female</option>
                                                                    <option id="other">Other</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix">
                                                            <div class="detailitem">
                                                                <label class="control-label" for="input01">Phone Number</label>
                                                                <input type="text" placeholder="" class="input-xlarge" style="margin-left: 1em;" value="<s:property value=" #userList.phone " />"name="user.phone">
                                                            </div>
                                                            <div class="detailitem">
                                                                <label class="control-label" for="input01">E-Mail</label>
                                                                <input type="text" placeholder="" class="input-xlarge" style="margin-left: 0em;" value="<s:property value=" #userList.email " />" name="user.email">
                                                            </div>
                                                        </div>
                                                        <div class="clearfix">
                                                            <div class="detailitem">
                                                                <label class="control-label" for="input01">Age</label>
                                                                <input type="text" placeholder="" class="input-xlarge" style="margin-left: 2em;" value="<s:property value=" #userList.age " />" name="user.age">
                                                            </div>
                                                            <div class="detailitem">
                                                                <label class="control-label" for="input01">Address</label>
                                                                <input type="text" placeholder="" class="input-xlarge" style="margin-left: 2em;" value="<s:property value=" #userList.address " />"name="user.address">
                                                            </div>
                                                        </div>
                                                        <div class="clearfix">
                                                            <div id="submit<s:property value=" #users.getIndex() "/>" class="btn btn-success right detailbtn" onclick="dataSubmit(<s:property value=" #users.getIndex() " />)">Submit</div>
                                                        </div>
                                                        <div class="clearfix">
                                                            <div id="cancel<s:property value=" #users.getIndex() "/>" class="btn btn-danger right detailbtn" onclick="cancel(<s:property value=" #users.getIndex() "/>)">Cancel</div>
                                                        </div>
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
                                            <li class="disabled">
                                                <a aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
                                            </li>
                                            <%
						} else {
					%>
                                                <li><a href="viewUserAction?page=<%=curPage - 1%>" aria-label="Previous"><span aria-hidden="true">&laquo;</span>
					</a></li>
                                                <%
						}
					%>
                                                    <li id="pageTab1"><a href="viewUserAction?page=1">1</a></li>
                                                    <li id="leftDot"><a>...</a></li>
                                                    <%
						for (int i = 2; i < maxPage; i++) {
					%>
                                                        <li id="pageTab<%=i%>">
                                                            <a href="viewUserAction?page=<%=i%>">
                                                                <%=i%>
                                                            </a>
                                                        </li>
                                                        <%
						}
					%>
                                                            <li id="rightDot"><a>...</a></li>
                                                            <%
						if (maxPage != 1) {
					%>
                                                                <li id="pageTab<%=maxPage%>">
                                                                    <a href="viewUserAction?page=<%=maxPage%>">
                                                                        <%=maxPage%>
                                                                    </a>
                                                                </li>
                                                                <%
						}
						if (curPage == maxPage) {
					%>
                                                                    <li class="disabled">
                                                                        <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                                                        </a>
                                                                    </li>
                                                                    <%
						} else {
					%>
                                                                        <li>
                                                                            <a href="viewUserAction?page=<%=curPage + 1%>" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                                                            </a>
                                                                        </li>
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