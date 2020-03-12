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


public class enter_tie extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		int ID=Integer.parseInt(request.getParameter("tie_id"));
		boolean flag=false;
		tieDao td=new TieDao_impl();
		Tie tie=td.GetTieByID(ID);//��ý������ID
		HttpSession session=request.getSession();
		session.setAttribute("curr_tie", tie);
		request.getRequestDispatcher("inner_tie.jsp").forward(request, response);
	}
}