<?php

namespace Chapter01\Question1_2;


class Question
{

    /**
     * Sort strings,compare them.
     *
     * @param string $string1
     * @param string $string2
     * @return bool
     */
    public static function isPermutation(string $string1, string $string2): bool
    {
        $charArray1 = str_split($string1);
        $charArray2 = str_split($string2);

        sort($charArray1);
        sort($charArray2);

        if (sizeof($charArray1) != sizeof($charArray2)) {
            return false;
        }

        $sortedString1 = implode('', $charArray1);
        $sortedString2 = implode('', $charArray2);

        if ($sortedString1 == $sortedString2) {
            return true;
        }

        return false;
    }


    /**
     * Check if two strings has identical character counts
     *
     * @param string $string1
     * @param string $string2
     * @return bool
     */
    public static function isPermutation2(string $string1, string $string2): bool
    {
        $letters = [];

        if (strlen($string1) != strlen($string2)) {
            return false;
        }

        for ($i = 0; $i < strlen($string1); $i++) {
            if (!isset($letters[$string1[$i]])) {
                $letters[$string1[$i]] = 1;
            } else {
                $letters[$string1[$i]]++;
            }
        }

        for ($j = 0; $j < strlen($string2); $j++) {
            if (!isset($letters[$string2[$j]])) {
                return false;
            } else {
                $letters[$string2[$j]]--;
                if ($letters[$string2[$j]] < 0) {
                    return false;
                }
            }
        }

        return true;
    }
}