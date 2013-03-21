package Question16_5;

public class Question {
	public static void main(String[] args) {
		Foo foo = new Foo();
		
		MyThread thread1 = new MyThread(foo, "first");
		MyThread thread2 = new MyThread(foo, "second");
		MyThread thread3 = new MyThread(foo, "third");
		
		thread3.start();
		thread2.start();
		thread1.start();
		
		try {
			foo.sem3.acquire();
		} catch (Exception e) {
			e.printStackTrace();
		}
		foo.sem3.release();
	}
}
