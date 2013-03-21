package Question10_2;

import java.util.ArrayList;

public class Person {
	private ArrayList<Integer> friends;
	private int personID;
	private String info;
	
	public String getInfo() { return info; }
	public void setInfo(String info) {
		this.info = info;
	}

	public int[] getFriends() {
		int[] temp = new int[friends.size()];
		for (int i = 0; i < temp.length; i++) {
			temp[i] = friends.get(i);
		}
		return temp;
	}
	public int getID() { return personID; }
	public void addFriend(int id) { friends.add(id); }
	
	public Person(int id) {
		this.personID = id;
	}
}
