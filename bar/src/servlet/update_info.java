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

public class update_info extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		String new_email=request.getParameter("new_email");
		String new_info=request.getParameter("new_info");
		
		
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("curr_user");
		if(new_info==null) {
			new_info=user.introduce;
		}else {
			new_email=user.email;
		}
		boolean flag=false;
		userDao ud=new UserDao_impl();
		flag =ud.update(user.ID, new_email, new_info);
		User xuser=UserDao_impl.GetUserByID(user.ID);
		session.setAttribute("curr_user", xuser);
//		request.setAttribute("flag", flag);

		request.getRequestDispatcher("personal.jsp").forward(request, response);

		
//		request.getRequestDispatcher("personal.jsp").forward(request, response);

	}
}
