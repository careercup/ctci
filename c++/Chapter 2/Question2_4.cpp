#include <iostream>
#include "LinkedListClass/LinkedList.h"
#include "../Chapter 1/Question2_4.h"

// runs in O(n) time with O(n) space
// there are various ways to do this, but I end up deleting the original list
// and returning the merged lower and upper value lists
Node* partition(Node* head, int val)
{
    if (head == NULL)
    {
        return nullptr;
    }

    LinkedList* upper = new LinkedList();
    LinkedList* lower = new LinkedList();
    Node* current = head;

    while (current)
    {
        if (current->data < val)
        {
            lower->insert(current->data);
        }
        else
        {
            upper->insert(current->data);
        }

        current = current->next;
    }

    // reset current back to the head
    current = lower->head;
    Node* lowNode = lower->head;

    // find the end of the lower list
    while (lowNode->next)
    {
        lowNode = lowNode->next;
    }
    lowNode->next = upper->head;

    return current;
}

int Question2_4::run()
{
    LinkedList* myList = new LinkedList();
    myList->insert(5);
    myList->insert(14);
    myList->insert(17);
    myList->insert(22);
    myList->insert(16);
    myList->insert(18);
    myList->insert(2);
    myList->insert(1);
    myList->insert(5);

    std::cout << "The original list is: ";
    myList->display();

    Node* newHead = partition(myList->head, 13);
    delete myList;

    LinkedList* newList = new LinkedList();
    newList->head = newHead;

    std::cout << "The list partitioned around value 13 is: ";
    newList->display();
    delete newList;
  
    return 0;
}