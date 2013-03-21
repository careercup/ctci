package Question8_10;

public class Cell<K, V> {
	private K key;
	private V value;
	public Cell(K k, V v) {
		key = k;
		value = v;
	}
	
	public boolean equivalent(Cell<K, V> c) {
		return equivalent(c.getKey());
	}
	
	public boolean equivalent(K k) {
		return key.equals(k);
	}
	
	@Override 
	public String toString() {
		return "(" + key.toString() + ", " + value.toString() + ")";
	}	
	
	public K getKey() {
		return key;
	}
	
	public V getValue() {
		return value;
	}
}
