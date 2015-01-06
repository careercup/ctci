#include <iostream>
using namespace std;

struct node {
	int data;
	node* right;
	node* left;
	int leftSize;
};

void track(int k, node* &root){
	if (root == NULL) {
		root = new node;
		root->data = k;
		root->right = root->left = NULL;
		root->leftSize = 0;
	}
	else {
		if (root->data > k) {
			root->leftSize++;
			track(k, root->left);
		}
		else
			track(k, root->right);
	}
}

int getRank(int x, node* root) {
	int data = root->data;
	if (data == x)
		return root->leftSize;
	if (data > x)
		return getRank(x, root->left);
	else {
		return root->leftSize + 1 + getRank(x, root->right);
	}
}

int main(){
	node *root = NULL;
	int arr[] = {12, 15, 12, 11, 10, 10, 11, 10};
	for (int i = 0; i < 8; ++i) {
		track(arr[i], root);
	}
	cout<<getRank(15, root);
	return 0;
}