<?php

use Chapter01\Question1_7\Question;

class Question1_7Test extends \PHPUnit_Framework_TestCase
{
    protected $matrix1;
    protected $matrix1rotated;
    protected $matrix2;
    protected $matrix2rotated;

    protected function setUp()
    {
        $this->matrix1 = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
        ];

        $this->matrix1rotated = [
            [13, 9, 5, 1],
            [14, 10, 6, 2],
            [15, 11, 7, 3],
            [16, 12, 8, 4]
        ];

        $this->matrix2 = [
            [1, 2, 3],
            [5, 6, 7],
            [9, 10, 11]
        ];

        $this->matrix2rotated = [
            [9, 5, 1],
            [10, 6, 2],
            [11, 7, 3]
        ];
    }

    public function testRotate()
    {
        $this->assertEquals($this->matrix1rotated, Question::rotate($this->matrix1));
        $this->assertEquals($this->matrix2rotated, Question::rotate($this->matrix2));
    }
}