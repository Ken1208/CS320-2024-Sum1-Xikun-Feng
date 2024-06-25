(* ****** ****** *)

datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)

type 'a stream = (unit -> 'a strcon)

(* ****** ****** *)

datatype node = NODE of int

fun
node_get_neighbors(node): node list = []

fun dfs_walk(node): node stream = fn() =>
  strcon_cons
  (node, dfs_walk_list(node_get_neighbors(node)))

and dfs_walk_list(nodes): node stream = fn() =>
(
case nodes of
  nil => strcon_nil
| (node :: nodes) =>
  strcon_cons
  (node, dfs_walk_list(node_get_neighbors(node) @ nodes))
)

fun bfs_walk(node): node stream = fn() =>
  strcon_cons
  (node, bfs_walk_list(node_get_neighbors(node)))

and bfs_walk_list(nodes): node stream = fn() =>
(
case nodes of
  nil => strcon_nil
| (node :: nodes) =>
  strcon_cons
  (node, bfs_walk_list(nodes @ node_get_neighbors(node)))
)

(* ****** ****** *)
    
