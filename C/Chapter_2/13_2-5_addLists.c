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

Node* addLists(Node* list1,Node* list2){
	Node* current1=list1;
	Node* current2=list2;
	Node* newList=NULL;
	int carry=0;
	int sum=0;
	while(current1!=NULL&&current2!=NULL){
		sum=current1->data+current2->data+carry;
		if(sum>9){
			sum-=10;
			carry=1;
		}
		else{
			carry=0;
		}
		newList=addNode(newList,sum);
		current1=current1->next;
		current2=current2->next;
	}
	while(current1!=NULL){
		sum=current1->data+carry;
		if(sum>9){			
			carry=1;
			sum-=10;
		}
		else{
			carry=0;
		}	
		newList=addNode(newList,sum);
		current1=current1->next;
	}
	while(current2!=NULL){
		sum=current2->data+carry;
		if(sum>9){			
			carry=1;
			sum-=10;
		}
		else{
			carry=0;
		}	
		newList=addNode(newList,sum);
		current2=current2->next;
	}
	if(carry==1){
		newList=addNode(newList,1);
	}
	return newList;
}


int main(){
	Node* list1;
	Node* list2;
	Node* sum;
	//Create a random linked list
	srand((unsigned)time(NULL));
	list1=createRandomList(rand()%3+1);
	list2=createRandomList(rand()%3+1);

	printf("Adding ");
	print(list1);
	printf("   and ");
	print(list2);
	printf("...\n");

	sum=addLists(list1,list2);
	print(sum);

	return 0;
}
