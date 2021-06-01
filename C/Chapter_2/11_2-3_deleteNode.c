//Delete a node in the middle of a singly linked list,
//given only access to that node.

#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define LENGTH 10
#define K 5

typedef struct _list{
	int data;
	struct _list* next;
}Node;

void deleteNode(Node* node){
	Node* next=node->next;
	node->data=next->data;
	node->next=next->next;
	free(next);
}

int main(){
	Node* list=NULL;
	int i,j;
	int len=0;
	Node* current;
	Node* node;
	//Create a random linked list
	for(i=0;i<LENGTH;i++){
		Node* newNode=(Node*)malloc(sizeof(Node));
		newNode->data=rand()%10;
		newNode->next=list;
		list=newNode;
	}

	//Get a random node
	node=list;
	srand((unsigned)time(NULL));
	j=rand()%10;
	i=0;
	while(++i<j){
		node=node->next;
	}

	printf("Deleting the %dth node: %d\n",j,node->data);
	deleteNode(node);
	current=list;
	while(current!=NULL){
		printf("%d ",current->data);
		current=current->next;
	}
	printf("\n");
	return 0;
}