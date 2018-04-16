<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
  </head>
  
  <body>
  	<!-- 需要上传文件时，增加enctype="multipart/from-data" -->
    <from action="upAction" method="post" enctype="multipart/from-data">
    	<!-- 上传按钮 -->
    	<input type="file" name="fileUp"/>
    	<br />
    	<input type="submit">
    </from>
  </body>
</html>
