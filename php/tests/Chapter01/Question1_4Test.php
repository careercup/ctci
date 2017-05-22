<?php

use Chapter01\Question1_4\Question;

class Question1_4Test extends \PHPUnit_Framework_TestCase
{
    protected $words;

    protected function setUp()
    {
        $this->words = ['Tact Coa' => true, 'mustafa' => false];
    }

    public function testIsPermutationOfPalindrome()
    {
        foreach ($this->words as $word => $result) {
            $this->assertEquals($result, Question::isPermutationOfPalindrome($word));
        }
    }

    public function testIsPermutationOfPalindrome2()
    {
        foreach ($this->words as $word => $result) {
            $this->assertEquals($result, Question::isPermutationOfPalindrome2($word));
        }
    }

    public function testIsPermutationOfPalindrome3()
    {
        foreach ($this->words as $word => $result) {
            $this->assertEquals($result, Question::isPermutationOfPalindrome3($word));
        }
    }
}