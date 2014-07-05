; Clojure solution to question 1.3 from Cracking the Coding Interview, 5th Edition.
; Nitin Punjabi
; github.com/nitinpunjabi
; nitin@patternhatch.com
(ns chapter01.01-03
  (:require [clojure.test :as t]))

(defn is-permutation?
  "Checks whether two strings are permutations of each other using the passed in function."
  [check-fn s1 s2]
  (if (not= (count s1) (count s2))
    false
    (check-fn s1 s2)))

(defn sort-check [s1 s2]
  "Sorts two strings and checks whether they're equal. Assumes spaces count."
  (= (sort s1) (sort s2)))

(defn freq-check [s1 s2]
  "Checks for whether s1 is a permutation of s2 using character frequencies. Assumes spaces count."
  (let [freqs (reduce #(assoc % %2 (inc (% %2 0))) {} s1)]
    (loop [s s2 freq-count freqs]
      (if (seq s)
        (if (> 0 (dec (freq-count (first s) 0)))
          false
          (recur (next s) (assoc freq-count (first s) (dec (freq-count (first s))))))
        true))))

(t/deftest sort-check-test
  (t/is (= (is-permutation? sort-check "" "") true))
  (t/is (= (is-permutation? sort-check "a" "a") true))
  (t/is (= (is-permutation? sort-check "ab" "ab") true))
  (t/is (= (is-permutation? sort-check "ab" "ba") true))
  (t/is (= (is-permutation? sort-check "ab" "b") false))
  (t/is (= (is-permutation? sort-check "ab" "bc") false)))

(t/deftest freq-check-test
  (t/is (= (is-permutation? freq-check "" "") true))
  (t/is (= (is-permutation? freq-check "a" "a") true))
  (t/is (= (is-permutation? freq-check "ab" "ab") true))
  (t/is (= (is-permutation? freq-check "ab" "ba") true))
  (t/is (= (is-permutation? freq-check "ab" "b") false))
  (t/is (= (is-permutation? freq-check "ab" "bc") false)))

