; Clojure solution to question 1.4 from Cracking the Coding Interview, 5th Edition.
; Nitin Punjabi
; github.com/nitinpunjabi
; nitin@patternhatch.com
(ns chapter01.01-04
  (:require [clojure.test :as t]))

; method using line strip and reduce
(defn replace-with-char
  "Solution using trim and reduce. Assumes heading and trailing whitespaces should be removed."
  [s target replacement]
  (->> (clojure.string/trim s)
       (reduce #(if (= target %2) (conj % replacement) (conj % %2)) [])
       (clojure.string/join)))

(defn test-helper
  [s]
  (replace-with-char s \space "%20"))

(t/deftest replace-with-char-test
  (t/is (= (test-helper "") ""))
  (t/is (= (test-helper "a") "a"))
  (t/is (= (test-helper " a") "a"))
  (t/is (= (test-helper "a ") "a"))
  (t/is (= (test-helper " a ") "a"))
  (t/is (= (test-helper " a b ") "a%20b"))
  (t/is (= (test-helper " a  b ") "a%20%20b"))
  (t/is (= (test-helper "Mr John Smith    ") "Mr%20John%20Smith")))

