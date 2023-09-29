let double x = 2 * x
let square x = x * x;;
(* val double : int -> int = <fun>
val square : int -> int = <fun> *)
(*double 5;;
- : int = 10
square 3;;
- : int = 9
*)
let quad x = double (double x)
let fourth x = square (square x);;
(* val quad : int -> int = <fun>
val fourth : int -> int = <fun> *)
(*quad 5,fourth 4;;
- : int * int = (20, 256)
*)
let twice f x = f (f x);;
(* val twice : ('a -> 'a) -> 'a -> 'a = <fun> *)
(* twice (fun x -> x+1) 5;;
- : int = 7
twice double 7;;
- : int = 28 *)
let quad x = twice double x
let fourth x = twice square x;;
(* val quad : int -> int = <fun>
val fourth : int -> int = <fun> *)
(*quad 7;;
- : int = 28*)
