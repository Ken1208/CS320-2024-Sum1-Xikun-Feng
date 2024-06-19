(* ****** ****** *)
datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)
type 'a stream = (unit -> 'a strcon)
(* ****** ****** *)

fun midterm2_04 (xs: 'a list): 'a stream =
  let
    val rev_xs = rev xs

    fun create_stream (lst, rev_lst) () =
      let
        fun helper ([], []) = create_stream (lst, rev_lst) ()
          | helper ([], ys) = strcon_cons (hd ys, fn () => helper ([], tl ys))
          | helper (xs, ys) = strcon_cons (hd xs, fn () => helper (tl xs, ys))
      in
        helper (lst, rev_lst)
      end

  in
    fn () => create_stream (xs, rev_xs) ()
  end


(* Helper function to convert a stream to a list of the first n elements *)
fun take (0, _) = []
  | take (n, strm) =
    case strm() of
      strcon_nil => []
    | strcon_cons (x, xs) => x :: take (n - 1, xs)

(* Test the midterm2_04 function *)
val test_stream_1 = midterm2_04 [1, 2, 3]
val test_result_1 = take (12, test_stream_1)  (* Expected: [1, 2, 3, 3, 2, 1, 1, 2, 3, 3, 2, 1] *)

val test_stream_2 = midterm2_04 ["a", "b"]
val test_result_2 = take (8, test_stream_2)  (* Expected: ["a", "b", "b", "a", "a", "b", "b", "a"] *)

(* Expected results *)
val expected_result_1 = [1, 2, 3, 3, 2, 1, 1, 2, 3, 3, 2, 1]
val expected_result_2 = ["a", "b", "b", "a", "a", "b", "b", "a"]

(* Check if test results match the expected results *)
val test_pass_1 = test_result_1 = expected_result_1
val test_pass_2 = test_result_2 = expected_result_2

(* Print test results *)
val _ = if test_pass_1 then print "Test 1 Pass!\n" else print "Test 1 Fail!\n"
val _ = if test_pass_2 then print "Test 2 Pass!\n" else print "Test 2 Fail!\n"

(* For debugging purposes, print the actual results *)
val _ = if not test_pass_1 then
          print ("Test 1 result: " ^ String.concatWith ", " (List.map Int.toString test_result_1) ^ "\n") else ()
val _ = if not test_pass_2 then
          print ("Test 2 result: " ^ String.concatWith ", " test_result_2 ^ "\n") else ()
