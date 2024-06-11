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

fun str2int(rep: string): int =
    string_foldl(rep, 0, fn (acc, c) => acc * 10 + (ord(c) - ord(#"0")))


(*
I changed list_foldl into string_foldl;
Also 'char.ord(c)-char.ord#' into (ord(c) - ord(#"0")).
*)
