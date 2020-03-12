package DAO;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import bar_work.db;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.User;
import javax.servlet.*;

public class UserDao_impl  implements userDao{
	public static User GetUserByID(int ID) {
		User user=null;
		String sql="select * from user where ID="+ID;
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()) {
					user=new User();	
					user.ID=rs.getInt("ID");
					user.username=rs.getString("username");
					user.level=rs.getBoolean("level");
					user.email=rs.getString("email");
					user.create_time=rs.getDate("create_time");
					user.password=rs.getString("password");
					user.introduce=rs.getString("introduce");
					user.credits=rs.getInt("credits");
					user.sex=rs.getBoolean("sex");
					user.is_banned=rs.getBoolean("is_banned");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;	
	}
	
	public boolean register(String username,String password,String email,String introduce,boolean sex) {
		boolean flag=false;
		Date dt=new Date(System.currentTimeMillis());
		String sql="insert into user(username,level,email,create_time,password,introduce,credits,sex,is_banned) values('"+
				username+"',"+1+",'"+email+"','"+dt+"','"+password+"','"+introduce+"',"+
				20+","+sex+","+0+")";
		int res=db.executeUpdate(sql);
		db.close();
		if(res!=0) {
			flag=true;
		}
		return flag;
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		User user=null;
		String sql="select * from user where username=? and password=?";
		try {
				PreparedStatement ppst=db.executePreparedStatement(sql);
				ppst.setString(1,username);
				ppst.setString(2, password);
				ResultSet rs=ppst.executeQuery();
				while(rs.next()) {
					if(rs.getString("username").equals(username) && rs.getString("password").equals(password)) {
						user=new User();
						user.ID=rs.getInt("ID");
						user.username=rs.getString("username");
						user.level=rs.getBoolean("level");
						user.email=rs.getString("email");
						user.create_time=rs.getDate("create_time");
						user.password=rs.getString("password");
						user.introduce=rs.getString("introduce");
						user.credits=rs.getInt("credits");
						user.sex=rs.getBoolean("sex");
						user.is_banned=rs.getBoolean("is_banned");
					}
				}
				db.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean ban(int ID) {
		boolean flag=false;
		String sql="update user set is_banned=1 where id=?";
		try {
			PreparedStatement ppst=db.executePreparedStatement(sql);
			ppst.setInt(1,ID);
			int res=ppst.executeUpdate();
			
			if(res!=0) {
				flag=true;
			}
			db.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean update(int ID,String email, String introduce) {
		String sql="update user set email=?,introduce=? where ID=?";
		PreparedStatement ppst=db.executePreparedStatement(sql);
		int flag=0;
		try {
			ppst.setString(1,email);
			ppst.setString(2, introduce);
			ppst.setInt(3, ID);
			flag=ppst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag!=0) {
			

			return true;
		}
		return false;
	}
}