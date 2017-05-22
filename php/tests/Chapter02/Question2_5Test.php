<?php

use Chapter02\Question2_5\QuestionA;
use Chapter02\Question2_5\QuestionB;
use CTCILibrary\LinkedListNode;

class Question2_5Test extends \PHPUnit_Framework_TestCase
{
    public function testQuestionA()
    {
        $list1 = new LinkedListNode(7, new LinkedListNode(1, new LinkedListNode(6)));
        $list2 = new LinkedListNode(5, new LinkedListNode(9, new LinkedListNode(2)));
        $result = new LinkedListNode(2, new LinkedListNode(1, new LinkedListNode(9)));
        $response = QuestionA::addLists($list1, $list2);

        $this->assertEquals($result->printForward(), $response->printForward());
    }

    public function testQuestionB()
    {
        $list1 = new LinkedListNode(6, new LinkedListNode(1, new LinkedListNode(7)));
        $list2 = new LinkedListNode(2, new LinkedListNode(9, new LinkedListNode(5)));
        $result = new LinkedListNode(9, new LinkedListNode(1, new LinkedListNode(2)));
        $response = QuestionB::addLists($list1, $list2);

        $this->assertEquals($result->printForward(), $response->printForward());
    }

    public function testQuestionBCarryCascade()
    {
        $list1 = new LinkedListNode(5, new LinkedListNode(6, new LinkedListNode(9)));
        $list2 = new LinkedListNode(7, new LinkedListNode(8, new LinkedListNode(4)));
        $result = new LinkedListNode(1, new LinkedListNode(3, new LinkedListNode(5, new LinkedListNode(3))));
        $response = QuestionB::addLists($list1, $list2);

        $this->assertEquals($result->printForward(), $response->printForward());
    }

    public function testQuestionBCarryCascade2()
    {
        $list1 = new LinkedListNode(4, new LinkedListNode(4, new LinkedListNode(5)));
        $list2 = new LinkedListNode(5, new LinkedListNode(5, new LinkedListNode(5)));
        $result = new LinkedListNode(1, new LinkedListNode(0, new LinkedListNode(0, new LinkedListNode(0))));
        $response = QuestionB::addLists($list1, $list2);

        $this->assertEquals($result->printForward(), $response->printForward());
    }

    public function testQuestionBDiffSize()
    {
        $list1 = new LinkedListNode(6, new LinkedListNode(1, new LinkedListNode(7)));
        $list2 = new LinkedListNode(2, new LinkedListNode(9));
        $result = new LinkedListNode(6, new LinkedListNode(4, new LinkedListNode(6)));
        $response = QuestionB::addLists($list1, $list2);

        $this->assertEquals($result->printForward(), $response->printForward());
    }
}