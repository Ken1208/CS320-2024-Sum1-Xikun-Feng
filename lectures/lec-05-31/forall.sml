  fun forall
    (xs: 'a list, test: 'a -> bool): bool =
    case xs of
      [] => true
    | x1 :: xs =>
      if test(x1) then forall(xs, test) else false

  fun forall
    (xs: 'a list, test: 'a -> bool): bool =
    foldleft(xs, true, fn(r0, x1) => if r0 then test(x1) else false)
