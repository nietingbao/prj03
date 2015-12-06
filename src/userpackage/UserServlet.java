package userpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;  
import java.sql.ResultSet; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
import com.mysql.jdbc.Connection;  
import com.mysql.jdbc.Statement;

public class UserServlet extends HttpServlet {
	
	Schedual schedualOne;
	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("UTF-8");
		String result="";
		String ausername = request.getParameter("username");//�����û���
		String apassword = request.getParameter("password");//��������
		
		/*������յ��û���������Ϊ�ջ��߳��ȳ���20���ַ����򷵻ص���¼����*/
		 if(ausername == "" || ausername == null || ausername.length()>20){  
	            try {  
	                result = "please input username(20 chars allowed)";  
	                request.setAttribute("message", result);  
	                request.getRequestDispatcher("/MyJsp.jsp").forward(request, response);
	                return;
	                } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        if(apassword == ""  || apassword.length() > 20){  
	            try {  
	                result = "please input password(20 chars)";  
	                request.setAttribute("message", result);  
	                response.sendRedirect("MyJsp.jsp"); 
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        
	        /*������յ��ĺϷ����û���������*/
	        SchedualDA.initialize();
	        try{
	        schedualOne=SchedualDA.finduser(ausername);
	        	if(schedualOne==null){//��ʾ���ݱ���û�д��û���DA��������Ӧ�Ķ���,���������ǿյ�
	        		response.sendRedirect("/prj03/falure.jsp");
	        	}
//	        	else if(ausername!=null||apassword==null){//��ʾ���ݱ���û�д��û���DA��������Ӧ�Ķ���,���������ǿյ�
//	        		 request.getRequestDispatcher("/MyJsp.jsp").forward(request, response);
//		                return;
//	        }
	        	else if(apassword!=null&&!schedualOne.getPassword().equals(apassword)){
	        		response.sendRedirect("/prj03/falure.jsp");
	        	}
	        	else{
	        		 HttpSession session =request.getSession();
	     	        session.setAttribute("user",ausername);//�ѵ�¼�ɹ����û����û���������ѯ��servlet����
	        		request.getSession().setAttribute("Username", ausername);
	        		response.sendRedirect("/prj03/success.jsp");
//	        		request.getRequestDispatcher("/success.jsp").forward(request, response);
//	        		return;
	        	}
	        }
	        catch(NotFoundException e){
	        	System.out.println(e);
	        }  
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		
	}

}
