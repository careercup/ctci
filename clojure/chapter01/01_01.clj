; Clojure solution to question 1.1 from Cracking the Coding Interview, 5th Edition.
; Nitin Punjabi
; github.com/nitinpunjabi
; nitin@patternhatch.com
(ns chapter01.01-01
  (:require [clojure.test :as t]))

(defn unique-by-set-count?
  "Solution using a set."
  [s]
  (let [coll (into #{} s)]
    (= (count coll) (count s))))

(defn unique-by-partition?
  "Solution using partitioning."
  [s]
  (let [parts (partition-by identity (sort s))]
    (not (some #(> (count %) 1) parts))))

(t/deftest unique-by-set-count
  (t/is (= (unique-by-set-count? "") true))
  (t/is (= (unique-by-set-count? "a") true))
  (t/is (= (unique-by-set-count? "ab") true))
  (t/is (= (unique-by-set-count? "aab") false))
  (t/is (= (unique-by-set-count? "aba") false)))

(t/deftest unique-by-partition
  (t/is (= (unique-by-partition? "") true))
  (t/is (= (unique-by-partition? "a") true))
  (t/is (= (unique-by-partition? "ab") true))
  (t/is (= (unique-by-partition? "aab") false))
  (t/is (= (unique-by-partition? "aba") false)))
