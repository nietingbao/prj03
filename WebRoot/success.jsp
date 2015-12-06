<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />

<title>个人中心</title>
<style type="text/css">
<!--
*{margin:0px;}
.top{width:100%; height:100px; background-color:#0066FF;}
.top .topp{height: 44px;margin-top:25px;margin-left:10px;padding-left:100px;float: left;overflow: hidden;font-size: 40px; color:#FFFFFF;}
.yhy{height:592px; width:236px; background-color:#0099FF; position:relative;}
.menu{background-image:url(/prj03/picture/235039-14031614232010.jpg); height:592px; width:1130px; top:100px; left:236px; position:absolute;}
.yhy .toup{position:absolute; top:100px; left:8px;} 
.yhy .yhm{position:absolute; top:350px; left:18px; font-size:24px;}
.yhy .mm{position:absolute; top:400px; left:18px; font-size:24px; height:30px; width:200px; cursor:pointer; color:#FFFFFF;}
.yhy .sm{position:absolute; top:450px; left:18px;  font-size:24px; height:30px; width:200px;cursor:pointer; color:#FFFFFF;}
.menu .ck{position:absolute; height:150px; width:300px; background-color:#FFCCFF; top:45px; left:95px; font-size:40px; cursor:pointer;}
.menu .lr{position:absolute; height:150px; width:300px; background-color:#00FF99; top:45px; left:702px; font-size:40px; cursor:pointer;}
.menu .xg{position:absolute; height:150px; width:300px; background-color:#FFCC33; top:355px; left:95px; font-size:40px; cursor:pointer;}
.menu .sc{position:absolute; height:150px; width:300px; background-color:#66CC00; top:355px; left:705px; font-size:40px; cursor:pointer;}
.menu .rl{position:absolute; height:150px; width:300px; background-color:#99CCFF; top:200px; left:400px; font-size:40px; cursor:pointer;}
.menu .k1{position:absolute; height:150px; width:300px; top:45px; left:400px; background-color:#009999;}
.menu .k2{position:absolute; height:150px; width:300px; top:200px; left:95px; background-color:#669933;}
.menu .k3{position:absolute; height:150px; width:300px; top:200px; left:705px; background-color:#CC9900;}
.menu .k4{position:absolute; height:150px; width:300px; top:355px; left:400px; background-color:#CC6633;}
*#pp{margin-left:50px; margin-top:47px;}
.menu .ck:hover{ width:305px; height:155px; font-size:43px;}
.menu .lr:hover{width:305px; height:155px; font-size:43px;}
.menu .xg:hover{width:305px; height:155px; font-size:43px;}
.menu .sc:hover{width:305px; height:155px; font-size:43px;}
.menu .rl:hover{width:305px; height:155px; font-size:43px;}
.yhy .mm:hover{font-size:27px;}
.yhy .sm:hover{font-size:27px;}
/*<!--下面的是点击查看日程之后跳出弹框显示输入的样式-->*/
#checkOut{
	background:rgba(23,23,198,0.3);
	display: none;
	width: 1366px;
	height: 692px;
	position: absolute;
	top: 0px;
	left: 0px;
}
#checkOut_k{
	width: 500px;
	height: 400px;
	position: absolute;
	top: 120px;
	left: 450px;
	background-color: lightskyblue;
	background-color: #00FFFF;
	border-radius: 20px;
	border-color: #FFFFFF;
	border-width: 1px;
	border-style: solid;
}
p{
	font-size: 30px;
	position: absolute;
	top: 40px;
	left: 30px;
}
#checkOut_k_x{
	font-size: 30px;
}
form{
	position: absolute;
	top: 140px;
	left: 80px;
}
select{
	width: 200px;
	height: 40px;
	border-radius: 5px;
	font-size: 20px;
	background-color: #eeeeee;
}
#checkOut_k_tj {
	position: absolute;
	width: 100px;
	height: 50px;
	border-radius: 6px;
	background-color: blanchedalmond;
	top: 320px;
	right: 50px;
	cursor: pointer;
}
#tp{
	position: absolute;
	top: 0;
	right: 0px;
	cursor: pointer;
}
#tp img:hover{
	width: 35px;
	height: 32px;
}
#jz{
	margin-top: 8px;
	margin-left: 20px;
}
#checkOut_k_tj:hover{
	background-color: darksalmon;
}
#alert{
	color: #FF0000;
	font-size: 20px;
	display: none;
	position: absolute;

}
-->

</style>
<script type="text/javascript">
		function oDivCheck(){
			var q=document.getElementById("checkOut");
			q.style.display='block';

		}
		function oDivCheckClose(){
			var q=document.getElementById("checkOut");
			q.style.display='none';
		}
		moothname=new Array(2);
		moothcode=new Array(2);
		function first(preP,preC,formname,selectP,selectC)
		{
			a=0;
			if (selectP=="01")
			{ a=1;tempoption=new Option("2015","2015",false,true); }
			else
			{ tempoption=new Option("2015","2015"); }
			eval("document."+formname+"."+preP+".options[1]=tempoption;");
			moothcode[0]=new Array("11","12");
			moothname[0]=new Array("11","12");
			if (selectP=='02')
			{ a=2;tempoption=new Option("2016","2016",false,true); }
			else
			{ tempoption=new Option("2016","2016"); }
			eval("document."+formname+"."+preP+".options[2]=tempoption;");
			moothcode[1]=new Array("01","02","03","04","05","06","07","08","09","10");
			moothname[1]=new Array("01","02","03","04","05","06","07","08","09","10");
			eval("document."+formname+"."+preP+".options[a].selected=true;");
			yearid=selectP;
			if (moothid!="0")
			{
				b=0;for (i=0;i<moothname[yearid-1].length;i++)
			{
				if (selectC==moothcode[yearid-1][i])
				{b=i+1;tempoption=new Option(moothname[yearid-1][i],moothcode[yearid-1][i],false,true);}
				else
					tempoption=new Option(moothname[yearid-1][i],moothcode[yearid-1][i]);
				eval("document."+formname+"."+preC+".options[i+1]=tempoption;");
			}
				eval("document."+formname+"."+preC+".options[0].selected=true;");
			}
		}
		function selectcityarea(preP,preC,formname)
		{
			yearid=eval("document."+formname+"."+preP+".selectedIndex;");
			j=eval("document."+formname+"."+preC+".length;");
			for (i=1;i<j;i++)
			{eval("document."+formname+"."+preC+".options[j-i]=null;")}
			if (yearid!="0")
			{
				for (i=0;i<moothname[yearid-1].length;i++)
				{
					tempoption=new Option(moothname[yearid-1][i],moothcode[yearid-1][i]);
					eval("document."+formname+"."+preC+".options[i+1]=tempoption;");
				}
			}
		}
		function fsubmit(){
			oIda=document.getElementById("alert");
			if(document.form7.selecty.selectedIndex==0||document.form7.selectm.selectedIndex==0)
			{
				oIda.style.top='235px';
				oIda.style.right='10px';
				oIda.style.display='block';
			}
			else form7.submit();
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
	   <img src="/prj03/picture/u=2496618007,3190450108&amp;fm=21&amp;gp=0.jpg" />
	   </div>
	   <div class="yhm">
	   <%String username=(String)session.getAttribute("Username"); %>
	   昵称：<%=username %> 
	   </div>
	   <div class="mm" onclick="window.location.href='passwordchange.html';return false">
	   修改密码
	   </div>
	   <div class="sm" onclick="window.location.href='explaination.html';return false">
	   站点使用说明
	   </div>
</div>
<div class="menu">
       <div class="ck" onclick="oDivCheck()">
	   <div id="pp"><img src="/prj03/picture/resizeApi (1).png" />查看日程</div>
	   </div>
	   <div class="lr" onclick="window.location.href='/prj03/entering.jsp';return false">
	   <div id="pp"><img src="/prj03/picture/resizeApi (4).png" />录入日程</div>
	   </div>
	   <div class="rl" onclick="window.location.href='calendar.html';return false">
	   <div id="pp"><img src="/prj03/picture/resizeApi (3).png" />日历表</div>
	   </div>
	   <div class="xg" onclick="window.location.href='/prj03/modify.jsp';return false">
	   <div id="pp"><img src="/prj03/picture/resizeApi (5).png" />修改日程</div>
	   </div>
	   <div class="sc" onclick="window.location.href='/prj03/delete.jsp';return false">
	   <div id="pp"><img src="/prj03/picture/resizeApi.png" />删除日程</div>
	   </div>
	   <div class="k1"> 
	   </div>
	   <div class="k2"> 
	   </div>
	   <div class="k3"> 
	   </div>
	   <div class="k4"> 
	   </div>
</div> 
<div id="checkOut">
	<div id="checkOut_k">
		<div id="checkOut_k_x">
			<p>请选择查询的年份和月份</p>
			<form action="InquireServlet" method="post" name="form7">
				年：
				<select name="selecty" id="selecty" onChange="selectcityarea('selecty','selectm','form7');">
					<option value="0" selected="selected">-请选择-</option>
				</select>
				<br/><br/>
				月：
				<select name="selectm" id="sr">
				<option value="0" selected="selected">-请选择-</option>
			</select>
			</form>
			<div id="alert">
                 未正确选择！
			</div>
			<div id="tp" onclick="oDivCheckClose()"><img src="picture/resizeApiqq.png" ></div>
			<div id="checkOut_k_tj" onclick="fsubmit();"><div id="jz">查询</div></div>
		</div>
	</div>
</div>
<script language="javascript">
	first("selecty","selectm","form7",0,0);
</script>
  </body>
</html>
