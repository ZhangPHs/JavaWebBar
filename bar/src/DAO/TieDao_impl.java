package DAO;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import bar_work.db;
import entity.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TieDao_impl implements tieDao{
	
	
	public Tie GetTieByID(int ID) {
		Tie tie=new Tie();
		String sql="select * from tie where ID="+ID;
		try {
			ResultSet rs= db.executeQuery(sql);
			if(rs.next()) {
			tie.ID=rs.getInt(1);
			tie.username=rs.getString(2);
			tie.reply_num=rs.getInt(3);
			tie.create_time=rs.getDate(4);
			tie.title=rs.getString(5);
			tie.user_ID=rs.getInt(6);
			}
			else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tie;
	}
	@Override
	public boolean newtie(String title, String content ,User user) {
		// TODO Auto-generated method stub
		int result1=0;
		int result2=0;
		String sql1="insert into tie(username,reply_num,create_time,title,user_ID) values(?,?,?,?,?)";
		String sql2="insert into reply values(?,?,?,?,?,?,?)";
		try {
			Date dt=new Date(System.currentTimeMillis());
			PreparedStatement ppst=db.executePreparedStatement(sql1);
			ppst.setString(1,user.username);
			ppst.setInt(2, 1);
			ppst.setDate(3, dt);
			ppst.setString(4, title);
			ppst.setInt(5, user.ID);
			result1=ppst.executeUpdate();
			
			ppst.clearParameters();
			ppst.clearBatch();
			String tmpsql="select max(ID) id from tie";
			ResultSet res=db.executeQuery(tmpsql);
			int new_tie_ID=0;
			if(res.next()) {
			new_tie_ID=res.getInt("id");
			}
			ppst=db.executePreparedStatement(sql2);
			ppst.setInt(1, 1);
			ppst.setInt(2, new_tie_ID);
			ppst.setInt(3, 0);
			ppst.setDate(4,dt);
			ppst.setString(5, content);
			ppst.setString(6, user.username);
			ppst.setInt(7,user.ID);
			result2=ppst.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		if(result1==1 && result2==1) {
			return true;
		}
		else {
			
			return  false;
		}
	}

	@Override
	public boolean delete(Tie tie) {
		// TODO Auto-generated method stub
		int result1=0;
		int result2=0;
		String sql1="delete from reply where tie_ID="+tie.ID;
		String sql2="delete from tie where ID="+tie.ID;
		
		try {
			result1=db.executeUpdate(sql1);
			result2=db.executeUpdate(sql2);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result1!=0 && result2!=0) {
			db.close();
			return true;
		}
		else {
			db.rollback();
			return false;
		}		
	}
}
