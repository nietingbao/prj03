<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>注册</title>
<style type="text/css">

*#space{white-space:pre; font-size:24px;}
*{margin:0px;}
.main{background:url(picture/register.jpg); width:1366px; height:693px; background-repeat:no-repeat;  position:relative;}
.main .title{position:absolute; right:350px; top:80px; font-size:36px; float:right;}
.main .form{width:500px; height:400px; border-style:solid; border-color:#00FFFF; border-width:2px; float:right; position:absolute; top:160px; right:200px;}
.main .form .form-in{margin-left:80px; margin-top:70px;}
*#in{height:35px; font-size:24px; width:220px;}
.main .form .btn{width:250px; height:40px; margin-left:150px; margin-top:35px; float:left; background-color:#999999; cursor:pointer; border-width:2px; border-color:#FFFFFF; border-style:solid;  font-size:24px;}
.main .form .btn:hover{width:265px; height:42px; background-color:#666666; font-size:30px;}
.main .form .btn .btnp{margin-top:5px; margin-left:100px;}
#w1{font-size:50px; position:absolute; left:200px; top:50px; background-color:#339999;color:#FFFFFF; }
#w2{font-size:50px; position:absolute; left:200px; top:110px; background-color:#339999;color:#FFFFFF;}
#w3{font-size:50px; position:absolute; left:200px; top:170px;  background-color:#339999;color:#FFFFFF;}
#w4{font-size:50px; position:absolute; left:200px; top:230px;  background-color:#339999;color:#FFFFFF;}
#w5{font-size:50px; position:absolute; left:200px; top:290px;  background-color:#339999;color:#FFFFFF;}
#w6{font-size:50px; position:absolute; left:200px; top:350px;  background-color:#339999;color:#FFFFFF;}
#t1{font-size:50px; position:absolute; left:100px; top:290px;  background-color:#339999;color:#FFFFFF;}
#t2{font-size:50px; position:absolute; left:100px; top:350px;  background-color:#339999;color:#FFFFFF;}
#t3{font-size:50px; position:absolute; left:100px; top:410px;  background-color:#339999;color:#FFFFFF;}
#t4{font-size:50px; position:absolute; left:100px; top:470px;  background-color:#339999;color:#FFFFFF;}
#t5{font-size:50px; position:absolute; left:100px; top:530px;  background-color:#339999;color:#FFFFFF;}
#t6{font-size:50px; position:absolute; left:100px; top:590px;  background-color:#339999;color:#FFFFFF;}
#w1:hover{font-size:60px;}
#w2:hover{font-size:60px;}
#w3:hover{font-size:60px;}
#w4:hover{font-size:60px;}
#w5:hover{font-size:60px;}
#w6:hover{font-size:60px;}
#t1:hover{font-size:60px;}
#t2:hover{font-size:60px;}
#t3:hover{font-size:60px;}
#t4:hover{font-size:60px;}
#t5:hover{font-size:60px;}
#t6:hover{font-size:60px;}
-->
</style>
<script type="text/javascript">  
   

	function func(){
		var sUserName = document.form2.busername.value;
      	var sPassword = document.form2.bpassword.value;
      	var qrmm=document.form2.mm2.value;
   			 if( sUserName=="" )
   				 {
   				   alert("please input username!");
      				 return false;
     			 }
		   	  if( sPassword=="" )
     			 {
     			  alert("please input password!");
   				   return false;
   				  }
   				   if( qrmm=="" )
     			 {
     			  alert("确认密码不能为空!");
   				   return false;
   				  }
   				  if(sPassword==qrmm){
   				 
                  form2.submit();
   				  }
   				  else alert("两次密码输入不同！")
			}
	

</script>

</head>

<body>
<div class="main">
    <div id="w1">谁</div><div id="w2">画</div><div id="w3">下</div><div id="w4">这</div><div id="w5">天</div><div id="w6">地</div>
	<div id="t1">又</div><div id="t2">画</div><div id="t3">下</div><div id="t4">我</div><div id="t5">和</div><div id="t6">你</div>
    <div class="title">
	个人中心注册
	</div> 
    <div class="form">
	    <div class="form-in">
		<form action="Adduser" method="post"  name="form2" >
		    <div id="space">账号 <input name="busername" type="text" maxlength="20" id="in" /></div>
            <br />
            <br />   
			<div id="space">密码 <input name="bpassword" type="password" maxlength="15" id="in" /></div>
            <br />
            <br />
			<div id="space">确认密码<input name="mm2" type="password" maxlength="15" id="in" /></div>
		</form> 
		</div>
		<div class="btn" onclick="func();">
		    <div class="btnp" >
			确认
		    </div>
		</div>
	</div>
</div>
</body>
</html>
