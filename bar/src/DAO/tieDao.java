package DAO;
import entity.*;
public interface tieDao {
	public Tie GetTieByID(int ID);
	public boolean newtie(String title,String content,User user);
	public boolean delete(Tie tie);
	
}
