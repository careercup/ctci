<?php

namespace Chapter01\Question1_7;

class Question
{
    public static function rotate(array &$matrix)
    {
        if (sizeof($matrix) == 0 || sizeof($matrix) != sizeof($matrix[0])) {
            return false;
        }

        $number = sizeof($matrix);


        for ($layer = 0; $layer < $number / 2; $layer++) {
            $first = $layer;
            $last = $number - 1 - $layer;

            for ($i = $first; $i < $last; $i++) {
                $offset = $i - $first; // always starts from 0
                $top = $matrix[$first][$i];

                // left -> top
                $matrix[$first][$i] = $matrix[$last - $offset][$first];

                // bottom -> left
                $matrix[$last - $offset][$first] = $matrix[$last][$last - $offset];

                // right -> bottom
                $matrix[$last][$last - $offset] = $matrix[$i][$last];

                // top -> right
                $matrix[$i][$last] = $top;
            }
        }
        return $matrix;
    }
}