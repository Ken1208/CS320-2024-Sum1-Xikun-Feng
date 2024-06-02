(* ****** ****** *)
use
"./../../MySolution/SML/assign04-02.sml";
(* ****** ****** *)

local

exception ERROR_assign04_02

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val wds1 = word_neighbors("a")
val ( ) =
if length(wds1) = 25
then () else raise ERROR_assign04_02

(* ****** ****** *)

val wds2 = word_neighbors("aa")
val ( ) =
if length(wds2) = 25 + 25
then () else raise ERROR_assign04_02

(* ****** ****** *)

val wds3 = word_neighbors("xyz")
val ( ) =
if length(wds3) = 25 + 25 + 25
then () else raise ERROR_assign04_02

(* ****** ****** *)

val () =
print("Assign04-02-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign04-02-test.sml] *)

