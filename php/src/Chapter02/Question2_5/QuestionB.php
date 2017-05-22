<?php

namespace Chapter02\Question2_5;

use CTCILibrary\LinkedListNode;

class QuestionB
{
    public static function addLists(LinkedListNode $list1, LinkedListNode $list2)
    {
        $list1length = self::length($list1);
        $list2length = self::length($list2);

        $response = new LinkedListNode();

        // Make their size equal
        if ($list1length > $list2length) {
            $amount = $list1length - $list2length;
            $list2 = self::nodePad($list2, 0, $amount);
        } elseif ($list2length > $list1length) {
            $amount = $list2length - $list1length;
            $list1 = self::nodePad($list1, 0, $amount);
        }

        $result = new LinkedListNode();
        $current = $result;
        $carry = 0;
        $digit = 0;
        $sum = 0;

        while ($list1 || $list2) {

            $sum = $list1->data + $list2->data;
            $digit = $sum % 10;
            $carry = floor($sum / 10);


            // $current->data can be 0, with '==', 0 could be confused with null
            if ($current->data === null) {
                if ($carry == 1) {
                    $result = new LinkedListNode($carry);
                    $result->setNext($current);
                }
                $current->data = $digit;
            } else {
                if ($carry == 1) {
                    $current->data += $carry;
                }
                $current->setNext(new LinkedListNode($digit));
                $current = $current->next;
            }

            $list1 = $list1->next;
            $list2 = $list2->next;
        }

        // Scan for cascading carry
        $scan = $result;
        while ($scan->next) {
            if ($scan->next->data > 9) {
                $carry = 1;
                $scan->next->data %= 10;
                $scan->data += $carry;

                // start over
                $scan = $result;
                if ($scan->data > 9) {
                    $result = new LinkedListNode(1);
                    $scan->data %= 10;
                    $result->setNext($scan);
                }
            }
            $scan = $scan->next;
        }

        return $result;
    }

    public static function nodePad(LinkedListNode $list, int $value, $amount)
    {
        // Every time check the if null, if func has no typed params;
        if ($amount == 0) {
            return $list;
        };

        $newHead = new LinkedListNode($value);
        $newTail = $newHead;

        for ($i = 1; $i < $amount; $i++) {
            $next = new LinkedListNode($value);
            $newTail->setNext($next);
            $newTail = $next;
        }

        $newTail->setNext($list);
        return $newHead;
    }

    public static function length(LinkedListNode $list): int
    {
        $length = 0;
        while ($list) {
            $length++;
            $list = $list->next;
        }
        return $length;
    }
}