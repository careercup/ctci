<?php

namespace Chapter01\Question1_8;

class Question
{
    public static function setZeros(array $matrix)
    {
        $rows = [];
        $columns = [];

        for ($i = 0; $i < sizeof($matrix); $i++) {
            for ($j = 0; $j < sizeof($matrix[0]); $j++) {
                if ($matrix[$i][$j] == 0) {
                    $rows[$i] = true;
                    $columns[$j] = true;
                }
            }
        }

        foreach ($rows as $key => $value) {
            self::nullifyRow($matrix, $key);
        }

        foreach ($columns as $key => $value) {
            self::nullifyColumn($matrix, $key);
        }

        return $matrix;
    }

    public static function nullifyRow(array &$matrix, int $row)
    {
        for ($i = 0; $i < sizeof($matrix[0]); $i++) {
            $matrix[$row][$i] = 0;
        }
    }

    public static function nullifyColumn(array &$matrix, $column)
    {
        for ($i = 0; $i < sizeof($matrix); $i++) {
            $matrix[$i][$column] = 0;
        }
    }


}