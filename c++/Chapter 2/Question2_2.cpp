#include <iostream>
#include "LinkedListClass/LinkedList.h"
#include "../Chapter 1/Question2_2.h"

// this implementation runs in O(n) time with O(1) space
// the end of the list corresponds to k = 1
Node* ktoLast(Node* head, int k)
{
    Node* current = head;
    int length = 0;

    // find the length of the list
    while (current)
    {
        length++;
        current = current->next;
    }
    
    // reset back to head
    current = head;
    
    if (k > length || k < 1)
    {
        return nullptr;
    }

    int count = 0;
    while (length - count != k)
    {
        count++;
        current = current->next;
    }

    return current;
}

int Question2_2::run()
{
    LinkedList* myList = new LinkedList();
    myList->insert(5);
    myList->insert(7);
    myList->insert(12);
    myList->insert(7);
    myList->insert(16);
    myList->insert(18);
    myList->insert(25);
    myList->insert(11);
    myList->insert(5);

    std::cout << "The list is: ";
    myList->display();

    std::cout << "The 4th to last element is: ";
    std::cout << ktoLast(myList->head, 4)->data << std::endl;
    delete myList;

    return 0;
}