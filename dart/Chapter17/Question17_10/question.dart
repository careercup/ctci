
class Attribute {
  String tag;
  String value;
  Attribute(this.tag, this.value);

  String getTagCode() {
    if (tag == "family") {
      return "1";
    } else if (tag == "person") {
      return "2";
    } else if (tag == "firstName") {
      return "3";
    } else if (tag == "lastName") {
      return "4";
    } else if (tag == "state") {
      return "5";
    }

    return "--";
  }
}


class Element {
  List<Attribute> attributes;
  List<Element> children;
  String name;
  String value;

  Element(String this.name, [String this.value]) :
    attributes = new List<Attribute>(),
    children = new List<Element>() { }

  String getNameCode() {
    if (name == "family") {
      return "1";
    } else if (name == "person") {
      return "2";
    } else if (name == "firstName") {
      return "3";
    } else if (name == "lastName") {
      return "4";
    } else if (name == "state") {
      return "5";
    }

    return "--";
  }

  void insertAttribute(Attribute attribute) {
    attributes.add(attribute);
  }

  void insertElement(Element child) {
    children.add(child);
  }
}

void encodeString(String v, StringBuffer sb) {
  v = v.replaceAll("0", "\\0");
  sb.write(v);
  sb.write(" ");
}

void encodeEnd(StringBuffer sb) {
  sb.write("0");
  sb.write(" ");
}

void encodeAttribute(Attribute attr, StringBuffer sb) {
  encodeString(attr.getTagCode(), sb);
  encodeString(attr.value, sb);
}

void encodeElement(Element root, StringBuffer sb) {
  encodeString(root.getNameCode(), sb);
  for (Attribute a in root.attributes) {
    encodeAttribute(a, sb);
  }

  encodeEnd(sb);

  if (root.value != null && root.value != "") {
    encodeString(root.value, sb);
  } else {
    for (Element e in root.children) {
      encodeElement(e, sb);
    }
  }

  encodeEnd(sb);
}

String encodeToString(Element root) {
  StringBuffer sb = new StringBuffer();
  encodeElement(root, sb);
  return sb.toString();
}

void main() {
  Element root = new Element("family");
  Attribute a1 = new Attribute("lastName", "0");
  Attribute a2 = new Attribute("state", "CA");
  root.insertAttribute(a1);
  root.insertAttribute(a2);

  Element child = new Element("person", "Some Message");
  Attribute a3 = new Attribute("firstName", "Gayle");
  child.insertAttribute(a3);

  root.insertElement(child);

  String s = encodeToString(root);
  print(s);
}
