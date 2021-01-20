<?php

namespace Chapter02\Question2_5;

use CTCILibrary\LinkedListNode;

class QuestionA
{
    public static function addLists(LinkedListNode $list1, LinkedListNode $list2)
    {
        $result = new LinkedListNode();
        $current = $result;
        $carry = 0;
        $digit = 0;
        $sum = 0;

        while ($list1 || $list2) {

            if ($list1 && $list2) {
                $sum = $list1->data + $list2->data + $carry;
                $digit = $sum % 10;
                $carry = floor($sum / 10);
            } elseif ($list1 && !$list2) {
                $digit = $list1->data;
            } elseif (!$list1 && $list2) {
                $digit = $list2->data;
            }

            if ($current->data == null) {
                $current->data = $digit;
            } else {
                $current->setNext(new LinkedListNode(intval($digit)));
                $current = $current->next;
            }


            if ($list1) {
                $list1 = $list1->next;
            }

            if ($list2) {
                $list2 = $list2->next;
            }
        }

        return $result;
    }
}