<?php

use Chapter01\Question1_3\Question;

class Question1_3Test extends \PHPUnit_Framework_TestCase
{
    protected $word;

    protected function setUp()
    {
        $this->word = ['abc d e f', 'abc%20d%20e%20f'];
    }

    public function testReplaceSpaces()
    {
        $this->assertEquals($this->word[1], Question::replaceSpaces($this->word[0]));
    }
}