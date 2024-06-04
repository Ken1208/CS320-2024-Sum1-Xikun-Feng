(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'xlist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)

(* ****** ****** *)

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
    let
        fun helper(xs: 'a xlist): 'a xlist =
            case xs of
                xlist_nil => xlist_nil
            |   xlist_cons(x1, xs) => xlist_snoc(helper(xs), x1)
            |   xlist_snoc(xs, x1) => xlist_cons(x1, helper(xs))
            |   xlist_append(xs, ys) => xlist_append(helper(ys), helper(xs))
            |   xlist_reverse(xs) => xlist_remove_reverse(xs)
    in
        case xs of
            xlist_nil => xlist_nil
        |   xlist_cons(x1, xs) => xlist_cons(x1, xlist_remove_reverse(xs))
        |   xlist_snoc(xs, x1) => xlist_snoc(xlist_remove_reverse(xs), x1)
        |   xlist_append(xs, ys) => xlist_append(xlist_remove_reverse(xs), xlist_remove_reverse(ys))
        |   xlist_reverse(xs) => helper(xs)
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-03.sml] *)
