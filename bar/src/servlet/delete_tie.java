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


public class delete_tie extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		int ID=Integer.parseInt(request.getParameter("d_tie_id"));
		tieDao td= new TieDao_impl();
		Tie tie=td.GetTieByID(ID);
		boolean flag=td.delete(tie);
		if(flag==true) {
			response.sendRedirect("personal.jsp");
		}
		else {
			response.sendRedirect("./fail/delete_tie.jsp");
		}
	}
}