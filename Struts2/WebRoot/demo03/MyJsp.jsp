<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'MyJsp.jsp' starting page</title>

</head>

<body>
	<div>
		<form action="demo3.action" method = "post">
			<div>
				名称：<input type="text" name="uname" />
			</div>
			<div>
				备注：<textarea rows="3" cols="5" name="bz"></textarea>
			</div>
			<div>
				<input type="radio" name="sex" value="from.sex1" />man
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="sex" value="from.sex2" />woman
			<div>
				<input type="checkbox" name="hobby" value="form.hobby1"/>basketball
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="hobby" value="form.hobby2"/>football
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="hobby" value="form.hobby3"/>badminton
			</div>
			<div>
			<button type="submit">submit</button>
			</div>
		</form>
	</div>
</body>
</html>
