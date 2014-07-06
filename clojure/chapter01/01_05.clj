; Clojure solution to question 1.5 from Cracking the Coding Interview, 5th Edition.
; Nitin Punjabi
; github.com/nitinpunjabi
; nitin@patternhatch.com
(ns chapter01.01-05
  (:require [clojure.test :as t]))

(defn compress [s]
  (let [parts (partition-by identity s)
        compressed-str (clojure.string/join (reduce #(conj % (first %2) (count %2)) [] parts))]
    (if (<= (count s) (count compressed-str))
      s
      compressed-str)))

(t/deftest compression-results
  (t/is (= (compress "aabcccccaaa") "a2b1c5a3"))
  (t/is (= (compress "aabc    aaa") "a2b1c1 4a3"))
  (t/is (= (compress "abc") "abc"))
  (t/is (= (compress "a") "a"))
  (t/is (= (compress "") "")))