package userpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddSchedual extends HttpServlet {
	Schedual schedual=null;
	/**
	 * Constructor of the object.
	 */
	public AddSchedual() {
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
		String y=request.getParameter("selecty");//接收输入的日期，安排以及用户名
		String m=request.getParameter("selectm");
		String d=request.getParameter("selectd");
		String date=y+"."+m+"."+d;
		String arrange=request.getParameter("text1");
		String username=(String)request.getSession().getAttribute("user");
		
//		String result="";
//		if(username == "" || username == null || username.length()>20){  //这里是判断账号和密码非空
//            try {  
//                result = "please input username(20 chars allowed)";  
//                request.setAttribute("message", result);  
//                request.getRequestDispatcher("/entering.jsp").forward(request, response);
//                return;
//                } catch (Exception e) {  
//                e.printStackTrace();  
//            }  
//        }  
        if(arrange == "" || arrange == null ||arrange.length() > 20){  
            try {  
               
                request.getRequestDispatcher("/entering.jsp").forward(request, response);
        		return;
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        if(date == "" || date == null ||date.length() > 20){  
            try {  
                request.getRequestDispatcher("/entering.jsp").forward(request, response);
        		return;
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }          
        SchedualDA.initialize();
		try{
		SchedualDA.addschedual(date,arrange,username);
		request.getRequestDispatcher("/entersucceed.jsp").forward(request, response);
		}
		catch(DuplicateException e){
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
