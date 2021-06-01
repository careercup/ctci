//Write a code to remove duplicates from an unsorted linked list (a temporary buffer is not allowed)

#include<stdio.h>
#include<stdlib.h>

#define LENGTH 10

typedef struct _list{
	int data;
	struct _list* next;
}Node;

void removeDuplicates(Node* list){
	Node* current=list;
	while(current!=NULL){
		Node* iterator=current;
		while(iterator->next!=NULL){
			if(iterator->next->data==current->data){
				iterator->next=iterator->next->next;
			}
			else{
				iterator=iterator->next;
			}
		}
		current=current->next;
	}
}

int main(){
	Node* list=NULL;
	int i;
	int len=0;
	Node* current=list;
	for(i=0;i<LENGTH;i++){
		Node* newNode=(Node*)malloc(sizeof(Node));
		newNode->data=rand()%10;
		newNode->next=list;
		list=newNode;
	}
	removeDuplicates(list);
	current=list;
	while(current!=NULL){
		len++;
		current=current->next;
	}
	current=list;
	for(i=0;i<len;i++){
		printf("%d\n",current->data);
		current=current->next;
	}
	return 0;
}