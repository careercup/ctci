<?php

namespace Chapter01\Question1_9;

class Question
{
    public static function isRotation(string $string1, string $string2): bool
    {
        $length = strlen($string1);
        // Check that string1 and string2 are equal length and not empty
        if ($length == strlen($string2) && $length > 0) {
            $string3 = $string2 . $string2;
            return self::isSubstring($string3, $string1);
        }
        return false;
    }

    public static function isSubstring(string $bigger, string $smaller): bool
    {
        return strpos($bigger, $smaller) !== false;
    }
}