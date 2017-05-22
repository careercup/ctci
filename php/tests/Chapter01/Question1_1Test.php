<?php

use Chapter01\Question1_1\Question;

class Question1_1Test extends \PHPUnit_Framework_TestCase
{
    protected $words;

    protected function setUp()
    {
        $this->words = [
            'abcde' => true,
            'hello' => false,
            'apple' => false,
            'kite' => true,
            'padle' => true
        ];
    }

    public function testIsUniqueChars()
    {
        foreach ($this->words as $word => $result) {
            $this->assertEquals(Question::isUniqueChars($word), $result);
        }
    }

    public function testIsUniqueChars2()
    {
        foreach ($this->words as $word => $result) {
            $this->assertEquals(Question::isUniqueChars2($word), $result);
        }
    }
}