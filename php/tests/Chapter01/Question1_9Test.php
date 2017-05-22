<?php

use Chapter01\Question1_9\Question;

class Question1_9Test extends \PHPUnit_Framework_TestCase
{
    protected $words;

    protected function setUp()
    {
        $this->words = [
            ['apple', 'pleap', true],
            ['waterbottle', 'erbottlewat', true],
            ['camera', 'macera', false]
        ];
    }


    public function testIsRotation()
    {
        foreach ($this->words as $check) {
            $this->assertEquals($check[2], Question::isRotation($check[0], $check[1]));
        }
    }
}