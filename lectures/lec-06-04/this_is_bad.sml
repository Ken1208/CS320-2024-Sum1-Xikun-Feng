(*
This is kind of coding should be AVOIDED!!!
*)

fun fact(n: int): int =
let
  val i = ref(0)
  val res = ref(1)
  fun loop() =
    if !i < n
    then (i := !i + 1; res := !res * !i; loop()) else ()
in
  loop(); !res
end

val fact10 = fact(10)

