//write code to remove duplicates from an unsorted linked list

#include <iostream.h>
#include <hash_map.h>
using namespace std;

#define LENGTH 10

typedef struct _list{
	int data;
	struct _list* next;
}Node;

int removeDuplicates(Node* list){
	hash_map<int,int> set;
	Node* previous=list;
	Node* current=list;
	int length=0;
	while(current!=NULL){
		if(set.find(current->data)==set.end()){
			previous=current;
			set[current->data]=current->data;
			length++;
		}
		else{			
			previous->next=current->next;
			//free(current);
		}
		current=current->next;
	}
	return length;
}

int main(){
	Node* list=NULL;
	int i;
	int len;
	Node* current=list;
	for(i=0;i<LENGTH;i++){
		Node* newNode=(Node*)malloc(sizeof(Node));
		newNode->data=rand()%10;
		newNode->next=list;
		list=newNode;
	}
	len=removeDuplicates(list);
	current=list;
	for(i=0;i<len;i++){
		cout<<current->data<<endl;
		current=current->next;
	}
	return 0;
}