(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)
(*
HX-2024-06-12: 20 points
*)

fun
string_foreach
(xs: string, work: char -> unit): unit =
int1_foreach
(string_size(xs), fn(i) => work(strsub(xs, i)))

fun
list_tabulate
(len: int, fopr: int -> 'a): 'a list =
list_reverse
(int1_foldleft(len, [], fn(res, i) => fopr(i) :: res))


(* ****** ****** *)
(*
Note that you are not allowed to define
recursive functions for solving this one.
*)
(* ****** ****** *)
(*
Here are some functions that you can use in
your solution to this one.
*)
val
string_filter = foreach_to_filter_list(string_foreach)
val
string_tabulate =
fn(len, fopr) => implode(list_tabulate(len, fopr))

(* ****** ****** *)

(*
A word here is defined to be a (possibly empty)
sequence of lowcase letters in the English alphabet.
Two words w1 and w2 are neighbors if they are of the
same length and differ by exactly one letter.
//
For instance, [water] and [later] are neighbors.
For instance, [abcde] and [abxde] are neighbors.
For instance, [abcde] and [abcde] are not neighbors.
//
Given a word, the function [word_neighbors] returns
a list consisting of *all* the neighbors of the word.
//
fun word_neighbors(word: string): string list = ...
//
Please give an implementation of word_neighbors.
Note that you are NOT allowed to define recursive functions
in your implementation.
//
*)

(* ****** ****** *)

val AB =
"abcdefghijklmnopqrstuvwxyz"

(* ****** ****** *)

val
string_iforeach =
foreach_to_iforeach(string_foreach)
val
string_imap_list =
fn(cs, ifopr) =>
foreach_to_map_list(string_iforeach)(cs, ifopr)

(* ****** ****** *)

(*
val
word_neighbors = fn(word: string) => ...
*)

(* ****** ****** *)

val word_neighbors = fn(word: string) =>
  let
    val size = string_length word
    val neighbors = int1_foldleft(size, [], fn (r0, x0) =>
      list_foldright(int1_foldleft(26, [], fn (r, x1) =>
        string_imap_list(word, fn (i, x) =>
          if i = x0 then chr(ord(#"a") + x1) else x
        )::r
      ), [], fn (x, r) => implode(x)::r)::r0
    )
  in
    list_foldleft(list_foldleft(neighbors, [], fn (r0, x0) => x0 @ r0), [], fn (r, x) => if x = word then r else x::r)
  end

(* end of [CS320-2024-Sum1-assign03-02.sml] *)
