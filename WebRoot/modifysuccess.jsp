
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸�</title>
<style type="text/css">
<!--
*{margin:0px;}
.top{width:100%; height:100px; background-color:#0066FF;}
.top .topp{height: 44px;margin-top:25px;margin-left:10px;padding-left:100px;float: left;overflow: hidden;font-size: 40px; color:#FFFFFF;}
.yhy{height:592px; width:236px; background-color:#0099FF; position:relative;}
.yhy .toup{position:absolute; top:10px; left:8px;} 
.yhy .yhm{position:absolute; top:260px; left:18px; font-size:24px;}
.yhy .ck{position:absolute; top:310px; left:18px; font-size:24px; height:30px; width:200px; cursor:pointer; color:#FFFFFF;}
.yhy .lr{position:absolute; top:360px; left:18px;  font-size:24px; height:30px; width:200px;cursor:pointer; color:#FFFFFF;}
.yhy .sc{position:absolute; top:410px; left:18px;  font-size:24px; height:30px; width:200px;cursor:pointer; color:#FFFFFF;}
.yhy .cd{position:absolute; top:460px; left:18px;  font-size:24px; height:30px; width:200px;cursor:pointer; color:#FFFFFF;}
.yhy .lr:hover{font-size:27px;}
.yhy .ck:hover{font-size:27px;}
.yhy .sc:hover{font-size:27px;}
.yhy .cd:hover{font-size:27px;}
.text{position:absolute; top:100px; left:236px; height:592px; width:1130px;}
.text .textp{position:absolute; top:200px; left:200px; font-size:36px; color:#333333;}
-->
</style>
</head>

<body>
<div class="top">
      <div class="topp">
       �ճ̰�������
      </div>
</div>
<div class="yhy">
  
       <div class="toup">
	   <img src="picture/u=2496618007,3190450108&amp;fm=21&amp;gp=0.jpg" />
	   </div>
	   <div class="yhm">
	  <%String username=(String)session.getAttribute("Username"); %>
	   �ǳƣ�<%=username %> 
	   </div>
	   <div class="ck" onclick="window.location.href='check.html';return false">
	   �鿴�ճ�
	   </div>
	   <div class="lr" onclick="window.location.href='entering.html';return false">
	   ¼���ճ�
	   </div>
	   <div class="sc" onclick="window.location.href='delete.html';return false">
	   ɾ���ճ�
	   </div>
	   <div class="cd" onclick="window.location.href='menu.html';return false">
	   ���ز˵�
	   </div>
</div>
<div class="text"> 
       <div class="textp">�޸ĳɹ���</div>
</div>
</body>
</html>
