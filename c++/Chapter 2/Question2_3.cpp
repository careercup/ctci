#include <iostream>
#include "LinkedListClass/LinkedList.h"
#include "../Chapter 1/Question2_3.h"

// runs in O(1) time with O(1) space (note: this is only true if you are not iterating through the list)
bool removeNode(Node* node)
{
    if (node == NULL || node->next == NULL)
    {
        return false;
    }

    // copy the next nodes information to the current
    // node and then delete the next node updating the pointers
    Node* temp = node->next;
    node->data = temp->data;
    node->next = temp->next;
    delete temp;

    return true;
}

int Question2_3::run()
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

    // just get a node in the list
    Node* temp = myList->head->next->next->next->next;

    std::cout << "The original list is: ";
    myList->display();

    std::cout << "Removing node with value: " << temp->data << std::endl;
    removeNode(temp);

    std::cout << "The new list is: ";
    myList->display();

    delete myList;

    return 0;
}