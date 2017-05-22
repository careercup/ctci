<?php

use Introduction\CompareBinaryToHex;

class CompareBinaryToHexTest extends \PHPUnit_Framework_TestCase
{
    public function testDigitToValue()
    {
        $value = CompareBinaryToHex::digitToValue("C");
        $this->assertEquals(12, $value);
    }

    public function testConvertToBase()
    {
        $converted = CompareBinaryToHex::convertToBase("100000", 2);
        $this->assertEquals(32, $converted);
    }

    public function testCompareBinToHex()
    {
        $compared = CompareBinaryToHex::compareBinToHex("111001011", "1CB");
        $this->assertTrue($compared);
    }
}
