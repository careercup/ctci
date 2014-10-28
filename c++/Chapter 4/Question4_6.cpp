#include<iostream>
#include<stack>
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
/*
node* inOrderSuccessorWithParent(node* root, node* ptr){
    if(ptr->right){
        node *p = ptr;
        while(p->left){
            p = p->left;
        }
        return p;
    }
    else{
        if(ptr==ptr->parent->left){
            return ptr->parent;
        }
        else{
            while(ptr!=ptr->parent->left){
                ptr = ptr->parent;
            }
            return ptr->parent;
        }
    }
}
*/
node* inOrderSuccessor(node* root, int k){
    stack<node*> S;
    node *ptr = root;
    bool searched = false;
    while(true){
        while(ptr){
            S.push(ptr);
            ptr = ptr->left;
        }
        if(S.empty())
            break;
        ptr = S.top();
        S.pop();
        //cout<<ptr->data<<" ";
        if(searched)
            return ptr;
        if(ptr->data==k){
            searched = true;
        }
        ptr = ptr->right;
    }
    return false;
}

int main(){
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    node* root;
    root = NULL;
    createMinimalBst(root, arr, 0, 8);
    node* searchedNode = inOrderSuccessor(root, 4);
    cout<<searchedNode->data<<'\n';
}
