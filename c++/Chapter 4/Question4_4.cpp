#include<iostream>
#include<vector>
#include<list>
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

void findLevelLinkedLists(vector<list<node*> > &res, node* root){
    list<node*> li;
    li.push_back(root);
    res.push_back(li);
    int depth = 0;
    while(!res[depth].empty()){
        list<node*> l;
        list<node*>::iterator iter;
        for(iter = res[depth].begin(); iter!=res[depth].end(); iter++ ){
            node *ptr = *iter;
            if(ptr->left)
                l.push_back(ptr->left);
            if(ptr->right)
                l.push_back(ptr->right);
        }
        res.push_back(l);
        depth++;
    }
}

void printLevelLinkedLists(vector<list<node*> > res){
    vector<list<node*> >::iterator iter;
    for(iter = res.begin(); iter!= res.end(); iter++){
        list<node*> li = *iter;
        list<node*>::iterator it;
        for(it = li.begin(); it!=li.end(); it++){
            node* ptr = *it;
            cout<<ptr->data<<" ";
        }
        cout<<'\n';
    }
}

int main(){
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    node* root;
    root = NULL;
    createMinimalBst(root, arr, 0, 8);
    vector<list<node*> > res;
    findLevelLinkedLists(res, root);
    printLevelLinkedLists(res);
}
