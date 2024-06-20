(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(* ****** ****** *)


fun stream_ziplst(xs: 'a stream list): 'a list stream=fn()=>
  let
    fun checker(xxs:'a stream list): bool=
        list_forall(xxs, fn (x) =>
       case x () of
        strcon_nil=> false
        |_ => true)
  in
    if (checker(xs)) then
    let
      val rest= list_map(xs,fn(x)=> 
          case x () of
           strcon_cons(x1, fxs) => fxs
          |  _=> raise Empty )
    in
       strcon_cons(list_foldright(xs,[],fn(x,r)=> stream_get_at(x,0)::r),stream_ziplst(rest))
    end

      else strcon_nil
  end



(* end of [CS320-2024-Sum1-assign04-08.sml] *)
