(* ****** ****** *)
(*
Assign04:
Lazily Efficient!
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
val strsub = String.sub
val string_size = String.size
val string_length = String.size
(* ****** ****** *)

val chr = Char.chr
val ord = Char.ord

(* ****** ****** *)

val implode = String.implode
val explode = String.explode

(* ****** ****** *)
(* ****** ****** *)

val int2real = Real.fromInt
val int2string = Int.toString

(* ****** ****** *)
(* ****** ****** *)

datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)

type 'a stream = (unit -> 'a strcon)

(* ****** ****** *)
(* ****** ****** *)

exception NotImplemented320
exception DisallowedFunction320
		       
(* ****** ****** *)
(* ****** ****** *)

type
('xs, 'x0) forall =
'xs * ('x0 -> bool) -> bool
type
('xs, 'x0) foreach =
'xs * ('x0 -> unit) -> unit
type
('xs, 'x0) iforall =
'xs * (int * 'x0 -> bool) -> bool
type
('xs, 'x0) iforeach =
'xs * (int * 'x0 -> unit) -> unit

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
foldleft_to_length
( foldleft
: ('xs * int * (int*'x0 -> int)) -> int)
: ('xs -> int) =
fn(xs: 'xs) => foldleft(xs, 0, fn(r0,x0) => r0+1)

(* ****** ****** *)

fun
foreach_to_length(foreach) =
foldleft_to_length(foreach_to_foldleft(foreach))

(* ****** ****** *)
(* ****** ****** *)

fun
foreach_to_get_at
(
foreach:
('xs*('x0->unit))->unit): 'xs*int -> 'x0 =
fn(xs, i0) =>
let
exception Found of ('x0)
val foldleft = foreach_to_foldleft(foreach)
in (*let*)
(* ****** ****** *)
let
val r0 =
foldleft
( xs, 0
, fn(r0, x0) =>
  if i0 = r0 then
  raise Found(x0) else r0+1) in raise Subscript
end handle Found(x0) => x0
(* ****** ****** *)
end (* end-of-[foreach_to_get_at]: let *) 

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
foreach_to_filter_list
(
foreach:
('xs * ('x0->unit))->unit)
:
('xs * ('x0 -> bool)) -> 'x0 list
=
(
fn(xs, test) =>
list_reverse
(
foreach_to_foldleft(foreach)
( xs, nil
, fn(r0, x0) => if test(x0) then x0 :: r0 else r0)))

(* ****** ****** *)
(* ****** ****** *)

(*
fun
foreach_to_iforeach
( foreach
: ('xs, 'x0) foreach): ('xs, 'x0) iforeach =
fn(xs, iwork) =>
let
val _ =
foreach_to_foldleft(foreach)
(xs, 0, fn(p, x) => (iwork(p, x); p+1)) in () end
*)

fun
foreach_to_iforeach
( foreach
: ('xs, 'x0) foreach): ('xs, 'x0) iforeach = fn(xs, iwork) =>
let
val count = ref(0)
in
foreach
( xs,
  fn(x1) => let val i = !count
                val () = count := i + 1 in iwork(i, x1) end
)
end

(* ****** ****** *)

