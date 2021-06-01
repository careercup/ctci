//Partition a linked list around a value x,
//such that all nodes less than x come before
//all nodes greater than or equal to x.

#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define LENGTH 10

typedef struct _list{
	int data;
	struct _list* next;
}Node;

void print(Node* list){
	Node* current=list;
	while(current!=NULL){
		printf("%d ",current->data);
		current=current->next;
	}
	printf("\n");
}

Node* partition(Node* list,int x){
	Node* current=list;
	Node* previous;
	Node* temp;
	while(current!=NULL){
		//Put every node that is less than x at the head
		if(current->data<x&&current!=list){
			temp=current->next;			
			current->next=list;
			list=current;
			/*if(current->next==NULL){
				previous->next=NULL;
				break;
			}*/
			previous->next=temp;
			current=temp;
			print(list);
		}
		else{
			previous=current;
			current=current->next;			
		}		
	}
	return list;
}


int main(){
	Node* list=NULL;
	int i,x;
	int len=0;
	Node* current;
	//Create a random linked list
	for(i=0;i<LENGTH;i++){
		Node* newNode=(Node*)malloc(sizeof(Node));
		newNode->data=rand()%10;
		newNode->next=list;
		list=newNode;
	}

	//Get a random number
	srand((unsigned)time(NULL));
	x=rand()%10;

	printf("Rearranging by %d...\n",x);
	list=partition(list,x);
	current=list;
	while(current!=NULL){
		printf("%d ",current->data);
		current=current->next;
	}
	printf("\n");
	return 0;
}
