#include<iostream>
using namespace std;

struct node{
    int data;
    node *right, *left;
};

void createMinimalBst(node* &root, int arr[], int start, int end){
    if(start>end)
        return;
    if(root==NULL){
        node *ptr = new node;
        int ind = start + (end-start)/2;
        ptr->data = arr[ind];
        ptr->left = NULL;
        ptr->right = NULL;
        root = ptr;
        createMinimalBst(root->left, arr, start, ind-1);
        createMinimalBst(root->right, arr, ind+1, end);
    }
}

bool isIdentical(node* root1, node* root2){
    if(root1 == NULL && root2 == NULL)
        return true;
    if(root1 == NULL || root2 == NULL)
        return false;
    if(root1->data == root2->data && isIdentical(root1->left, root2->left) && isIdentical(root1->right, root2->right))
        return true;
    return false;
}

bool isSubTree(node* root, node* subRoot){
    if(root == NULL && subRoot == NULL)
        return true;
    if(root == NULL || subRoot == NULL)
        return false;
    return isIdentical(root, subRoot) || isSubTree(root->left, subRoot) || isSubTree(root->right, subRoot);
}

int main(){
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};    // Bigger Tree
    int arr1[] = {1, 2, 3, 4};                  // Subtree
    node *root, *subRoot;
    root = subRoot = NULL;
    createMinimalBst(root, arr, 0, 8);
    createMinimalBst(subRoot, arr1, 0, 3);
    //cout<<isIdentical(root->left->left->left, subRoot->left);
    cout<<isSubTree(root, subRoot);
    return 0;
}
