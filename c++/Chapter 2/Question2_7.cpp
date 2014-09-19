#include <iostream>
#include "LinkedListClass/LinkedList.h"
#include "../Chapter 1/Question2_7.h"

// I am a fan of the reverse and compare approach so I will
// use that technique. Runs in O(n) time with O(n) space
Node* reverse(Node *head);

// a helper function that reverses a linked list
Node* reverseList(Node* head)
{
    if (head == NULL)
    {
        return nullptr;
    }

    Node* previous = nullptr;

    while (head)
    {
        Node* temp = head->next;
        head->next = previous;
        previous = head;
        head = temp;
    }

    head = previous;

    return head;
}


bool isPalindrome(Node* head)
{
    Node* temp = head;
    LinkedList* rev = new LinkedList();
    int len = 0;
    int count = 0;

    // copy the list
    while (temp)
    {
        rev->insert(temp->data);
        temp = temp->next;
        len++;
    }

    // reset to head
    temp = head;

    // reverse the list
    rev->head = reverseList(rev->head);
    Node* revHead = rev->head;

    // now compare the two but only up to half way
    while (count != len / 2)
    {
        if (revHead->data != temp->data)
        {
            return false;
        }

        revHead = revHead->next;
        temp = temp->next;
        count++;
    }

    return true;
}



int Question2_7::run()
{
    LinkedList* list1 = new LinkedList();
    list1->insert(5);
    list1->insert(3);
    list1->insert(6);
    list1->insert(8);
    list1->insert(1);
    list1->insert(2);

    std::cout << "Is the list: ";
    list1->display();
    std::cout << "a palindrome: " << isPalindrome(list1->head) << std::endl;

    LinkedList* list2 = new LinkedList();
    list2->insert(5);
    list2->insert(3);
    list2->insert(6);
    list2->insert(6);
    list2->insert(3);
    list2->insert(5);

    std::cout << std::endl << "Is the list: ";
    list2->display();
    std::cout << "a palindrome: " << isPalindrome(list2->head) << std::endl;
    
    return 0;
}