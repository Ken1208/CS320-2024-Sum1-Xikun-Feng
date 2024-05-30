(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)


fun int2str(x: int): string =
  let
    fun int2strHelper(n: int, acc: string): string =
      if n = 0 then
        if acc = "" then "0" else acc
      else
        let
          val digit = n mod 10
          val char = chr (ord #"0" + digit)
        in
          int2strHelper(n div 10, str char ^ acc)
        end
  in
    int2strHelper(x, "")
  end



(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-03.sml] *)
