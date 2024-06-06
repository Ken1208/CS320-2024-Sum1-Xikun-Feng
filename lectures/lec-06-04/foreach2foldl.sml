(* ************************************************ *)
(* ************************************************ *)

type
('seq, 'elt) forall =
('seq * ('elt -> bool)) -> bool
type
('seq, 'elt) foreach =
('seq * ('elt -> unit)) -> unit

(* ************************************************ *)
(* ************************************************ *)

type
('seq, 'elt, 'res) foldl =
('seq * 'res * (('res * 'elt) -> 'res)) -> 'res

type
('seq, 'elt, 'res) foldr =
('seq * 'res * (('elt * 'res) -> 'res)) -> 'res

(* ************************************************ *)
(* ************************************************ *)

fun
foreach2foldl
( foreach
: ('seq, 'elt)foreach): ('seq, 'elt, 'res)foldl =
fn(xs, r0, fopr) =>
let
val res = ref(r0)
in
(foreach(xs, fn(x1) => res := fopr(!res, x1)); !res)
end

fun
foldl2length
(foldl
: ('seq, 'elt, 'res)foldl): ('seq -> int) =
(
  fn(xs) => foldl(xs, 0, fn(r0, x1) => r0 + 1))

(* ************************************************ *)
(* ************************************************ *)
