(*
Your solution for question 1.2
*)
(* ************************************************ *)

use "./../../../lectures/lec-06-03/mylib-06-03.sml";

(* ************************************************ *)

(*

Q1.2

fun
int2str(i0: int): string

Please give a non-recursive combinator-based
implementation of int2str, which int2str is described
in Assign01. No error-handling is needed.

You can use the following functions in the SML library:

fun implode(char list): string

*)

val int2str = fn(int) =>
implode
(#2
(int1_foldl
( int, (int, [])
, fn((int, ds), _) =>
  if int = 0
  then (int, ds)
  else (int div 10, chr(ord(#"0")+int mod 10) :: ds))))

(*
This one is more efficient
(*
val int2str =
 fn(int) =>
    let
	exception Result of char list
    in
	(
	int1_foldl
        ( int
	, (int, [])
	, fn((int, ds), _) =>
          if int = 0
	  then raise Result(ds)
	  else (int div 10, chr(ord(#"0")+int mod 10) :: ds)
        ) ; "") handle Result(ds) => implode(ds)
    end
*)
*)
