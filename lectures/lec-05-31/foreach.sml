  fun foreach
    (xs: 'a list, work: 'a -> unit): unit =
    case xs of
      [] => ()
    | x1 :: xs =>
      let val _ = work(x1) in foreach(xs, work) end

   val xs = [1,2,3,4,5]
(*
   val myprint =
   fn(x) => let val _ = PolyML.print(x) in () end
*)
   val () = foreach(xs, fn(x: int) => (PolyML.print(x); ()))
   
