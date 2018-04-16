<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


</head>

<body>
<s:i18n name="ApplicationResources">
	<form action="sc.action" method="post">
		<div>
			<span><s:text name="shangchuan.uname"></s:text></span>
			<span><input type="text" name="name" /></span>
		</div>
		<div>
			<span><s:text name="shangchuan.bz"></s:text></span> <span><textarea rows="5" cols="10" name="beizhu"></textarea></span>
		</div>
		<div>
			<span><s:text name="shangchuan.sex"></s:text></span>
			<span><input type="radio" name="sex" value="1" /><s:text name="man"></s:text></span>
			<span><input type="radio" name="sex" value="0" /><s:text name="woman"></s:text></span>
		</div>
		<div>
			<span><s:text name="shangchuan.bobby"></s:text></span>
			<span><input type="checkbox"name="hobby" value="0"/><s:text name="shangchuan.hobby.lq"></s:text></span>
			<span><input type="checkbox"name="hobby" value="1"/><s:text name="shangchuan.hobby.zq"></s:text></span>
			<span><input type="checkbox"name="hobby" value="2"/><s:text name="shangchuan.hobby.ymq"></s:text></span>
		</div>
		<div><button type="submit"><s:text name="qr"></s:text></button></div>
	</form>
</s:i18n>
</body>
</html>