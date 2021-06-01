#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <memory>

using namespace std;

/** Attribute class */
class Attribute {

private:
  string tag;
  string value;

public:
  Attribute(); // def cons
  Attribute(string, string); // cons
  ~Attribute(); // destructor

  /** getters */
  string get_tag() { return tag; }

  string get_value() { return value; }

  /** other functions */
  string get_tag_code();
};

/** Attribute constructor and functions */
Attribute::Attribute() { }

Attribute::Attribute(string tag, string value) {
  this->tag = tag;
  this->value = value;
}

Attribute::~Attribute() { }

string Attribute::get_tag_code() {
  if (this->tag == "family")
			return "1";
		else if (this->tag == "person")
			return "2";
		else if (this->tag == "firstname")
			return "3";
		else if (this->tag == "lastname")
			return "4";
		else if (this->tag == "state")
			return "5";
		else
			return "--";
}

/** Element Class */
class Element {

private:
  string name;
  string value;
  vector<Attribute> attributes;
  vector<Element> children;

public:
  Element(); // def cons
  Element(string); // cons 1
  Element(string, string); // cons 2

  ~Element(); // des

  /** getters */
  string get_name() { return name; }

  string get_value() { return value; }

  vector<Attribute> get_attributes() { return attributes; }

  vector<Element> get_children() { return children; }

  /** other functions */
  string get_name_code();
  void insert_Att(Attribute att) {
    attributes.push_back(att);
  }
  void insert_Elem(Element elem) {
    children.push_back(elem);
  }
};

/** Element constructor and functions */
Element::Element() { }

Element::Element(string name) {
  this->name = name;
}

Element::Element(string name, string value) {
  this->name = name;
  this->value = value;
}

Element::~Element() { }

string Element::get_name_code() {
  if (this->name == "family")
			return "1";
	else if (this->name == "person")
		return "2";
	else if (this->name == "firstname")
		return "3";
	else if (this->name == "lastname")
		return "4";
	else if (this->name == "state")
		return "5";
	else
		return "--";
}

/* Function declarations */
void encode(Element root, string& str);
void encode(Attribute attr, string& str);
void encode(string str1, string& str2);
string encode_xml_to_str(Element& root);

/** Common functions definitions */

void encode(Element root, string& str) {

  /* Append the root's name code */
  encode(root.get_name_code(), str);

  /* Recurse over the attributes */
  for (auto& attr : root.get_attributes()) {
    encode(attr, str);
  }

  encode("0", str); // this is the end of the element hence append as '0'

  /* Recurse over the child Elements */
  if (root.get_value() != "") {
    encode(root.get_value(), str);
  }
  else {
    for (auto& child : root.get_children()) {
      encode(child, str);
    }
  }
  encode("0", str);
}

void encode(Attribute attr, string& str) {
  encode(attr.get_tag_code(), str);
  encode(attr.get_value(), str);
}

void encode(string str1, string& str2) {
  str2 += str1 + " ";
}

string encode_xml_to_str(Element& root) {
  string str = "";
  encode(root, str);
  return str;
}

/****** MAIN FUNCTION ******/

int main() {

  /** Forming the XML */
  Element root("family");
  Attribute a1("lastname", "McDowell");
  Attribute a2("state", "CA");
  root.insert_Att(a1);
  root.insert_Att(a2);

  Element child("person", "Some Message");
  Attribute a3("firstname", "Gayle");
  child.insert_Att(a3);
  root.insert_Elem(child);

  /** Calling the encode xml function */
  string res = encode_xml_to_str(root);

  cout << res << endl;

  return 0;
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_10.cpp -o Question17_10
./Question17_10

*/
