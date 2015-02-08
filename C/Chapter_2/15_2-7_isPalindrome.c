//Check if a linked list is a palindrome

#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define LENGTH 10

typedef struct _list{
	int data;
	struct _list* next;
}Node;

typedef struct _node{
	int data;
	struct _node* next;
}StackNode;

typedef struct _stack{
	StackNode* stack;
	int size;
}Stack;

Stack* createStack(){
	Stack* new_stack=malloc(sizeof(Stack));
	new_stack->stack=NULL;
	new_stack->size=0;
	return new_stack;
}

void push(Stack* s,int data){
	StackNode* newData=(StackNode*)malloc(sizeof(Stack));
	newData->data=data;	
	newData->next=s->stack;
	s->stack=newData;
	s->size++;
}

int pop(Stack* s){
	int data=s->stack->data;
	StackNode* next=s->stack->next;
	free(s->stack);
	s->stack=next;	
	return data;
}

void printList(Node* list){
	Node* current=list;
	while(current!=NULL){
		printf("%d ",current->data);
		current=current->next;
	}
	printf("\n");
}

Node* createRandomList(int length){
	Node* list=NULL;
	int i;
	for(i=0;i<length;i++){
		Node* newNode=(Node*)malloc(sizeof(Node));
		newNode->data=rand()%10;
		newNode->next=list;
		list=newNode;
	}
	return list;
}

Node* addNode(Node* list,int data){
	Node* newNode=(Node*)malloc(sizeof(Node));
	newNode->data=data;
	newNode->next=list;
	return newNode;
}
//!!!!!!!!!!!!!!
int isPalindrome(Node* list){
	Node* fast=list;
	Node* slow=list;
	Stack* stack=createStack();
	//Store first half of the list on stack
	while(fast!=NULL&&fast->next!=NULL){
		push(stack,slow->data);
		slow=slow->next;
		fast=fast->next->next;		
	}
	//Skip the middle element if there are odd number of elements
	if(fast!=NULL){
		slow=slow->next;
	}
	//Compare data on stack and data in second half of the list 
	while(slow!=NULL){
		if(slow->data!=pop(stack)){
			return 0;
		}
		slow=slow->next;
	}
	return 1;
}

int main(){
	Node* list1=NULL;
	Node* list2=NULL;
	//Create two linked list
	list1=addNode(list1,1);
	list1=addNode(list1,2);
	//list1=addNode(list1,3);
	list1=addNode(list1,2);
	list1=addNode(list1,1);

	list2=addNode(list2,1);
	list2=addNode(list2,3);
	list2=addNode(list2,2);
	list2=addNode(list2,1);
	//Check if they are palindrome
	printList(list1);
	if(isPalindrome(list1)){		
		printf("is palindrome.\n");
	}
	else{
		printf("is not palindrome.\n");
	}
	printList(list2);
	if(isPalindrome(list2)){
		
		printf("is palindrome.\n");
	}
	else{
		printf("is not palindrome.\n");
	}
	return 0;
}