fun
foreach_to_length
( foreach
: ('xs, 'x0) foreach): ('xs -> int) = fn(xs) =>
let
val count = ref(0)
in
foreach
( xs,
  fn(x1) => let val i = !count
                val () = count := i + 1 in () end
); !count
end

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

(*
fun
list_forall
(xs, test) =
foreach_to_forall(list_foreach)(xs, test)
*)
		 
(* ****** ****** *)
(* ****** ****** *)

fun
list_forall
( xs: 'a list
, test: 'a -> bool): bool =
(
case xs of
  nil => true
| x1 :: xs =>
  test(x1) andalso list_forall(xs, test)
)

fun
list_exists
( xs: 'a list
, test: 'a -> bool): bool =
(
case xs of
  nil => false
| x1 :: xs =>
  test(x1) orelse list_exists(xs, test)
)

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

fun
int1_filter_list
 ( n0, fopr ) =
(
  foreach_to_filter_list(int1_foreach)(n0, fopr))

(*
fun
list_filter
(xs: 'a list, test: 'a -> bool): 'a list =
(
case xs of
  [] => []
  x1 :: xs =>
  if test(x1)
  then x1 :: list_filter(xs, test) else list_filter(xs, test)
)
*)

fun
list_filter_list
 ( n0, fopr ) =
(
  foreach_to_filter_list(list_foreach)(n0, fopr))

val list_filter = list_filter_list

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

fun
list_concat
(xss: 'a list list): 'a list =
list_foldright
(xss, [], fn(xs, res) => list_append(xs, res))
(*
case xss of
  nil => nil
| xs1 :: xss => list_append(xs1, list_concat(xss))
*)

(* ****** ****** *)
(* ****** ****** *)

fun
strcon_head
(cxs: 'a strcon) =
case cxs of
strcon_nil => raise Empty
|
strcon_cons(cx1, fxs) => cx1

fun
strcon_tail
(cxs: 'a strcon) =
case cxs of
strcon_nil => raise Empty
|
strcon_cons(cx1, fxs) => fxs

(* ****** ****** *)

fun
stream_nil
((*void*)) =
  fn () => strcon_nil(*void*)
fun
stream_cons
( x1: 'a
, fxs
: 'a stream) =
   fn () => strcon_cons(x1, fxs)

(* ****** ****** *)

fun
stream_head
( fxs
: 'a stream) = strcon_head(fxs())
fun
stream_tail
( fxs
: 'a stream) = strcon_tail(fxs())

(* ****** ****** *)
(* ****** ****** *)

fun
stream_foreach
(fxs, work) =
let
fun
auxmain(fxs): unit =
(
case fxs() of
  strcon_nil => ()
| strcon_cons(x1, fxs) =>
  (work(x1); auxmain(fxs))
)
in
  auxmain(fxs)
end (* end-of-[stream_foreach(fxs, work)] *)

(* ****** ****** *)

fun
stream_get_at
( fxs
: 'a stream, i0: int): 'a =
(
foreach_to_get_at(stream_foreach)(fxs, i0))

(* ****** ****** *)
(* ****** ****** *)

fun
list_streamize(xs) = fn () =>
(
case xs of
  nil =>
  strcon_nil
| x1 :: xs =>
  strcon_cons(x1, list_streamize(xs))
)

(* ****** ****** *)
(* ****** ****** *)

fun
stream_tabulate
( n0: int
, fopr: int -> 'a): 'a stream =
let
fun
fmain1
(i0: int): 'a stream = fn() =>
strcon_cons(fopr(i0), fmain1(i0+1))
fun
fmain2
(i0: int): 'a stream = fn() =>
if
i0 >= n0
then strcon_nil else
strcon_cons(fopr(i0), fmain2(i0+1))
in
if n0 < 0 then fmain1(0) else fmain2(0)
end (* end-of-[stream_tabulate(n0, fopr)] *)

(* ****** ****** *)
(* ****** ****** *)
    
val
stream_length = fn(fxs) =>
foreach_to_length(stream_foreach)(fxs)

(* ****** ****** *)

fun
stream_append
( fxs: 'a stream
, fys: 'a stream) = fn() =>
(
case fxs() of
strcon_nil => fys()
|
strcon_cons(x1, fxs) =>
strcon_cons(x1, stream_append(fxs, fys)))

(* ****** ****** *)

fun
stream_concat
( fxss: 'a stream stream) = fn() =>
(
case fxss() of
strcon_nil => strcon_nil
|
strcon_cons(fxs1, fxss) =>
stream_append(fxs1, stream_concat(fxss))())

(* ****** ****** *)
(* ****** ****** *)

fun
stream_iforeach
(fxs, iwork) =
let
fun
auxmain(i0, fxs): unit =
(
case fxs() of
  strcon_nil => ()
| strcon_cons(x1, fxs) =>
  (iwork(i0, x1); auxmain(i0+1, fxs))
)
in
  auxmain(0, fxs)
end (* end-of-[stream_iforeach(fxs, iwork)] *)

(* ****** ****** *)
(* ****** ****** *)

structure Int = struct end
structure List = struct end
structure Char = struct end
structure String = struct end
structure TextIO = struct end

(* ****** ****** *)
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign04-lib.sml] *)
