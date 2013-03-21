package Question17_14;

public class Result {
	public int invalid = Integer.MAX_VALUE;
	public String parsed = "";
	public Result(int inv, String p) {
		invalid = inv;
		parsed = p;
	}
	
	public Result clone() {
		return new Result(this.invalid, this.parsed);
	}
	
	public static Result min(Result r1, Result r2) {
		if (r1 == null) {
			return r2;
		} else if (r2 == null) {
			return r1;
		} 
		
		return r2.invalid < r1.invalid ? r2 : r1;
	}	
}