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

fun int2str(i0: int): string =
  let
    val digits =
      list_foldr(
        let
          fun digits_list(n, acc) =
            if n = 0 then
              if null acc then [#"0"] else acc
            else
              digits_list(n div 10, chr (ord #"0" + (n mod 10)) :: acc)
        in
          digits_list(i0, [])
        end,
        [],
        fn (digit, acc) => digit :: acc
      )
  in
    implode(digits)
  end

(*
I changed the combine function and the defined variable digitlist into a digits_list function 
*)
