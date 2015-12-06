package userpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Adduser extends HttpServlet {
	Schedual schedual=null;
	/**
	 * Constructor of the object.
	 */
	public Adduser() {
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
		response.setContentType("text/html;charset=GBK");
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		
		
		PrintWriter out = response.getWriter();
		
		String username=request.getParameter("busername");
		String password=request.getParameter("bpassword");//接收注册的账号和密码
		SchedualDA.initialize();
		schedual=new Schedual(username,password);
		String result="";
		if(username == "" || username == null || username.length()>20){  //这里是判断账号和密码非空
            try {  
                result = "please input username(20 chars allowed)";  
                request.setAttribute("message", result);  
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
                } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        if(password == "" || password == null ||password.length() > 20){  
            try {  
                result = "please input password(20 chars)";  
                request.setAttribute("message", result);  
                request.getRequestDispatcher("/register.jsp").forward(request, response);
        		return;
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
		try{
		SchedualDA.addUser(username,password);
		request.getSession().setAttribute("ausername", username);
		request.getRequestDispatcher("/newuser.jsp").forward(request, response);
		}
		
		catch(DuplicateException e){
			System.out.println(e);
		}
		
		out.flush();
		out.close();
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
