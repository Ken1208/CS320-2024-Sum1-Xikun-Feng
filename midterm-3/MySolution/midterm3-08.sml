(* ************************************************ *)
HX2-2024-06-25: 12 points
(* ************************************************ *)

(*

HX: 2 points

fun f(x) =
if x > 0 then f(f(x)) else f(f(f(x)))

How many tail-recursive calls in the definition of 'f'?

*)

(* ************************************************ *)

(*

HX: 2 points

fun f(x) = f(g(f(x))) + 1
and g(y) = f(g(f(g(f(g(x))))))

How many (mutual) tail-recursive calls in the definition of 'g'?

*)

(* ************************************************ *)

(*

HX: 3 points

fun pp x y = fun f -> f(x,y)

val ff = (* WRITE YOUR CODE *)

(* Give an implementation of ff that
   makes the following assertions pass *)

let () = assert (pp 200 100 ff = 500)
let () = assert (pp 100 200 ff = 100)

*)

(* ************************************************ *)

(* Question 7: 5 points

   Given the following snippet, implement the test
   function so that isPrime returns true for prime
   number inputs and false otherwise. *)

fun isPrime(n) =
let
  fun test(i:int): bool = (* YOUR CODE *)
in
  if n < 2 then false else int1_forall(n)(test)
end

(* ************************************************ *)
