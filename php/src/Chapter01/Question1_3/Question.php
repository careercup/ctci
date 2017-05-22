<?php

namespace Chapter01\Question1_3;

class Question
{
    public static function replaceSpaces(string $string): string
    {
        $result = "";
        for ($i = 0; $i < strlen($string); $i++) {
            if ($string[$i] == " ") {
                $result .= "%20";
            } else {
                $result .= $string[$i];
            }
        }
        return $result;
    }
}