package Question8_10;

import java.util.LinkedList;

public class Hash<K, V> {
	private final int MAX_SIZE = 5;
	LinkedList<Cell<K, V>>[] items; 
	
	public Hash() {
		items = (LinkedList<Cell<K, V>>[]) new LinkedList[MAX_SIZE];
	}
	
	public int hashCodeOfKey(K key) {
		return key.toString().length() % items.length;
	}
	
	public void put(K key, V value) {
		int x = hashCodeOfKey(key);
		if (items[x] == null) {
			items[x] = new LinkedList<Cell<K, V>>();
		}
		LinkedList<Cell<K, V>> collided = items[x];
		for (Cell<K, V> c : collided) {
			if (c.equivalent(key)) {
				collided.remove(c);
				break;
			}
		}
		
		Cell<K, V> cell = new Cell<K, V>(key, value);
		collided.add(cell);
	}
	
	public V get(K key) {
		int x = hashCodeOfKey(key);
		if (items[x] == null) {
			return null;
		}
		LinkedList<Cell<K, V>> collided = items[x];
		for (Cell<K, V> c : collided) {
			if (c.equivalent(key)) {
				return c.getValue();
			}
		}
		
		return null;		
	}
	
	public void debugPrintHash() {
		for (int i = 0; i < items.length; i++) {
			System.out.print(i + ": ");
			LinkedList<Cell<K, V>> list = items[i];
			if (list != null) {
				for (Cell<K, V> cell : list) {
					System.out.print(cell.toString() + ", ");
				}
			}
			System.out.println("");
		}
	}
}
