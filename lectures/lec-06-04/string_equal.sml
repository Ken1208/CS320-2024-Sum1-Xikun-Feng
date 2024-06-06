use "./mylib-06-04.sml";

val
string_equal =
fn(s1, s2) =>
let
val l1 = strlen(s1)
val l2 = strlen(s2)
in
  (l1 = l2) andalso
  int1_forall(l1, fn(i) => (strsub(s1, i) = strsub(s2, i)))
end
		      
