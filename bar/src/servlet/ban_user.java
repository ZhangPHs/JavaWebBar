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


public class ban_user extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		int ID=Integer.parseInt(request.getParameter("b_user_id"));
		userDao ud= new UserDao_impl();
		boolean flag=ud.ban(ID);
		response.sendRedirect("inner_tie.jsp");
	}
}