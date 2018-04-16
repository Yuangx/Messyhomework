<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
    <s:form action="login" method="post">
    	<s:textfield label="设置logined即登陆" name="isLogin"></s:textfield>
    	<s:submit></s:submit>
    </s:form>
  </body>
</html>
