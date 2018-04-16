<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
    <div>
    	<from action = "re_type.action" method = "post">
    		<div>
    			输入Type类型：<input type ="text" name = "rs_tName"/>
    		</div>
    		<div>
    			<input type ="submit" name = "提交查看type结果"/>
    		</div>
    	</from>
    </div>
  </body>
</html>
