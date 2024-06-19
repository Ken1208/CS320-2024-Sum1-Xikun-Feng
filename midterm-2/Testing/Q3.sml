(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

datatype 'a tree =
  tree_nil
| tree_cons of ('a tree * 'a * 'a tree)

(* ****** ****** *)

(* The original pre-order foreach function *)
fun tree_pre_foreach (xs: 'a tree, work: 'a -> unit): unit =
  case xs of
    tree_nil => ()
  | tree_cons (tl, x0, tr) =>
      (work x0; tree_pre_foreach (tl, work); tree_pre_foreach (tr, work))

(* Tail-recursive implementation of tree_pre_foreach *)
fun tree_pre_foreach_trec (xs: 'a tree, work: 'a -> unit): unit =
  let
    fun helper ([], _) = ()
      | helper (tree_nil :: ts, work) = helper (ts, work)
      | helper (tree_cons (tl, x0, tr) :: ts, work) =
          (work x0; helper (tl :: tr :: ts, work))
  in
    helper ([xs], work)
  end

(* Helper function to build a sample tree *)
fun build_sample_tree (): int tree =
  tree_cons (
    tree_cons (tree_nil, 1, tree_cons (tree_nil, 2, tree_nil)),
    3,
    tree_cons (tree_nil, 4, tree_nil)
  )

(* Test functions *)
fun test_tree_pre_foreach () =
  let
    val result = ref []
    val work = fn x => result := x :: !result
    val tree = build_sample_tree ()
  in
    tree_pre_foreach (tree, work);
    !result = rev [1, 2, 3, 4]
  end

fun test_tree_pre_foreach_trec () =
  let
    val result = ref []
    val work = fn x => result := x :: !result
    val tree = build_sample_tree ()
  in
    tree_pre_foreach_trec (tree, work);
    !result = rev [1, 2, 3, 4]
  end

(* Run the tests and print the results *)
val _ = if test_tree_pre_foreach () then
          print "Test tree_pre_foreach Pass!\n"
        else
          print "Test tree_pre_foreach Fail!\n"

val _ = if test_tree_pre_foreach_trec () then
          print "Test tree_pre_foreach_trec Pass!\n"
        else
          print "Test tree_pre_foreach_trec Fail!\n"
