<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>�鿴</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .heading{
            margin: 0px auto;
            background-color: snow;
            height: 90px;
            width: 100%;
        }
        .wrapper{
            margin:0px auto;
            width: 80%;
            background-color: antiquewhite;
            height: 1150px;
        }
        .heading_nav{
            width: 100%;
            padding-top: 25px;
            padding-bottom: 30px;
            height: 30px;
            position: relative;
        }
        .heading_title{
            float: left;
            font-family: cursive;
            font-size: 30px;
            color: burlywood;
        }
        .heading_navbar{
            padding-top: 30px;
        }
        ul{
            margin-left: 50px;
            float: left;
            list-style-type: none;
            padding-top: 6px;
            padding-bottom: 6px;
        }
        li{
            padding-left: 20px;
            display: inline;
        }
        a:link,a:visited{
            font-weight: bold;
            color: darkgray;
            text-align: center;
            padding: 6px;
            text-decoration: none;
        }
        a:hover,a:active{
            color:dimgray;
        }
        .content{
            width: 100%;
            height: 910px;
            margin: 0px auto;
        }
        .content_title{
            padding-top:50px;
            font-size: 30px;
            margin: 0px auto;
            padding-left: 80px;
            padding-bottom: 20px;
        }
        .lists{
            padding-top: 20px;
            padding-left: 180px;
            margin: 0px auto;
        }
        table{
            text-align: center;
            border: 1px;
            border-color: darkgray;
            border-style: solid;
            border-collapse: separate;
            border-spacing: 2px;
            width: 700px;
        }
        tr{
            background-color: cornsilk;
        }
        th,td{
            padding:1px;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="wrapper">
        <div class="heading">
            <div class="heading_nav">
                <div class=" heading_title">
                    ��������
                </div>
                <div class="heading_navbar">
                    <ul>
                        <li><a href="menu.jsp"> ��ҳ</a></li>
                        <li><a href="entering.jsp"> ¼���ճ�</a></li>
                        <li><a href="modify.jsp"> �޸��ճ�</a></li>
                        <li><a href="delete.jsp"> ɾ���ճ�</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="content_title">
                �����ճ̰������£�
            </div>
            <div class="lists">
                <table >
                    <tr>
                        <th width="150px">ʱ��</th><th>�ճ̰���</th>
                        <%String Arrange[]=(String [])session.getAttribute("arrange"); %>
  						 <%String Date[]=(String [])session.getAttribute("date"); %>
   						 <%for(int i=0;i<31;i++){%>
 					<tr>	<td> <%=Date[i]%>&nbsp;</td>
  						<td> <%=Arrange[i] %><br></td></tr>
   						 <%} %>
                        
                    </tr>
                     
                </table>
                
            </div>
        </div>
    </div>
</div>
</body>
</html>