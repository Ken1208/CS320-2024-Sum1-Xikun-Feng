type ('seq, 'elt) forall = ('seq * ('elt -> bool)) -> bool
type ('seq, 'elt) foreach = ('seq * ('elt -> unit)) -> unit

fun
forall2foreach
(forall: ('seq, 'elt)forall): ('seq, 'elt)foreach =
fn(xs, work) =>
let
val _ = forall(xs, fn (x1) => (work(x1); true)) in ()
end
							   
