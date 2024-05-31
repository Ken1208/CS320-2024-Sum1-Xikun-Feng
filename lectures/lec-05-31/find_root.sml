  fun find_root(f0: int -> int): int =
    let
      fun loop(i: int): int =
        if f0(i) = 0 then i else loop(i+1)
    in
      loop(0)
    end

    val r1 = find_root(fn(x:int) => (x+100)*(x-101))
    
    
