<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="assets/js/jquery-2.2.3.min.js"></script>
<title>test getUser by Ajax</title>
</head>
<body>
	<form id="userForm" method="get">
		<input type="text" name="id">
	</form>
	<button id="getBtn">Submit</button>
	<script>
		$("#getBtn").click(function() {
			var name = new Array();
			name = [ {
				name : 'id',
				value : '1'
			} ];

			$.get("getUserByIdAction", name, function(data, statusText) {
				console.log(data);

			}, "html");
		});
	</script>
</body>
</html>