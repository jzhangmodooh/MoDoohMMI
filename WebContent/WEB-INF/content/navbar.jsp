<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index">MoDooh</a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<%
					if (session.getAttribute("name") == null) {
				%>
				<li id="login"><a href="login">Login</a></li>
				<%
					} else {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Management Center<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="viewDeviceModelAction">Device Management</a></li>
						<li><a href="viewUserAction">Customer Management</a></li>
						<li><a href="viewOrderRecordAction">Order Management</a></li>
						<li><a href="dispatcherAction!goAddDeviceImage">Picture Upload</a></li>
					</ul></li>
				<li><a href="logoutAdminAction"><span
						class="glyphicon glyphicon-remove"></span> Log out</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</div>