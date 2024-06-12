(*
Your solution for question 1.1
*)
(* ************************************************ *)
use "./../../../lectures/lec-06-03/mylib-06-03.sml";
(* ************************************************ *)

(*

Q1.1

fun
str2int(rep: string): int

Please give a non-recursive combinator-based
implementation of str2int, which str2int is described
in Assign01. No error-handling is needed.

*)

val
str2int =
fn(rep) =>
string_foldl(rep, 0, fn(i, c) => 10*i + (ord(c)-ord(#"0")))

val myint1 = str2int("12345")
val myint2 = str2int("98765")

(* ****** ****** *)

(* end of [quizzes/quiz02/q1-1.sml] *)
