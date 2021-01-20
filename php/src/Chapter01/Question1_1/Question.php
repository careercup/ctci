<?php

namespace Chapter01\Question1_1;


class Question
{
    public static function isUniqueChars(string $string): bool
    {
        $chars = [];
        for ($i = 0; $i < strlen($string); $i++) {
            if (!isset($chars[$string[$i]])) {
                $chars[$string[$i]] = true;
            } else {
                return false;
            }
        }
        return true;
    }

    public static function isUniqueChars2(string $string): bool
    {
        $checker = 0;
        for ($i = 0; $i < strlen($string); $i++) {
            $value = ord($string[$i]) - ord('a');
            if (($checker & (1 << $value)) > 0) {
                return false;
            }
            $checker |= (1 << $value);
        }
        return true;
    }
}