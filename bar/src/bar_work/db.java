package bar_work;

import java.sql.*;

public class db {
	
	private static final String url="jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8";
	private static final String user="JAVAUSER";
	private static final String password="13579Abc";
	
	protected static Statement s=null;
	protected static ResultSet rs=null;
	protected static Connection conn=null;
	
	public static synchronized Connection getConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return conn;
	}
	public static int executeUpdate(String sql) {
		int result=0;
		try {
			s=getConnection().createStatement();
			result=s.executeUpdate(sql);//事务自动提交？
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static ResultSet executeQuery(String sql) {
		try {
			s =getConnection().createStatement();
			rs=s.executeQuery(sql);
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return rs;
	}
	public static PreparedStatement executePreparedStatement(String sql) {
		PreparedStatement ps=null;
		try {
			ps=getConnection().prepareStatement(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ps;
	}
	public static void rollback() {
		try {
			getConnection().rollback();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close() {
		try {
			
			if(rs!=null)rs.close();
			if(s!=null)s.close();
			if(conn!=null)conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}