(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)


fun isPrime(n0: int): bool =
    let
        fun helperFun(d, n) =
            if d * d > n then true
            else if n mod d = 0 then false
            else helperFun(d + 1, n)
    in
        if n0 < 2 then false
        else helperFun(2, n0)
    end;


(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-02.sml] *)
