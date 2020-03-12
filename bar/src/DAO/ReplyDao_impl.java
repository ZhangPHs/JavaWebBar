package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bar_work.db;
import entity.Tie;
import entity.User;

public class ReplyDao_impl implements replyDao{

	@Override
	public boolean newreply(Tie tie, User user, String content, int target_floor) {
		String sql1="insert into reply values(?,?,?,?,?,?,?)";
		String sql2="update tie set reply_num=reply_num+1 where ID="+tie.ID;//帖子恢复数量+1
		String sql3="update user set credits=credits+2 where ID="+user.ID;//用户积分+2
		Date dt=new Date(System.currentTimeMillis());

		int result1=0;
		int result2=0;
		int result3=0;
		try {
			PreparedStatement ppst=db.executePreparedStatement(sql1);
			ppst.setInt(1, tie.reply_num+1);
			ppst.setInt(2,tie.ID);
			ppst.setInt(3, target_floor);
			ppst.setDate(4,dt);
			ppst.setString(5, content);
			ppst.setString(6, user.username);
			ppst.setInt(7,user.ID);
			result1=ppst.executeUpdate();
			
			result2=db.executeUpdate(sql2);//帖子的回复数量加1
			result3=db.executeUpdate(sql3);//用户积分+2
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result1==1 && result2==1 &&result3==1) {
			return true;
		}
		else {
			return false;
		}
	}

}
