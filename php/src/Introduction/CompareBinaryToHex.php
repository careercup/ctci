<?php

namespace Introduction;

class CompareBinaryToHex
{
    public static function digitToValue(string $digit)
    {
        $asciiValue = ord($digit);
        if ($asciiValue >= ord("0") && $asciiValue <= ord("9")) {
            return intval($digit);
        } elseif ($asciiValue >= ord("A") && $asciiValue <= ord("F")) {
            return 10 + (ord($digit) - ord("A"));
        } elseif ($asciiValue >= ord("a") && $asciiValue <= ord("f")) {
            return 10 + (ord($digit) - ord("a"));
        }
        return -1;
    }

    /*
     * Converts the number to it's decimal value
     * Starts from leftmost digit.
     *
     * @param string $number
     * @param int $base
     * @return int
     */
    public static function convertToBase(string $number, int $base)
    {
        if ($base < 2 || ($base > 10 && $base != 16)) {
            return -1;
        }
        $value = 0;
        for ($i = strlen($number) - 1; $i >= 0; $i--) {
            $digit = self::digitToValue($number[$i]);

            if ($digit < 0 || $digit >= $base) {
                return -1;
            }

            $exp = strlen($number) - 1 - $i;
            $value += $digit * pow($base, $exp);
        }

        return $value;
    }

    /**
     * Compares string values of a binary and hex numbers.
     *
     * @param string $binary
     * @param string $hex
     * @return bool
     */
    public static function compareBinToHex(string $binary, string $hex)
    {
        $number1 = self::convertToBase($binary, 2);
        $number2 = self::convertToBase($hex, 16);

        if ($number1 < 0 || $number2 < 0) {
            return false;
        } else {
            return $number1 == $number2;
        }
    }
}