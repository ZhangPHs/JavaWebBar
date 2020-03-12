package servlet;
import javax.servlet.*;//�����쳣��

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.*;
import entity.*;
import javax.servlet.http.HttpSession;

public class newtie extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("newtie_title");
		String content=request.getParameter("newtie_content");
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("curr_user");
		boolean flag=false;
		tieDao td=new TieDao_impl();
		flag =td.newtie(title,content,user);
//		request.setAttribute("test", title);
//		request.setAttribute("flag", flag);
		if(flag==true) {
//			request.getRequestDispatcher("test.jsp").forward(request, response);
			request.getRequestDispatcher("./success/newtie.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("./fail/newtie.jsp");
		}
		
	}
}