package userpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Delete() {
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
		String username=(String)request.getSession().getAttribute("user");//这里是要找到登录成功的用户的账号
		String y=(String)request.getSession().getAttribute("Y");
		String m=(String)request.getSession().getAttribute("M");
		String d=(String)request.getSession().getAttribute("D");
		String date=y+"."+m+"."+d;
		
//		String result="";
//		if(username == "" || username == null || username.length()>20){  //这里是判断账号和日期非空
//            try {  
//                result = "please input username(20 chars allowed)";  
//                request.setAttribute("message", result);  
//                request.getRequestDispatcher("/delete.jsp").forward(request, response);
//                return;
//                } catch (Exception e) {  
//                e.printStackTrace();  
//            }  
//        } 
//        if(date == "" || date == null ||date.length() > 20){  
//            try {                
//                request.getRequestDispatcher("/delete.jsp").forward(request, response);
//        		return;
//            } catch (Exception e) {  
//                e.printStackTrace();  
//            }  
//        }  
        SchedualDA.initialize();
		try{
		SchedualDA.delete(date,username);
		request.getRequestDispatcher("/deletesuccess.jsp").forward(request, response);
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
