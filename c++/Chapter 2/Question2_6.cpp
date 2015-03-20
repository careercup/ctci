#include <iostream>
#include "LinkedListClass/LinkedList.h"
#include "../Chapter 1/Question2_6.h"

// runs in O(n) time with O(1) space
Node* findCycleBegin(Node* head)
{
    if (head == NULL)
    {
        return nullptr;
    }

    Node* slow = head;
    Node* fast = head;
    int diff = 0;

    while (fast != NULL && fast->next != NULL)
    {
        slow = slow->next;
        fast = fast->next->next;

        if (slow == fast) // a collision
        {
            break;
        }
    }

    // a check to make sure that there was in fact a loop
    if (fast == NULL || fast->next == NULL)
    {
        return nullptr;
    }

    // slow is set to the head and then both are moved at the same pace
    slow = head;
    while (slow != fast)
    {
        slow = slow->next;
        fast = fast->next;
    }

    // once they meet, they are at the start of the loop
    return slow;
}



/*
 I suppose the below implementation would be a bit too easy
Node* findCycleBegin(Node* head)
{
  if (head == NULL) return NULL;

  Node* current = head;

  while (current->visited != true)
  {
    current->visited = true;
    current = current->next;
  }

  return current;
}*/


int Question2_6::run()
{
    LinkedList* list1 = new LinkedList();
    list1->insert(5);
    list1->insert(3);
    list1->insert(6);
    list1->insert(8);
    list1->insert(1);
    list1->insert(2);

    std::cout << "For the list: ";
    list1->display();
    std::cout << "A cycle begins at value: ";

    // create a cycle in the list
    list1->createCycle();

    Node* beginCycle = findCycleBegin(list1->head);
    std::cout << beginCycle->data << std::endl;

    return 0;
}