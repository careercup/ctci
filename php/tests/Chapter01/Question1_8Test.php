<?php

use Chapter01\Question1_8\Question;

class Question1_8Test extends \PHPUnit_Framework_TestCase
{
    protected $matrix;
    protected $matrixZeros;

    protected function setUp()
    {
        $this->matrix = [
            [1, 2, 0, 4],
            [5, 6, 7, 8],
            [0, 10, 11, 12],
            [13, 14, 15, 16]
        ];

        $this->matrixZeros = [
            [0, 0, 0, 0],
            [0, 6, 0, 8],
            [0, 0, 0, 0],
            [0, 14, 0, 16]
        ];

    }
    public function testSetZeros()
    {
        $this->assertEquals($this->matrixZeros, Question::setZeros($this->matrix));
    }
}