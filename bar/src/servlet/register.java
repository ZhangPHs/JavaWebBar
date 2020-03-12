package servlet;

import javax.servlet.*;//�����쳣��
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.*;
import entity.*;

public class register extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		String newuser_name=request.getParameter("newuser_name");
		String newuser_password=request.getParameter("newuser_password");
		String newuser_email=request.getParameter("newuser_email");
		String newuser_info=request.getParameter("newuser_info");
		boolean newuser_sex=Boolean.parseBoolean(request.getParameter("newuser_sex"));//��ʵֻ��0��1ȡֵ
		//��ȡע���û����ĸ�����
		boolean flag=false;
		userDao ud=new UserDao_impl();
		flag =ud.register(newuser_name,newuser_password,newuser_email,newuser_info,newuser_sex);
		//request.setAttribute("flag", flag);
		if(flag!=false) {//ע��ɹ�
			response.sendRedirect("./success/newuser.jsp");
		}
		else {
			response.sendRedirect("fail.jsp");
		}
		
	}
}

