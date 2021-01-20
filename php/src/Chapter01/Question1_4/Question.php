<?php

namespace Chapter01\Question1_4;

class Question
{
    public static function isPermutationOfPalindrome(string $string): bool
    {
        $charMap = self::buildCharFrequencyTable($string);
        return self::checkMaxOneOdd($charMap);
    }

    public static function checkMaxOneOdd(array $charMap): bool
    {
        $foundOdd = false;
        foreach ($charMap as $count) {
            if ($count % 2 == 1) {
                if ($foundOdd == true) {
                    return false;
                }
                $foundOdd = true;
            }
        }
        return true;
    }

    public static function buildCharFrequencyTable($string): array
    {

        $string = strtolower($string);
        $string = str_replace(' ', '', $string);

        $charMap = [];
        for ($i = 0; $i < strlen($string); $i++) {
            if (!isset($charMap[$string[$i]])) {
                $charMap[$string[$i]] = 1;
            } else {
                $charMap[$string[$i]]++;
            }
        }
        return $charMap;
    }

    public static function isPermutationOfPalindrome2(string $string): bool
    {
        $countOdd = 0;
        $charMap = [];
        for ($i = 0; $i < strlen($string); $i++) {
            $charNumber = self::getCharNumber($string[$i]);

            if ($charNumber != -1) {

                if (!isset($charMap[$charNumber])) {
                    $charMap[$charNumber] = 1;
                } else {
                    $charMap[$charNumber]++;
                }

                if ($charMap[$charNumber] % 2 == 1) {
                    $countOdd++;
                } else {
                    $countOdd--;
                }
            }
        }
        return $countOdd <= 1;
    }

    public static function getCharNumber(string $char)
    {
        $char = strtolower($char);

        if (strlen($char) != 1) {
            // throw new \InvalidArgumentException('Char chould be one letter.');
            return -1;
        }
        $ord = ord($char);
        if (($ord >= ord('a') && $ord <= ord('z')) ||
            ($ord >= ord('A') && $ord <= ord('Z'))
        ) {
            return $ord - ord('a');
        } else {
            return -1;
        }
    }

    public static function isPermutationOfPalindrome3(string $string): bool
    {
        $bitVector = self::createBitVector($string);
        // one odd letter or no odd letter
        return $bitVector == 0 || self::checkExactlyOneBitSet($bitVector);
    }

    public static function createBitVector(string $string): int
    {
        $bitVector = 0;
        for ($i = 0; $i < strlen($string); $i++) {
            $index = self::getCharNumber($string[$i]);
            $bitVector = self::toggle($bitVector, $index);
        }
        return $bitVector;
    }

    /**
     * Flips bit at index
     *
     * @param int $bitVector
     * @param int $index
     * @return int
     */
    public static function toggle(int $bitVector, int $index): int
    {
        if ($index < 0) {
            return $bitVector;
        }

        $mask = (1 << $index);

        if (($bitVector & $mask) == 0) {
            $bitVector |= $mask;
        } else {
            // ~00001000 = 11110111
            $bitVector &= ~$mask;
        }

        return $bitVector;
    }

    public static function checkExactlyOneBitSet(int $bitVector)
    {
        // 00001000 & 00000111 = 00000000
        return ($bitVector & ($bitVector - 1)) == 0;
    }
}