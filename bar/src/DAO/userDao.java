package DAO;
import entity.User;
public interface userDao {
	public User login(String username,String password);
	public boolean register(String username,String password,String email,String introduce,boolean sex);
	public boolean update(int ID,String email,String introduce);
	public boolean ban(int ID);
}
