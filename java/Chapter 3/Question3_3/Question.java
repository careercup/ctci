package Question3_3;

public class Question {
	public static void main(String[] args) {
		int capacity_per_substack = 5;
		SetOfStacks set = new SetOfStacks(capacity_per_substack);
		for (int i = 0; i < 34; i++) {
			set.push(i);
		}
		for (int i = 0; i < 34; i++) {
            if (!set.isEmpty()) {
                System.out.println("Popped " + set.pop());
            }
		}		
	}
}
