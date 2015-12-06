package userpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InquireServlet extends HttpServlet {//作用是显示一个月的所有安排
	Schedual aschedual = null;
	
	/**
	 * Constructor of the object.
	 */
	public InquireServlet() {
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
		String y=request.getParameter("selecty");//接收输入的日期，
		String m=request.getParameter("selectm");
		String adate=y+"."+m;
		String ausername=(String)request.getSession().getAttribute("user");//这里是要找到登录成功的用户的账号
		String result="";
//		if(adate == "" || adate == null || adate.length()>30){  
//            try {  
//                result = "please input date(20 chars allowed)";  
//                request.setAttribute("message", result);  
//                request.getRequestDispatcher("/inquire.jsp").forward(request, response);
//               return;
//                } 
//            catch (Exception e) {  
//                e.printStackTrace();  
//            }  
//        }  
		SchedualDA.initialize();
		try{
//			System.out.println(ausername+"dsad");
//			aschedual = SchedualDA.findSchedual(adate,ausername);
//			String arrange=aschedual.getArrange();
//			request.getSession().setAttribute("arrange", arrange);
//    		response.sendRedirect("/prj03/arrange.jsp");//这是原来按照日期查询的处理
			String [] date=new String[31];
			String [] arrange=new String[31];
			Schedual [] schedual = new Schedual[31];
			String [] day={".01",".02",".03",".04",".05",".06",".07",".08",".09",".10",".11",".12",".13",".14",".15",".16",".17",".18",".19",".20",".21",".22",".23",".24",".25",".26",".27",".28",".29",".30",".31"};
			for(int i=0;i<31;i++){
				date[i]=adate.concat(day[i]);
			}
//			for(int j=0;j<31;j++){
//				schedual[j]=SchedualDA.findSchedual(date[j], ausername);
//				if(schedual[j]==null){
//					arrange[j]="";
//					date[j]="";
//				}
//				else{
//					arrange[j]=schedual[j].getArrange();
//				}
//				
//			}这里的代码是按照循环查找的一个月的安排，但是没有处理好异常抛出
			int j=0;
			while(j<31){
				try{
					schedual[j]=SchedualDA.findSchedual(date[j], ausername);
					if(schedual[j]==null){
						arrange[j]="";
						date[j]="";
					}
					else{
						arrange[j]=schedual[j].getArrange();
					}
				}
				catch(NotFoundException e){
					if(schedual[j]==null){
						arrange[j]="";
						date[j]="";
					}
					else{
						arrange[j]=schedual[j].getArrange();
					}
					j++;
					continue;
				}
				j++;
			}
			request.getSession().setAttribute("date",date);
			request.getSession().setAttribute("arrange",arrange);
			response.sendRedirect("/prj03/arrange.jsp");
		}
		catch(Exception ee){
			System.out.print(ee);
		}
	//	out.flush();
	//	out.close();
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
