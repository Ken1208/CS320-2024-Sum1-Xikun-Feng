(* Definition of strcon datatype *)
datatype 'a strcon =
  strcon_nil
| strcon_cons of ('a * (unit -> 'a strcon))

(* Definition of stream type *)
type 'a stream = unit -> 'a strcon

(* Function to construct a new stream where each element is the first greater than the previous *)
fun stream_maximize (xs: int stream): int stream =
  let
    (* Function to find the next element greater than the previous one *)
    fun find_next (xs: int stream, prev: int): int stream =
      fn () =>
        case xs () of
          strcon_nil => strcon_nil
        | strcon_cons (x, xs') =>
            if x > prev then strcon_cons (x, find_next (xs', x))
            else find_next (xs', prev) ()

    (* Function to start the new stream with the first element *)
    fun make_stream (xs: int stream): int stream =
      fn () =>
        case xs () of
          strcon_nil => strcon_nil
        | strcon_cons (x, xs') => strcon_cons (x, find_next (xs', x))
  in
    make_stream xs
  end

(* Function to create a stream from a list of integers *)
fun list_to_stream (lst: int list): int stream =
  fn () =>
    case lst of
      [] => strcon_nil
    | x::xs => strcon_cons (x, list_to_stream xs)

(* Function to convert a stream to a list of n elements *)
fun stream_to_list (s: int stream) (n: int): int list =
  if n = 0 then []
  else
    case s () of
      strcon_nil => []
    | strcon_cons (x, xs) => x :: stream_to_list xs (n-1)

(* Test cases *)
val stream1 = list_to_stream [2, 1, 4, 3, 6, 5, 8, 7]
val stream2 = list_to_stream [4, 7, 2, 5, 6, 8, 3, 1, 9]

val result1 = stream_to_list (stream_maximize stream1) 10
val result2 = stream_to_list (stream_maximize stream2) 10

val expected1 = [2, 4, 6, 8]
val expected2 = [4, 7, 8, 9]

val _ = if result1 = expected1 then print "Test 1 passed\n" else print "Test 1 failed\n"
val _ = if result2 = expected2 then print "Test 2 passed\n" else print "Test 2 failed\n"
