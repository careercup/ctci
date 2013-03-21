package Question17_10;


public class QuestionOO {
	
	public static void encode(String v, StringBuffer sb) {
		v = v.replace("0", "\\0");
		sb.append(v);
		sb.append(" ");
	}
	
	public static void encodeEnd(StringBuffer sb) {
		sb.append("0");
		sb.append(" ");
	}
	
	public static void encode(Attribute attr, StringBuffer sb) {
		encode(attr.getTagCode(), sb);
		encode(attr.value, sb);
	}
	
	public static void encode(Element root, StringBuffer sb) {
		encode(root.getNameCode(), sb);
		for (Attribute a : root.attributes) {
			encode(a, sb);
		}
		encodeEnd(sb);
		if (root.value != null && root.value != "") {
			encode(root.value, sb);
		} else {
			for (Element e : root.children) {
				encode(e, sb);
			}
		}
		encodeEnd(sb);
	}
	
	public static String encodeToString(Element root) {
		StringBuffer sb = new StringBuffer();
		encode(root, sb);
		return sb.toString();
	}
	
	public static void main(String args[]) {
		Element root = new Element("family");
		Attribute a1 = new Attribute("lastName", "0");
		Attribute a2 = new Attribute("state", "CA");
		root.insert(a1);
		root.insert(a2);
		
		Element child = new Element("person", "Some Message");
		Attribute a3 = new Attribute("firstName", "Gayle");
		child.insert(a3);
		
		root.insert(child);
		
		String s = encodeToString(root);
		System.out.println(s);
	}
}
