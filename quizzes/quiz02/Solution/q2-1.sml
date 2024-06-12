(*
Your solution for question 1.2
*)
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

val palindromeq = fn(input) =>
let
  val n = strlen(input)
in
  int1_forall
  (n div 2, fn(i) => strsub(input, i) = strsub(input, n-1-i))
end

val true = palindromeq("abba")
val true = palindromeq("abcba")
val false = palindromeq("abcbac")
