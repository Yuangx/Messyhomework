<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	
  </head>
  
  <body>
  <!-- 使用占位符的国际化资源文件传值 -->
  <s:text name = "zhanweifu">
 	<s:param>传入资源文件的{0}的位置上</s:param>
 	<s:param>传入资源文件的{1}的位置上</s:param>
  </s:text>
  <hr/>
  	<!-- 指定使用自定义国际化文件MyResource.properties
  	<s:i18n name="MyResource">
  		<s:text name="MyResource"></s:text>
  	</s:i18n>
  	-->
  <hr/>
  <s:form action = "sc" method = "post">
  	<s:textfield name = "name" key = "indexFrm.userName"/>name使用国际化的key属性><br/>
  	<s:textfield name = "psw" label = "%{getText('indexFrm.passWord')}"/>psw使用了OGNL表达式获取国际化属性
  	<s:submit></s:submit>
  </s:form>
  </body>
</html>
