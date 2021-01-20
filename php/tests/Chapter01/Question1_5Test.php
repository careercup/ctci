<?php

use Chapter01\Question1_5\Question;

class Question1_5Test extends \PHPUnit_Framework_TestCase
{
    protected $words;

    protected function setUp()
    {
        $this->words = [
            ['apple', 'appla', true],
            ['apple', 'aple', true],
            ['apple', 'app', false]
        ];
    }

    public function testOneEditReplace()
    {
        foreach ($this->words as $check) {
            $this->assertEquals($check[2], Question::oneEditAway($check[0], $check[1]));
        }
    }

    public function testOneEditReplace2()
    {
        foreach ($this->words as $check) {
            $this->assertEquals($check[2], Question::oneEditAway2($check[0], $check[1]));
        }
    }
}