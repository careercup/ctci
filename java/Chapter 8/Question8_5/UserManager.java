package Question8_5;

import java.util.Hashtable;

public class UserManager {
	private Hashtable<Integer, User> users;
	
	public User addUser(int id, String details, int accountType) {
		if (users.containsKey(id)) {
			return null;
		}
		User user = new User(id, details, accountType);
		users.put(id, user);
		return user;
	}
	
	public boolean remove(User u) {
		return remove(u.getID());
	}
	
	public boolean remove(int id) {
		if (!users.containsKey(id)) {
			return false;
		}
		users.remove(id);
		return true;
	}
	
	public User find(int id){
		return users.get(id);
	}
}
