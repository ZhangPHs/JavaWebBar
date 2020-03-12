package DAO;
import entity.*;
public interface replyDao {
	public boolean newreply(Tie tie,User user,String content,int target_floor);
}
