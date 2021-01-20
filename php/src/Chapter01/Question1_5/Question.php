<?php

namespace Chapter01\Question1_5;

class Question
{
    public static function oneEditAway(string $first, string $second): bool
    {
        if (strlen($first) == strlen($second)) {
            return self::oneEditReplace($first, $second);
        } elseif (strlen($first) + 1 == strlen($second)) {
            return self::oneEditInsert($first, $second);
        } elseif (strlen($first) - 1 == strlen($second)) {
            return self::oneEditInsert($second, $first);
        }

        return false;
    }

    public static function oneEditReplace(string $first, string $second)
    {
        $foundDifference = false;
        for ($i = 0; $i < strlen($first); $i++) {
            if ($first[$i] != $second[$i]) {
                if ($foundDifference) {
                    return false;
                }
                $foundDifference = true;
            }
        }
        return true;
    }

    public static function oneEditInsert(string $first, string $second)
    {
        $index1 = 0;
        $index2 = 0;

        while ($index1 < strlen($first) && $index2 < strlen($second)) {
            if ($first[$index1] != $second[$index2]) {
                if ($index1 != $index2) {
                    return false;
                }
                $index2++;
            } else {
                $index1++;
                $index2++;
            }
        }
        return true;
    }

    public static function oneEditAway2(string $first, string $second): bool
    {
        if (abs(strlen($first) - strlen($second)) > 1) {
            return false;
        }
        $shorter = strlen($first) >= strlen($second) ? $second : $first;
        $longer = strlen($first) >= strlen($second) ? $first : $second;

        $index1 = 0;
        $index2 = 0;

        $foundDifference = false;

        while ($index2 < strlen($longer) && $index1 < strlen($shorter)) {
            if ($longer[$index2] != $shorter[$index1]) {
                if ($foundDifference) {
                    return false;
                }
                $foundDifference = true;
                if (strlen($shorter) == strlen($longer)) {
                    $index1++; // on replace move shorter pointer
                }
            } else {
                $index1++; // if matching move shorter pointer
            }
            $index2++; // Always move pointer for longer string;
        }
        return true;
    }
}