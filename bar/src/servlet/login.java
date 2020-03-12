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

public class login extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		userDao ud=new UserDao_impl();
		User user=ud.login(username, password);
		if(user!=null ) {
			if(user.is_banned!=true) {
//			request.setAttribute("test", username);
			HttpSession session=request.getSession();
			session.setAttribute("curr_user", user);
			
			request.getRequestDispatcher("main_show.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("./fail/bebanned.jsp");
			}
		}
		else {
			response.sendRedirect("./fail/login.jsp");			
		}	
	}
}