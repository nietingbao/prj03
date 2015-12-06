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
				Class.forName("com.mysql.jdbc.Driver");//�������ݿ�����
				
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
		
		public static void terminate(){//�ͷ�����ϵͳ��Դ
			try{
				st.close();
				con.close();
			}
			catch (SQLException e) {
				// TODO: handle exception
				System.out.println(e);
			}
		}
		/*�����Ǹ��ַ���*/
/*�û���¼�ķ���*/		
		public static Schedual finduser(String key) throws NotFoundException{//�����ǲ����û��ķ�������¼��ʱ����õ�
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
						}//����ǲ鵽�ˣ��ͷ��ؿ���
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
/*�û�ע��*/	
		public static void addUser(String ausername,String apassword) throws DuplicateException{//�û�ע��ķ���
			bschedual=null;
			username=ausername;
			password=apassword;
			String sql="insert into user(username,password) values('"+username+"','"+password+"');";//������ܻ�������
			System.out.println(sql);
			try{
				bschedual = SchedualDA.finduser(username);
				System.out.println("11111111");
				//throw(new DuplicateException("���û��Ѵ���"));
			}////дcatch����������������
			catch(NotFoundException e){
				try{
					System.out.println("sda");//֮ǰΪ�˲����õ�
					st.executeUpdate(sql);
					
				}
				catch(SQLException ee){
					System.out.println(ee);
				}
			}
}
/*��ѯ�ճ̵ķ���*/		
		public static Schedual findSchedual(String adate,String ausername) throws NotFoundException//��ѯ�ճ̵ķ���������Ĳ�ѯ�ճ̱���Ҫͬʱƥ�䵽���ں��û�
		{
			aschedual=null;
			String sql1="select * from schedual where dates ="+"'"+adate+"'"+" and username = "+"'"+ausername+"'" ;//�ȴ�schedual��ѡ��dates������dates��username�ҵ�
					System.out.println(sql1);//�������
			try{
				System.out.println("test");
				ResultSet rs = st.executeQuery(sql1);
				if(rs.next()){
					date = rs.getString("dates");
					arrange  =rs.getString("arrange");
					username = rs.getString("username");//����м�¼�ͼ������ݣ�����ȡusername;
				}
				else{
					username=null;
					arrange=null;
					aschedual = null;
				throw(new NotFoundException("û�д����¼"));//���û�м�¼�ͽ�username��ֵΪ��,���������ҵ��жϣ����Ѳ��ҵ��ำֵΪ��
					}
			String sql2="select * from user where username="+"'"+username+"'";//��ͨ��username��user������������ҵ�����֮���ֲ�����ô����
			if(username!=null){//�ж�������û����Ƿ���Ч�������Ч�����¼
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
/*����������ճ̵ķ���*/		
		public static void addschedual(String dates,String Arrange,String Username)throws DuplicateException{
			bschedual=null;
			date=dates;
			arrange=Arrange;
			username=Username;
		SchedualDA.initialize();
			String sql="insert into schedual(dates,arrange,username) values('"+date+"','"+arrange+"','"+username+"');";
			try{
				bschedual=SchedualDA.findSchedual(dates,username);//�����ѯ��ʱ�����û���������һ���ѯ				
					if(bschedual!=null){
						throw(new DuplicateException("�������Ѿ��а���"));//��������Ӧ��ҳ��Ӧ��Ҫ������Ӧ
				    }
				}
			//		
				
			catch(NotFoundException e){
					try{
						System.out.println("�Ѿ��������ݿ�"+sql+"dsadasd");
						st.executeUpdate(sql);
					}
					catch(SQLException ee){
						System.out.println(ee);
					}
				}
			}
/*ɾ���ճ�*/
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
/*�޸��ճ�*/		
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
