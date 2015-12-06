package userpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Deletepast extends HttpServlet {
	Schedual aschedual;
	/**
	 * Constructor of the object.
	 */
	public Deletepast() {
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
		response.setCharacterEncoding("UTF-8");//防止乱码的出现；
		String ausername=(String)request.getSession().getAttribute("user");//这里是要找到登录成功的用户的账号
		String y=request.getParameter("selecty");//接收输入的日期，
		String m=request.getParameter("selectm");
		String d=request.getParameter("selectd");
		String date=y+"."+m+"."+d;
		try{
			System.out.println(ausername+"dsad");
			aschedual = SchedualDA.findSchedual(date,ausername);
			String arrange=aschedual.getArrange();
			request.getSession().setAttribute("Y",y);
			request.getSession().setAttribute("M", m);
			request.getSession().setAttribute("D", d);
			request.getSession().setAttribute("Arrange", arrange);
    		response.sendRedirect("/prj03/deletepast.jsp");//这是原来按照日期查询的处理
		}
		catch(Exception ee){
			System.out.print(ee);
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
