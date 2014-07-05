; Clojure solution to question 1.2 from Cracking the Coding Interview, 5th Edition.
; Nitin Punjabi
; github.com/nitinpunjabi
; nitin@patternhatch.com
(ns chapter01.01-02
  (:require [clojure.test :as t]))

(defn core-reverse-str
  "Reverse using Clojure's core function."
  [s]
  (apply str (reverse s)))

(defn lib-reverse-str
  "Reverse using clojure.string's reverse function which uses StringBuilder's reverse function internally."
  [s]
  (clojure.string/reverse s))

(t/deftest core-reverse-test
  (t/is (= (core-reverse-str "") ""))
  (t/is (= (core-reverse-str "a") "a"))
  (t/is (= (core-reverse-str "ab") "ba"))
  (t/is (= (core-reverse-str "ab ") " ba")))

(t/deftest lib-reverse-test
  (t/is (= (lib-reverse-str "") ""))
  (t/is (= (lib-reverse-str "a") "a"))
  (t/is (= (lib-reverse-str "ab") "ba"))
  (t/is (= (lib-reverse-str "ab ") " ba")))