(* ************************************************ *)

use "./../../../lectures/lec-06-03/mylib-06-03.sml";

(* ************************************************ *)

val chr = Char.chr and ord = Char.ord

(* ************************************************ *)

val
digit2char = fn(d:int) => chr(ord(#"0") + d)
val
char2digit = fn(d:char) => ord(d) - ord(#"0")

(* ************************************************ *)

(*

Q1.1

fun
str2int(rep: string): int

Please give a non-recursive combinator-based
implementation of str2int, which str2int is described
in Assign01. No error-handling is needed.

*)

val str2int = fn(rep: string) =>
string_foldl
(rep, 0, fn(int, d) => 10*int + char2digit(d))

val int1 = str2int("12345")
val int2 = str2int("86420")

(* ************************************************ *)

(*

Q1.2

fun
int2str(i0: int): string

Please give a non-recursive combinator-based
implementation of str2int, which str2int is described
in Assign01. No error-handling is needed.

You can use the following functions in the SML library:

fun implode(char list): string

*)

val
int2str =
fn(i0: int) =>
if i0 <= 0 then "0" else
implode(#2(int0_foldl(i0, (i0, []), fn((i0, ds), _) => if i0 > 0 then (i0 div 10, digit2char(i0 mod 10) :: ds) else (i0, ds))))

val str1 = int2str(12345)
val str2 = int2str(97531)

(* ************************************************ *)

