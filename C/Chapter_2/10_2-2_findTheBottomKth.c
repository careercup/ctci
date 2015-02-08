//Find the kth to last element of a singly linked list

#include<stdio.h>
#include<stdlib.h>

#define LENGTH 10
#define K 5

typedef struct _list{
	int data;
	struct _list* next;
}Node;
//Only simply print out
int findTheBottomKth1(Node* list,int k){
	int i;
	if(list==NULL){
		return 0;
	}
	i=findTheBottomKth1(list->next,k)+1;
	if(i==k){
		printf("%d\n",list->data);
	}
	return i;
}
//Actually return the kth element
Node* findTheBottomKth2(Node* list,int k){
	Node* ptr1=list;
	Node* ptr2=list;
	int i=0;
	while(i++<k-1){
		ptr1=ptr1->next;
		if(ptr1==NULL){
			return NULL;
		}
	}
	while(ptr1->next!=NULL){
		ptr1=ptr1->next;
		ptr2=ptr2->next;
	}
	return ptr2;
}

int main(){
	Node* list=NULL;
	int i;
	int len=0;
	Node* current=list;
	Node* kth;
	for(i=0;i<LENGTH;i++){
		Node* newNode=(Node*)malloc(sizeof(Node));
		newNode->data=rand()%10;
		newNode->next=list;
		list=newNode;
	}
	findTheBottomKth1(list,K);
	kth=findTheBottomKth2(list,K);
	printf("%d\n",kth->data);
	return 0;
}