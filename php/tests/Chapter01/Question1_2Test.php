<?php

use Chapter01\Question1_2\Question;

class Question1_2Test extends \PHPUnit_Framework_TestCase
{
    protected $words;

    protected function setUp()
    {
        $this->words = [
            ['apple', 'papel', true],
            ['carrot', 'tarroc', true],
            ['hello', 'llloh', false]
        ];
    }

    public function testIsPermutation()
    {
        foreach ($this->words as $check) {
            $this->assertEquals($check[2], Question::isPermutation($check[0], $check[1]));
        }
    }

    public function testIsPermutation2()
    {
        foreach ($this->words as $check) {
            $this->assertEquals($check[2], Question::isPermutation2($check[0], $check[1]));
        }
    }
}