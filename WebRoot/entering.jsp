<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>录入</title>
<style type="text/css">
<!--
*{margin:0px;}
.top{width:100%; height:100px; background-color:#0066FF;}
.top .topp{height: 44px;margin-top:25px;margin-left:10px;padding-left:100px;float: left;overflow: hidden;font-size: 40px; color:#FFFFFF;}
.yhy{height:592px; width:236px; background-color:#0099FF; position:relative;}
.yhy .toup{position:absolute; top:10px; left:8px;} 
.yhy .yhm{position:absolute; top:260px; left:18px; font-size:24px;}
.yhy .ck{position:absolute; top:310px; left:18px; font-size:24px; height:30px; width:200px; cursor:pointer; color:#FFFFFF;}
.yhy .xg{position:absolute; top:360px; left:18px;  font-size:24px; height:30px; width:200px;cursor:pointer; color:#FFFFFF;}
.yhy .sc{position:absolute; top:410px; left:18px;  font-size:24px; height:30px; width:200px;cursor:pointer; color:#FFFFFF;}
.yhy .cd{position:absolute; top:460px; left:18px;  font-size:24px; height:30px; width:200px;cursor:pointer; color:#FFFFFF;}
.yhy .lr:hover{font-size:27px;}
.yhy .ck:hover{font-size:27px;}
.yhy .sc:hover{font-size:27px;}
.yhy .cd:hover{font-size:27px;}
.lr{position:absolute; top:100px; left:236px; height:592px; width:1130px; }
.lr .title{position:absolute; top:50px; left:400px; font-size:40px;}
.lr .rqn{position:absolute; top:150px; left:50px; font-size:30px;}
.lr .rqy{position:absolute; top:150px; left:300px; font-size:30px;}
.lr .rqd{position:absolute; top:150px; left:550px; font-size:30px;}
*#sr{width:120px; height:40px; border-color:#CCCCCC;  font-size:20px;}
*#selecty{width:120px; height:40px; border-color:#CCCCCC;  font-size:20px;}
.lr .srk{position:absolute; top:260px; left:80px; font-size:30px;}
#srk{border-color:#CCCCCC; font-size:20px;}
.lr .btn{width:60px; height:35px; position:absolute; top:260px; right:300px; font-size:30px; border-style:solid; border-color:#999999; border-width:1px; background-color:#CCCCCC; cursor:pointer;}
.lr .btn:hover{width:65px; height:38px;}
-->
</style>
<script language="javascript">
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
daycode=new Array(12);
dayname=new Array(12);
daycode[2]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
dayname[2]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
daycode[3]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29");
dayname[3]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29");
daycode[4]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
dayname[4]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
daycode[5]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
dayname[5]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
daycode[6]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
dayname[6]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
daycode[7]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
dayname[7]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
daycode[8]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
dayname[8]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
daycode[9]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
dayname[9]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
daycode[10]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
dayname[10]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
daycode[11]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
dayname[11]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
daycode[0]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
dayname[0]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
daycode[1]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
dayname[1]=new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
function selectdayarea(preP,preC,formname)
   {
     moothid=eval("document."+formname+"."+preP+".selectedIndex;");
	 yearname=document.getElementById("selecty").value;
	 if(yearname=="02")moothid+=2;
     j=eval("document."+formname+"."+preC+".length;");
     for (i=1;i<j;i++)
        {eval("document."+formname+"."+preC+".options[j-i]=null;")}
     if (moothid!="0")
       {
         for (i=0;i<dayname[moothid-1].length;i++)
            {
             tempoption=new Option(dayname[moothid-1][i],daycode[moothid-1][i]);
             eval("document."+formname+"."+preC+".options[i+1]=tempoption;");
            }
       }
    }
  
   function fsubmit(obj){
obj.submit();
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
	   <div class="ck" onclick="window.location.href='/prj03/inquire.jsp';return false">
	   查看日程
	   </div>
	   <div class="xg" onclick="window.location.href='modify.html';return false">
	   修改日程
	   </div>
	   <div class="sc" onclick="window.location.href='delete.html';return false">
	   删除日程
	   </div>
	    <div class="cd" onclick="window.location.href='menu.html';return false">
	   返回菜单
	   </div> 	
</div>
<div class="lr">
       <div class="title"><div>录入日程</div></div>
       <form action="AddSchedual" name="form3" method="post" >
       <div class="rqn" >
	   年：
	   <select name="selecty" id="selecty" onChange="selectcityarea('selecty','selectm','form3');">
	   <option value="0" selected="selected">-请选择-</option>
	   </select>
	   </div>
	  
	   <div class="rqy">
	   月：<select name="selectm" id="sr" onChange="selectdayarea('selectm','selectd','form3');">
       <option value="0" selected="selected">-请选择-</option>
	   </select>
	   </div>
	   <div class="rqd">
	   日：<select name="selectd" id="sr">
          <option value="0" selected="selected">-请选择-</option>
		</select>
	   </div>
	   <div class="srk">
	   日程安排：<br /><br />
	   <textarea name="text1" cols="80" rows="10" id="srk"></textarea>   
	   </div>
	   <div class="btn"  onclick="javascript:fsubmit(document.form3);" >提交
	   </div>
	   </form>
        <script language="javascript">
          first("selecty","selectm","form3",0,0);
        </script>
	   
</div>
</body>
</html>
