//#include "stdafx.h"
#include <iostream>
#include <algorithm>
#include <cmath>
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>
#include <set>

using namespace std;

template<class T>
struct Node {
	T data;
	Node *left = nullptr, *right = nullptr;

	Node(const T &val) : data(val) { }
	~Node() {
		if (left) {
			delete left;
			left = nullptr;
		}
		if (right) {
			delete right;
			right = nullptr;
		}
	}
	Node *addLeftNode(const T &val) {
		left = new Node<T>(val);
		return left;
	}
	Node *addRightNode(const T &val) {
		right = new Node<T>(val);
		return right;
	}
};

Node<char> *loadTree() {
	Node<char> *root = new Node<char>('a');
	auto b = root->addLeftNode('b');
	auto c = root->addRightNode('c');

	auto d = b->addLeftNode('d');
	auto e = b->addRightNode('e');

	e->addLeftNode('f');
	e->addRightNode('g');

	auto h = c->addLeftNode('h');
	auto i = c->addRightNode('i');

	h->addLeftNode('j');

	return root;
}

template<class T>
void printInOrder(Node<T> *node) {
	if (node == nullptr)
		return;

	printInOrder(node->left);
	cout << node->data << ", ";
	printInOrder(node->right);
}

template<class T>
void printPreOrder(const Node<T> *node) {
	if (node == nullptr)
		return;

	cout << node->data << ", ";
	printPreOrder(node->left);
	printPreOrder(node->right);
}

template<class T>
bool lookFor(const Node<T> *node, const T &val, vector<const Node<T>*> &path) {
	if (node == nullptr) {
		return false;
	}
	path.push_back(node);
	if (node->data == val) {
		return true;
	}

	if (lookFor(node->left, val, path))
		return true;
	if (lookFor(node->right, val, path))
		return true;

	path.pop_back();
	return false;
}

template<class T>
vector<const Node<T>*> findPath(const Node<T> *node, const T &val) {
	vector<const Node<T>*> path;
	lookFor(node, val, path);
	return path;
}


template<class T>
const Node<T>* getFirstCommonAncestor(const Node<T> *root, const T &val1, const T&val2) {
	vector<const Node<T>*> path1 = findPath(root, val1);
	vector<const Node<T>*> path2 = findPath(root, val2);
	int minPathLength = path1.size() < path2.size() ? path1.size() : path2.size();

	for (int i = 0; i < minPathLength; ++i) {
		if (path1[i]->data != path2[i]->data) {
			return i > 0 ? path1[i - 1] : nullptr;
		}
	}
	return nullptr;
}


int main() {
	shared_ptr<Node<char>> root(loadTree());
	printPreOrder(root.get());
	cout << endl << endl;

	char val1 = 'd', val2 = 'g';
	const Node<char> *antecestor = getFirstCommonAncestor(root.get(), val1, val2);
	char defaultVal = char();
	if (antecestor != nullptr) {
		cout << "First Common Ancestor of node: \'" << val1 << "\' and \'" << val2 << "\' is: \t" << antecestor->data << endl;
	}
	else {
		cout << "No common ancestor found" << endl;
	}

	return EXIT_SUCCESS;
}

