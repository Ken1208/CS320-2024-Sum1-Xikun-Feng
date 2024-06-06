(* ************************************************ *)
(* ************************************************ *)
(*
HX-2024-06-04:
Welcome to a zoo of combinators!
*)
(* ************************************************ *)
(* ************************************************ *)

val chr = Char.chr
val ord = Char.ord
val strsub = String.sub
val strlen = String.size
val implode = String.implode

(* ************************************************ *)
(* ************************************************ *)

fun
list_exists
(xs: 'a list, test: 'a -> bool): bool =
(
case xs of
  [] => false
| x1 :: xs =>
  if test(x1)
  then true else list_exists(xs, test))

fun
list_forall
(xs: 'a list, test: 'a -> bool): bool =
(
case xs of
  [] => true
| x1 :: xs =>
  if test(x1)
  then list_forall(xs, test) else false)

(* ************************************************ *)

fun
list_foldl
(xs: 'a list, r0: 'b, f0: 'b * 'a -> 'b): 'b =
case xs of [] => r0
	 | x1 :: xs => list_foldl(xs, f0(r0, x1), f0)

fun
list_reverse(xs: 'a list): 'a list =
list_foldl(xs, [], fn(r0, x1) => x1 :: r0)
				    
(*
fun
list_foldr
(xs: 'a list, r0: 'b, f0: 'a * 'b -> 'b): 'b =
case xs of [] => r0
	 | x1 :: xs => f0(x1, list_foldr(xs, r0, f0))
*)

fun
list_foldr
(xs: 'a list, r0: 'b, f0: 'a * 'b -> 'b): 'b =
list_foldl
(list_reverse(xs), r0, fn(r0, x1) => f0(x1, r0))

fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
list_foldl(xs, ys, fn(r0, x1) => x1 :: r0)

fun
list_map (* = list_map_list *)
(xs: 'a list, fopr: 'a -> 'b): 'b list =
list_foldr(xs, [], fn(x1, r0) => fopr(x1) :: r0)

fun
list_maprev (* = list_map_list *)
(xs: 'a list, fopr: 'a -> 'b): 'b list =
list_foldl(xs, [], fn(r0, x1) => fopr(x1) :: r0)

(* ************************************************ *)
(* ************************************************ *)

fun
int1_forall
(xs: int, test: int -> bool): bool =
let
fun
loop(i: int): bool =
  if i >= xs then true else
  (if test(i) then loop(i+1) else false)
in
  loop(0)
end (* let *) (* int1_forall(xs, test) *)

fun
int1_exists
(xs: int, test: int -> bool): bool =
let
fun
loop(i: int): bool =
  if i >= xs then false else
  (if test(i) then true else loop(i+1))
in
  loop(0)
end (* let *) (* int1_exists(xs, test) *)

(* ************************************************ *)

fun
int0_foldl
(xs: int, r0: 'a, f0: 'a * unit -> 'a): 'a =
int1_foldl(xs, r0, fn(r0, _) => f0(r0, ()))

and
int1_foldl
(xs: int, r0: 'a, f0: 'a * int -> 'a): 'a =
let
  fun loop(i, res) =
  if i < xs then loop(i+1, f0(res, i)) else res
in
  loop(0, r0)
(* Python:
   res = r0;
   for i in range(xs): res = f0(res, i); res *)
end

(* ************************************************ *)

fun pow(x: int, n: int): int =
int0_foldl(n, 1, fn(r, _) => r * x)

fun fact(n: int): int =
int1_foldl(n, 1, fn(r, i) => (i+1)*r)

fun fibo(n: int): int =
#1(int0_foldl(n, (0, 1), fn((f0, f1), _) => (f1, f0+f1)))

(* ************************************************ *)

fun
int0_foldr
(xs: int, r0: 'a, f0: unit * 'a -> 'a): 'a =
int1_foldr(xs, r0, fn(_, r0) => f0((), r0))

and
int1_foldr
(xs: int, r0: 'a, f0: int * 'a -> 'a): 'a =
if xs <= 0 then r0
           else int1_foldr(xs-1, f0(xs-1, r0), f0)

(* ************************************************ *)

(*
HX: list_tabulate
*)
fun
int1_map_list
(xs: int, fopr: int -> 'a): 'a list =
int1_foldr(xs, [], fn(x1, r0) => fopr(x1) :: r0)

(* ************************************************ *)

fun
list_range
(n0: int): int list =
int1_map_list(n0, fn i => i)

(* ************************************************ *)
(* ************************************************ *)

fun
string_exists
(cs: string, test: char -> bool): bool =
int1_exists(strlen(cs), fn(i) => test(strsub(cs, i)))

fun
string_forall
(cs: string, test: char -> bool): bool =
int1_forall(strlen(cs), fn(i) => test(strsub(cs, i)))

(* ************************************************ *)

fun
string_foldl
(cs: string, r0: 'a, f0: ('a * char) -> 'a): 'a =
int1_foldl
( strlen(cs)
, r0
, fn(r0, i1) => f0(r0, strsub(cs, i1)))

fun
string_foldr
(cs: string, r0: 'a, f0: (char * 'a) -> 'a): 'a =
int1_foldr
( strlen(cs)
, r0, fn(i1, r0) => f0(strsub(cs, i1), r0))

fun
string_map_list(cs, fopr) =
string_foldr(cs, [], fn(ch, r0) => fopr(ch) :: r0)

(* ************************************************ *)

fun explode(cs) = string_map_list(cs, fn c => c)

(* ************************************************ *)
(* ************************************************ *)

type
('seq, 'elt) forall =
('seq * ('elt -> bool)) -> bool
type
('seq, 'elt) foreach =
('seq * ('elt -> unit)) -> unit


type
('seq, 'elt) iforall =
('seq * (int * 'elt -> bool)) -> bool


(* ************************************************ *)
(* ************************************************ *)

fun
forall2foreach
(forall: ('seq, 'elt)forall): ('seq, 'elt)foreach =
fn(xs, work) =>
let
val _ = forall(xs, fn (x1) => (work(x1); true)) in ()
end

(* ************************************************ *)
(* ************************************************ *)

val
string_foreach =
fn(xs, work) =>
forall2foreach(string_forall)(xs, work)

(* ************************************************ *)
(* ************************************************ *)

val
char_print =
fn(c) => print(Char.toString(c))
val string_print =
fn(cs: string) =>
string_foreach(cs, fn(c) => char_print(c))

(*
val () = string_print("Hello!!!")
*)

(* ************************************************ *)
(* ************************************************ *)

(* end of [lectures/lec-06-03/mylib-06-03.sml] *)
