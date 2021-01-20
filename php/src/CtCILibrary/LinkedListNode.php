<?php

namespace CTCILibrary;

use phpDocumentor\Reflection\DocBlock\Tags\Link;

class LinkedListNode
{
    /**
     * @var LinkedListNode
     */
    public $next;

    /**
     * Doubly Linked List
     *
     * @var LinkedListNode
     */
    public $prev;
    public $last;
    public $data;

    public function __construct(int $data = null, LinkedListNode $next = null, LinkedListNode $prev = null)
    {
        if ($data !== null) {
            $this->data = $data;
        }
        if ($next != null) {
            $this->setNext($next);
        }
        if ($prev != null) {
            $this->setPrev($prev);
        }
    }

    public function setNext(LinkedListNode $next)
    {
        $this->next = $next;
        if ($this == $this->last) {
            $this->last = $next;
        }
        if ($next != null && $next->prev != $this) {
            $next->setPrev($this);
        }
    }

    public function setPrev(LinkedListNode $prev)
    {
        $this->prev = $prev;
        if ($prev != null && $prev->next != $this) {
            $prev->setNext($this);
        }
    }

    public function printForward(): string
    {
        if ($this->next != null) {
            return $this->data . "->" . $this->next->printForward();
        } else {
            // I don't know why she did this
            return strval((int)$this->data);
        }
    }

    public function cloneNode(): LinkedListNode
    {
        $next2 = null;
        if ($this->next != null) {
            // Makes a recursive call
            $next2 = $this->next->cloneNode();
        }

        $head2 = new LinkedListNode($this->data, $next2);
        return $head2;
    }
}