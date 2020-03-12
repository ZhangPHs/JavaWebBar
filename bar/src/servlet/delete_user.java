package servlet;
import javax.servlet.*;//�����쳣��
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.*;
import entity.*;


public class delete_user extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		boolean flag=Boolean.parseBoolean(request.getParameter("judge_value").toString());
		if(flag==true) {
			HttpSession session = request.getSession();
			User user=(User)session.getAttribute("curr_user");
			userDao ud=new UserDao_impl();
			boolean tmp=false;
			tmp=ud.ban(user.ID);
			if(tmp==true) {
				response.sendRedirect("main&login.jsp");
			}else {
				response.sendRedirect("test2.jsp");
			}
		}else {
			response.sendRedirect("test.jsp");
		}
	}
}