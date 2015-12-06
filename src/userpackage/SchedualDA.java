package userpackage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import java.sql.*;
public class SchedualDA {
	static Schedual aschedual;
	static String url ="jdbc:mysql://localhost/xiaobaodata";
	static String user="root";
	static String pass="spongebob";
	static Connection con;
	static Statement st;
	static String date;
	static String arrange;
	static String username;
	static String password;
	static Schedual bschedual;
	static String a;
	/*try pushing to github*/	
	public static Connection initialize(){
			try{
				Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动
				
				con = DriverManager.getConnection(url,user,pass);
				
				st = con.createStatement();
			}
			catch (ClassNotFoundException e) {
				// TODO: handle exception
				System.out.println(e);
			}
			catch (SQLException e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return con;
		}
		
		public static void terminate(){//释放所用系统资源
			try{
				st.close();
				con.close();
			}
			catch (SQLException e) {
				// TODO: handle exception
				System.out.println(e);
			}
		}
		/*以下是各种方法*/
/*用户登录的方法*/		
		public static Schedual finduser(String key) throws NotFoundException{//这里是查找用户的方法，登录的时候会用到
			aschedual = null;
			String sql1 = "SELECT * FROM user WHERE username = " + "'"+key+"'";
			String sql2 = "select * from schedual where username = " +"'"+key+"'";
				try{
					ResultSet rs = st.executeQuery(sql1);
					if(rs.next()){
						username= rs.getString(1);
						password =rs.getString(2);
					}
					else{
						username=null;
						aschedual = null;
						throw(new NotFoundException("dasd"));
						}//如果是查到了，就返回空类
					rs = st.executeQuery(sql2);
					if(username!=null){	
						if(rs.next()){
							date=rs.getString("dates");
							arrange=rs.getString("arrange");
							aschedual = new Schedual(date,arrange,username,password);	
						}
					else
						{
						aschedual = null;
						throw(new NotFoundException("dasd"));
						}
					}
						else{
							aschedual=null;
						}
					rs.close();
				}
			catch (SQLException e) {
				System.out.println(e);
				// TODO: handle exception
			}
			return aschedual;
		}
/*用户注册*/	
		public static void addUser(String ausername,String apassword) throws DuplicateException{//用户注册的方法
			bschedual=null;
			username=ausername;
			password=apassword;
			String sql="insert into user(username,password) values('"+username+"','"+password+"');";//这里可能会有问题
			System.out.println(sql);
			try{
				bschedual = SchedualDA.finduser(username);
				System.out.println("11111111");
				//throw(new DuplicateException("该用户已存在"));
			}////写catch。。。。。。。。
			catch(NotFoundException e){
				try{
					System.out.println("sda");//之前为了测试用的
					st.executeUpdate(sql);
					
				}
				catch(SQLException ee){
					System.out.println(ee);
				}
			}
}
/*查询日程的方法*/		
		public static Schedual findSchedual(String adate,String ausername) throws NotFoundException//查询日程的方法，这里的查询日程必须要同时匹配到日期和用户
		{
			aschedual=null;
			String sql1="select * from schedual where dates ="+"'"+adate+"'"+" and username = "+"'"+ausername+"'" ;//先从schedual中选出dates，根据dates把username找到
					System.out.println(sql1);//检验语句
			try{
				System.out.println("test");
				ResultSet rs = st.executeQuery(sql1);
				if(rs.next()){
					date = rs.getString("dates");
					arrange  =rs.getString("arrange");
					username = rs.getString("username");//如果有记录就记下数据，并获取username;
				}
				else{
					username=null;
					arrange=null;
					aschedual = null;
				throw(new NotFoundException("没有此项记录"));//如果没有记录就将username赋值为空,方便后面查找的判断，并把查找的类赋值为空
					}
			String sql2="select * from user where username="+"'"+username+"'";//再通过username在user表里面把密码找到，（之后发现不用这么复杂
			if(username!=null){//判断输入的用户名是否有效，如果有效，则记录
				rs=st.executeQuery(sql2);
				if(rs.next()){
					username=rs.getString(1);
					password=rs.getString(2);
					aschedual=new Schedual(date,arrange,username,password);
				}
				else{
					aschedual=null;
				}
			}
			else{
				aschedual = null;
				}
			}
			catch(SQLException e){
				System.out.println(e);
			}
			return aschedual;
		}
/*这里是添加日程的方法*/		
		public static void addschedual(String dates,String Arrange,String Username)throws DuplicateException{
			bschedual=null;
			date=dates;
			arrange=Arrange;
			username=Username;
		SchedualDA.initialize();
			String sql="insert into schedual(dates,arrange,username) values('"+date+"','"+arrange+"','"+username+"');";
			try{
				bschedual=SchedualDA.findSchedual(dates,username);//这里查询的时候按照用户名和日期一起查询				
					if(bschedual!=null){
						throw(new DuplicateException("该日期已经有安排"));//这里在相应的页面应该要做出反应
				    }
				}
			//		
				
			catch(NotFoundException e){
					try{
						System.out.println("已经访问数据库"+sql+"dsadasd");
						st.executeUpdate(sql);
					}
					catch(SQLException ee){
						System.out.println(ee);
					}
				}
			}
/*删除日程*/
		public static void delete(String adate,String ausername) throws NotFoundException{
			aschedual=null;
			date = adate;
			username= ausername;
			SchedualDA.initialize();
			String sql="delete from schedual where dates="+"'"+date+"'" +"and username="+"'"+username+"'";
			try{
				aschedual=SchedualDA.findSchedual(date, username);
				try{
					st.executeUpdate(sql);
				}
				catch(SQLException ee){
					System.out.println(ee);
				}
			}
			catch(NotFoundException e){
				System.out.println(e);
			}
		}
/*修改日程*/		
		public static void update(String adate,String arr,String ausername) throws NotFoundException{
			aschedual=null;
			date=adate;
			username=ausername;
			arrange=arr;
			SchedualDA.initialize();
			String sql="update schedual set arrange="+"'"+arrange+"'"+"where dates="+"'"+date+"'" +"and username="+"'"+username+"'";
					try{
						aschedual=SchedualDA.findSchedual(date, username);
						try{
							st.executeUpdate(sql);
							System.out.println(sql);
						}
						catch(SQLException ee){
							System.out.println(ee);
						}
					}
					catch(NotFoundException e){
						System.out.println(e);
					}
		}
		
		
		
		
}
