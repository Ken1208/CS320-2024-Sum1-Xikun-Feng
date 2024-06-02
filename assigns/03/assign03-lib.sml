(* ****** ****** *)
(*
Assign03:
Higher-Order!
*)
(* ****** ****** *)
val list_nth = List.nth
(* ****** ****** *)
val list_append = op@
val list_reverse = List.rev
(* ****** ****** *)
val list_size = List.length
val list_length = List.length
(* ****** ****** *)

exception NotImplemented320
exception DisallowedFunction320
		       
(* ****** ****** *)

val chr = Char.chr
val ord = Char.ord

(* ****** ****** *)

val implode = String.implode
val explode = String.explode

(* ****** ****** *)
(* ****** ****** *)

fun
foreach_to_forall
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * ('x0 -> bool)) -> bool =
fn(xs: 'xs, test: 'x0 -> bool) =>
let
  exception False
in(*let*)
(* ****** ****** *)
let
val () =
foreach
(
xs
,
fn(x0: 'x0) =>
if
test(x0) then () else raise False)
in
  ( true )
end handle False(*void*) => (false)
(* ****** ****** *)
end (* end of [foreach_to_forall]: let *)

(* ****** ****** *)
(* ****** ****** *)

fun
foreach_to_foldleft
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * 'r0 * ('r0*'x0 -> 'r0)) -> 'r0 =
fn(xs, r0, fopr) =>
let
val res = ref(r0)
in
foreach
( xs
, fn(x0) => res := fopr(!res, x0)); !res
end (* end of [foreach_to_foldleft]: let *)

(* ****** ****** *)
(* ****** ****** *)

fun
foreach_to_map_list
(
foreach:
('xs * ('x0->unit))->unit)
:
('xs * ('x0 -> 'y0)) -> 'y0 list
=
(
fn(xs, fopr) =>
list_reverse
(
foreach_to_foldleft
(foreach)(xs, nil, fn(r0, x0) => fopr(x0) :: r0)))

(* ****** ****** *)
(* ****** ****** *)

fun
int1_foreach
(n0: int, work: int -> unit) =
let
fun
loop(i0: int): unit =
if i0 >= n0
then ()
else (work(i0); loop(i0+1)) in loop(0(*i0*))
end (* end of [int1_foreach(n0, work)]: let *)

(* ****** ****** *)

fun
list_foreach
(xs: 'a list, work: 'a -> unit): unit =
(
case xs of
  nil => ()
| (x1::xs) => (work(x1); list_foreach(xs, work))
)

(* ****** ****** *)
(* ****** ****** *)

fun
int1_forall
(xs, test) =
foreach_to_forall(int1_foreach)(xs, test)

fun
list_forall
(xs, test) =
foreach_to_forall(list_foreach)(xs, test)

(* ****** ****** *)
(* ****** ****** *)

fun
int1_foldleft
(xs, r0, fopr) =
foreach_to_foldleft(int1_foreach)(xs, r0, fopr)

fun
list_foldleft
(xs, r0, fopr) =
foreach_to_foldleft(list_foreach)(xs, r0, fopr)

(* ****** ****** *)
(* ****** ****** *)

fun
int1_map_list
 ( n0, fopr ) =
(
  foreach_to_map_list(int1_foreach)(n0, fopr))

fun
list_map_list
 ( n0, fopr ) =
(
  foreach_to_map_list(list_foreach)(n0, fopr))

val list_map = list_map_list

(* ****** ****** *)
(* ****** ****** *)

val
int1_foldright =
fn(xs,r0,fopr) =>
int1_foldleft
(xs, r0, fn(r0, x0) => fopr(xs-1-x0, r0))

(* ****** ****** *)

val
list_foldright =
fn(xs, r0, fopr) =>
list_foldleft
(list_reverse(xs), r0, fn(r, x) => fopr(x, r))

(* ****** ****** *)
(* ****** ****** *)

fun
foreach_to_map_list
(
foreach:
('xs * ('x0->unit))->unit)
:
('xs * ('x0 -> 'y0)) -> 'y0 list
=
(
fn(xs, fopr) =>
list_reverse
(
foreach_to_foldleft
(foreach)(xs, nil, fn(r0, x0) => fopr(x0) :: r0)))

(* ****** ****** *)
(* ****** ****** *)

fun
int1_foreach
(n0: int, work: int -> unit) =
let
fun
loop(i0: int): unit =
if i0 >= n0
then ()
else (work(i0); loop(i0+1)) in loop(0(*i0*))
end (* end of [int1_foreach(n0, work)]: let *)

(* ****** ****** *)

fun
list_foreach
(xs: 'a list, work: 'a -> unit): unit =
(
case xs of
  nil => ()
| (x1::xs) => (work(x1); list_foreach(xs, work))
)

(* ****** ****** *)
(* ****** ****** *)

fun
int1_forall
(xs, test) =
foreach_to_forall(int1_foreach)(xs, test)

fun
list_forall
(xs, test) =
foreach_to_forall(list_foreach)(xs, test)

(* ****** ****** *)
(* ****** ****** *)

fun
int1_foldleft
(xs, r0, fopr) =
foreach_to_foldleft(int1_foreach)(xs, r0, fopr)

fun
list_foldleft
(xs, r0, fopr) =
foreach_to_foldleft(list_foreach)(xs, r0, fopr)

(* ****** ****** *)
(* ****** ****** *)

fun
int1_map_list
 ( n0, fopr ) =
(
  foreach_to_map_list(int1_foreach)(n0, fopr))

fun
list_map_list
 ( n0, fopr ) =
(
  foreach_to_map_list(list_foreach)(n0, fopr))

val list_map = list_map_list

(* ****** ****** *)
(* ****** ****** *)

val
int1_foldright =
fn(xs,r0,fopr) =>
int1_foldleft
(xs, r0, fn(r0, x0) => fopr(xs-1-x0, r0))

(* ****** ****** *)

val
list_foldright =
fn(xs, r0, fopr) =>
list_foldleft
(list_reverse(xs), r0, fn(r, x) => fopr(x, r))

(* ****** ****** *)
(* ****** ****** *)

(*
val
list_append =
fn(xs, ys) =>
(
list_foldright(xs, ys, fn(x1, ys) => x1 :: ys))
*)

(* ****** ****** *)
(* ****** ****** *)

structure Int = struct end
structure List = struct end
structure Char = struct end
structure String = struct end
structure TextIO = struct end

(* ****** ****** *)
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-lib.sml] *)
