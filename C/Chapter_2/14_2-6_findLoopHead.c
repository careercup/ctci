//Given a circular linked list, implement an algorithm
//which returns the node at the beginning of the loop

#include<stdio.h>
#include<stdlib.h>

#define LENGTH 10

typedef struct _list{
	int data;
	struct _list* next;
}Node;

Node* createLoopList(int length,int loopHeadIndex){
	Node* list=NULL;
	int i;
	Node* current;
	Node* loopHead;
	//create list (from 0 to length)
	for(i=0;i<length;i++){
		Node* newNode=(Node*)malloc(sizeof(Node));
		newNode->data=length-i-1;
		newNode->next=list;
		list=newNode;
	}
	//set a loop
	i=0;
	current=list;
	while(current->next!=NULL){
		if(i==loopHeadIndex){
			loopHead=current;
		}
		current=current->next;
		i++;
	}
	current->next=loopHead;
	printf("Setting loop head...: %d\n",loopHead->data);
	return list;
}

Node* findLoopHead(Node* list){
	Node* fast=list;
	Node* slow=list;
	//when they meet, break
	while(fast!=NULL&&fast->next!=NULL){
		slow=slow->next;
		fast=fast->next->next;
		if(slow==fast){
			break;
		}
	}
	if(fast==NULL||fast->next==NULL){
		return NULL;
	}
	//The distance from list head to loop head is equals
	//to the distance from loop head to collision spot
	slow=list;
	while(slow!=fast){
		slow=slow->next;
		fast=fast->next;
	}
	return slow;
}


int main(){
	Node* list=createLoopList(LENGTH,6);
	Node* loopHead=findLoopHead(list);
	printf("Finding the loop head...: %d\n",loopHead->data);

	return 0;
}
