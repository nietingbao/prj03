<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addschedual.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="AddSchedual" name="form" method="post">
    	<table>
    		<tr>
    			<td>输入日期</td>
    			<td><input type="text" name="date"></td>    			
    		</tr>	
    		<tr>
    			<td>输入安排</td>
    			<td><input type="text" name="arrange"></td>
    		</tr>
    		<tr>
    			<td>输入用户名</td>
    			<td><input type="text" name="username"></td>
    			<td><input type="submit" value="add" onclick="func();"> </td>
    		</tr>
    	</table>
    </form>
     <script type="text/javascript">
   function func(){
   var date=document.form.date.value;
   var user=document.form.username.value;
   var arr=document.form.arrange.value;
   if(date==""){
   alert("please input schedual!");
   return false;
   } 
    if(user==""){
   alert("please input user!");
   return false;
   }  
   if(arr==""){
   alert("please input arrange");
   return false;
   } 
   }
   </script>
  </body>
</html>
