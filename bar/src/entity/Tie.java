package entity;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

import bar_work.db;
import entity.*;

public class Tie {
	public int ID;
	public String username;
	public int reply_num;
	public Date create_time;
	public String title;
	public int user_ID;
	public ArrayList<Reply> getRL() throws SQLException{
		ArrayList<Reply> r=new ArrayList<Reply>();
		String sql="select * from reply where tie_ID="+this.ID+" order by reply_floor";
		ResultSet rs=db.executeQuery(sql);
		while(rs.next()) {
			Reply tmp=new Reply();
			tmp.reply_floor=rs.getInt(1);
			tmp.tie_ID=rs.getInt(2);
			tmp.target_floor=rs.getInt(3);
			tmp.create_time=rs.getDate(4);
			tmp.content=rs.getString(5);
			tmp.publisher=rs.getString(6);
			tmp.user_ID=rs.getInt(7);
			r.add(tmp);
		}
		return r;
	}
	public static ArrayList<Tie> getSearch(String str) throws SQLException{
		ArrayList<Tie> t=new ArrayList<Tie>();
		String sql="select * from tie where title like '%"+str+"%' order by reply_num desc";
		ResultSet rs=db.executeQuery(sql);
		while(rs.next()) {
			Tie tmp=new Tie();
			tmp.ID=rs.getInt(1);
			tmp.username=rs.getString(2);
			tmp.reply_num=rs.getInt(3);
			tmp.create_time=rs.getDate(4);
			tmp.title=rs.getString(5);
			tmp.user_ID=rs.getInt(6);
			t.add(tmp);
		}
		return t;
	}
}
