<?php

use Chapter01\Question1_6\Question;

class Question1_6Test extends \PHPUnit_Framework_TestCase
{
    protected $words;

    protected function setUp()
    {
        $this->words = [
            'aabcccccaaa' => 'a2b1c5a3'
        ];
    }

    public function testIsPermutation()
    {
        foreach ($this->words as $uncompressed => $compressed) {
            $this->assertEquals($compressed, Question::compress($uncompressed));
        }
    }
}