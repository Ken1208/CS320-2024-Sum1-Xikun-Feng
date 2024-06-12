(* ************************************************ *)

use "./../../../lectures/lec-06-03/mylib-06-03.sml";

(* ************************************************ *)

(*

Q2.1
A string is a palindrome if the string equals
its reverse. The following function test whether
a given input string is a palindrome:

fun
palindromeq(input: string): bool

Please give a non-recursive combinator-based
implementation of palindromeq. No string equality
is allowed.

*)

val
palindromeq = fn(input) =>
let
val len = String.size(input) in
int1_forall(len div 2, fn i => (String.sub(input, i) = String.sub(input, len-1-i)))
end (* let *)

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

(* ************************************************ *)

val
string_span(input, accept) =
string_forall
(input, fn c => string_exists(accept, fn a => a = c))

(* ************************************************ *)
