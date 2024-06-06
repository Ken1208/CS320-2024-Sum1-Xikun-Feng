(*
Your solution for question 2.2
*)

(* ************************************************ *)
use "./../../../lectures/lec-06-03/mylib-06-03.sml";
(* ************************************************ *)

(*

Q2.2

The function string_span returns true
if and only if every letter in [input]
occurs in [accept]:

fun
string_span
(input: string, accept: string): bool

A string is a pangram if it contains every letter
in the English alphabet. For instance, the following
function [pangramq] tests whether a given input string
is a pangram:

fun
pangramq
(input: string): bool =
string_span("abcdefghijklmnopqrstuvwxyz", input)

The following sentence is probably the most famous
pangram: "the quick brown fox jumps over the lazy dog"

Please give a non-recursive combinator-based
implementation of string_span.

*)

fun string_span(input: string, accept: string): bool =
  string_forall(input, fn c => string_exists(accept, fn a => c = a))
