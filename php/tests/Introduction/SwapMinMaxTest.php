<?php

use Introduction\SwapMinMax;

class SwapMinMaxHexTest extends \PHPUnit_Framework_TestCase
{
    public $array = [10, -10, 10];

    public function testGetMinIndexWithPointers()
    {
        $value = SwapMinMax::getMinIndexWithPointers($this->array);
        $this->assertEquals(1, $value);
    }

    public function testGetMaxIndexWithPointers()
    {
        $value = SwapMinMax::getMaxIndexWithPointers($this->array);
        $this->assertEquals(0, $value);
    }

    public function testSwapMinMaxWithPointers()
    {
        SwapMinMax::swapMinMaxWithPointers($this->array);
        $this->assertEquals([-10, 10, 10], $this->array);
    }

    public function testGetMinIndex()
    {
        $value = SwapMinMax::getMinIndex($this->array);
        $this->assertEquals(1, $value);
    }

    public function testGetMaxIndex()
    {
        $value = SwapMinMax::getMaxIndex($this->array);
        $this->assertEquals(0, $value);
    }

    public function testSwap()
    {
        SwapMinMax::swap($this->array, 1, 2);
        $this->assertEquals([10, 10, -10], $this->array);
    }

    public function testSwapMinMaxBetter()
    {
        SwapMinMax::swapMinMaxBetter($this->array);
        $this->assertEquals([-10, 10, 10], $this->array);
    }

    public function testSwapMinMax()
    {
        SwapMinMax::swapMinMax($this->array);
        $this->assertEquals([-10, 10, 10], $this->array);
    }
}
