<?php

namespace Chapter01\Question1_6;

class Question
{
    public static function countCompression(string $string): int
    {
        $compressedLength = 0;
        $countConsecutive = 0;

        for ($i = 0; $i < strlen($string); $i++) {
            $countConsecutive++;

            // if next char is the last char or next char is different
            if ($i + 1 >= strlen($string) || $string[$i] != $string[$i + 1]) {
                $count = strlen((string)$countConsecutive);
                $compressedLength += 1 + $count;
                $countConsecutive = 0;
            }
        }

        return $compressedLength;
    }

    public static function compress(string $string): string
    {
        $finalLength = self::countCompression($string);
        if ($finalLength >= strlen($string)) {
            return $string;
        }
        $compressedString = "";
        $countConsecutive = 0;

        for ($i = 0; $i < strlen($string); $i++) {
            $countConsecutive++;

            // if next char is the last char or next char is different
            if ($i + 1 >= strlen($string) || $string[$i] != $string[$i + 1]) {
                $compressedString .= $string[$i];
                $compressedString .= $countConsecutive;
                $countConsecutive = 0;
            }
        }
        
        return $compressedString;
    }
}