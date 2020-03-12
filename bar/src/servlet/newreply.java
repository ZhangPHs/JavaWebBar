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

public class newreply extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		int reply_target=Integer.parseInt(request.getParameter("reply-target"));
		String reply_content=request.getParameter("reply-content");
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("curr_user");
		Tie tie=(Tie)session.getAttribute("curr_tie");
		boolean flag=false;
		replyDao rd=new ReplyDao_impl();
		flag =rd.newreply(tie,user,reply_content,reply_target);
		request.setAttribute("flag", flag);
		if(flag==true) {
			request.getRequestDispatcher("success/newreply.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("fail/newreply.jsp");
		}
		
	}
}