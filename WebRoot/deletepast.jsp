<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>删除</title>
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
.lr{position:absolute; top:100px; left:236px; height:592px; width:1130px; }
.lr .title{position:absolute; top:50px; left:400px; font-size:40px;}
.lr .rqn{position:absolute; top:200px; left:50px; font-size:30px;}
.lr .rqy{position:absolute; top:200px; left:300px; font-size:30px;}
.lr .rqd{position:absolute; top:200px; left:550px; font-size:30px;}
*#ss{width:120px; height:30px; border-color:#CCCCCC;  font-size:20px;}

.lr .cxbtn{width:60px; height:35px; position:absolute; top:200px; right:250px; font-size:30px; border-style:solid; border-color:#999999; border-width:1px; background-color:#CCCCCC; cursor:pointer;}
.lr .cxbtn:hover{width:65px; height:38px; background-color:#999999;}
.lr .rq{position:absolute; top:150px; left:20px; font-size:25px;}
.lr .kk{position:absolute; top:280px; left:20px; font-size:25px;}
.lr .xgk{position:absolute; top:320px; left:80px;}
#xgk{border-color:#CCCCCC; font-size:20px;}
#xgk:hover{ background-color:#CCCCCC;}
.lr .tjbtn{position:absolute; top:500px; right:180px; font-size:30px; border-style:solid; border-color:#999999; border-width:1px; background-color:#CCCCCC; cursor:pointer; } 
.lr .tjbtn:hover{width:125px; height:38px; background-color:#999999;}
</style>
<script type="text/javascript">
function onsend(){
     document.form5.action="Delete"; 
     document.form5.submit();
	  
}
</script>
</head>

<body>
<div class="top">
      <div class="topp">
       日程安排中心
      </div>
</div>
<div class="yhy">
  
       <div class="toup">
	   <img src="picture/u=2496618007,3190450108&amp;fm=21&amp;gp=0.jpg" />
	   </div>
	   <div class="yhm">
	  <%String username=(String)session.getAttribute("Username"); %>
	   昵称：<%=username %> 
	   </div>
	   <div class="ck" onclick="window.location.href='check.html';return false">
	   查看日程
	   </div>
	   <div class="lr" onclick="window.location.href='entering.html';return false">
	   录入日程
	   </div>
	   <div class="sc" onclick="window.location.href='delete.html';return false">
	   删除日程
	   </div>
	   <div class="cd" onclick="window.location.href='menu.html';return false">
	   返回菜单
	   </div>
</div>
<div class="lr">
       <div class="title">删除日程</div>
	   <div class="rq">已选择的日程日期：</div>
       <form name="form5" method="post" >
       <div class="rqn">
	   年：  <%String Y=(String)session.getAttribute("Y"); %>
		<%=Y %>
	   
	  
	   </div>
	 
	   <div class="rqy">
	   月： <%String M=(String)session.getAttribute("M"); %>
		<%=M %>
	 
	   </div>
	   <div class="rqd">
	   日： <%String D=(String)session.getAttribute("D"); %>
		<%=D %>
	   </div>
	   
        
		
		
		<div class="xgk" id="inner"> 
	        <textarea name="text2" cols="70" rows="10" id="xgk">
	        <%String arr=(String)session.getAttribute("Arrange"); %>
		<%=arr %></textarea>
	        
	    </div>
	   </form>
	  
	   <div class="tjbtn" onclick="onsend()">确认删除</div>
</body>
</html>
