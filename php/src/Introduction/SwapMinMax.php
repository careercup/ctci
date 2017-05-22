<?php

namespace Introduction;

class SwapMinMax
{
    /**
     * If the array does not have numeric, unique, incremental keys,
     * for loop above aren't going to work.
     *
     * @param $array int[]
     * @return mixed
     */
    public static function getMinIndexWithPointers(array $array)
    {
        reset($array);
        $minIndex = key($array);

        while (current($array)) {
            if (current($array) < $array[$minIndex]) {
                $minIndex = key($array);
            }
            next($array);
        }
        return $minIndex;
    }

    /**
     * If the array does not have numeric, unique, incremental keys,
     * for loop above aren't going to work.
     *
     * @param $array int[]
     * @return mixed
     */
    public static function getMaxIndexWithPointers(array $array)
    {
        reset($array);
        $maxIndex = key($array);

        while (current($array)) {
            if (current($array) > $array[$maxIndex]) {
                $maxIndex = key($array);
            }
            next($array);
        }
        return $maxIndex;
    }

    /**
     * Find indexes in one pass, and swap them.
     *
     * @param $array int[]
     */
    public static function swapMinMaxWithPointers(array &$array)
    {
        reset($array);
        $maxIndex = key($array);
        $minIndex = key($array);

        while (current($array)) {
            if (current($array) > $array[$maxIndex]) {
                $maxIndex = key($array);
            }
            if (current($array) < $array[$minIndex]) {
                $minIndex = key($array);
            }
            next($array);
        }

        $temp = $array[$maxIndex];
        $array[$maxIndex] = $array[$minIndex];
        $array[$minIndex] = $temp;
    }


    /**
     * Returns min integer key of the array
     * Can return only integer keys
     *
     * @param $array int[]
     * @return int
     */
    public static function getMinIndex(array $array): int
    {
        $minIndex = 0;
        for ($i = 1; $i < sizeof($array); $i++) {
            if ($array[$i] < $array[$minIndex]) {
                $minIndex = $i;
            }
        }
        return $minIndex;
    }

    /**
     * Returns max integer key of the array
     * Can return only integer keys
     *
     * @param $array int[]
     * @return int
     */
    public static function getMaxIndex(array $array): int
    {
        $maxIndex = 0;
        for ($i = 1; $i < sizeof($array); $i++) {
            if ($array[$i] > $array[$maxIndex]) {
                $maxIndex = $i;
            }
        }
        return $maxIndex;
    }

    /**
     * Swaps desired element with key.
     *
     * Note: The keys should not be integer only.
     * Think about a solution with mixed keys. Hence arrays are
     * hashMaps in PHP.
     *
     * @param $array int []
     * @param int $first
     * @param int $second
     */
    public static function swap(array &$array, int $first, int $second)
    {
        $temp = $array[$first];
        $array[$first] = $array[$second];
        $array[$second] = $temp;
    }

    /**
     * @param $array int []
     */
    public static function swapMinMaxBetter(array &$array)
    {
        $minIndex = self::getMinIndex($array);
        $maxIndex = self::getMaxIndex($array);
        self::swap($array, $minIndex, $maxIndex);
    }

    /**
     * @param $array int []
     */
    public static function swapMinMax(array &$array)
    {
        $minIndex = 0;
        for ($i = 1; $i < sizeof($array); $i++) {
            if ($array[$i] < $array[$minIndex]) {
                $minIndex = $i;
            }
        }

        $maxIndex = 0;
        for ($i = 1; $i < sizeof($array); $i++) {
            if ($array[$i] > $array[$maxIndex]) {
                $maxIndex = $i;
            }
        }

        $temp = $array[$minIndex];
        $array[$minIndex] = $array[$maxIndex];
        $array[$maxIndex] = $temp;
    }
}