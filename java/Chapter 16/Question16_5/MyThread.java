package Question16_5;

public class MyThread extends Thread {
	private String method;
	private Foo foo;
	
	public MyThread(Foo foo, String method) {
		this.method = method;
		this.foo = foo;
	}
	
	public void run() {
		if (method == "first") {
			foo.first();
		} else if (method == "second") {
			foo.second();
		} else if (method == "third") {
			foo.third();
		}
	}
}
