#ifndef __LINKEDLIST_h__
#define __LINKEDLIST_h__

struct Node
{
    int data;
    Node* next;
    // bool visited;
};

class LinkedList 
{
    public:
        Node* head;
        LinkedList();
        ~LinkedList();
        void display();
        void insert(int value);
        void createCycle();
    private:
    // added this so insertion is O(1) time
        Node* tail;
}; 

#endif // __LINKEDLIST_h__