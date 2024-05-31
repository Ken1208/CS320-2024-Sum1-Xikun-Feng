(* ****** ****** *)

(*
These are the only library functions
that are allowed for completing Assign01
*)

(* ****** ****** *)

exception MyErrorExn
exception MyAssertExn

(* ****** ****** *)

exception MyNotImplementedExn

(* ****** ****** *)

fun
myassert(claim: bool): unit =
if claim then () else raise MyAssertExn

(* ****** ****** *)

(*
All the arithmetic operations
All the primitive comparison operations
*)

(*
Note that div is for integer division
Note that mod is for integer modulo operation
Note that both div and mod are infix operators

val q = 10 div 3 (* q = 3 *)
val r = 10 mod 3 (* r = 1 *)
*)

(* ****** ****** *)

val ord = Char.ord (* char to ascii *)
val chr = Char.chr (* ascii to char *)

(* ****** ****** *)

val str = String.str (* char to string *)

(* ****** ****** *)

val strlen =
String.size (* string length *)

val strcat = op^ (* string concatenation *)
val strsub = String.sub (* string subcripting *)

(* ****** ****** *)

structure Int = struct end
structure List = struct end
structure String = struct end

(* ****** ****** *)

exception DisallowedFunctionExn

fun explode _ = raise DisallowedFunctionExn
fun implode _ = raise DisallowedFunctionExn

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-lib.sml] *)
