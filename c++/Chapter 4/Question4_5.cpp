#include<iostream>
#include<climits>
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

bool isBst(node* root, int lower, int upper){
    if(root==NULL){
        return true;
    }
    if(root->data<=upper && root->data>=lower){
        return (isBst(root->left, lower, root->data) && isBst(root->right, root->data+1, upper));
    }
    else
        return false;
}

int main(){
    int arr[] = {1, 2, 2, 4, 5, 6, 7, 8, 9};    //Not a BST
    int arr[] = {2, 2, 3, 4, 5, 6, 7, 8, 9};    //is BST
    node* root;
    root = NULL;
    createMinimalBst(root, arr, 0, 8);
    cout<<isBst(root, INT_MIN, INT_MAX);
}
