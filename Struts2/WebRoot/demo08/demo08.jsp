<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  </head>
  
  <body>
    <s:form action="myInter" method="post">
		<s:textfield name="name" label="Check the console after typing"></s:textfield>
		<s:submit></s:submit>
	</s:form>
  </body>
</html>
