type nat = Zero | Succ of nat;;
(* type nat = Zero | Succ of nat *)

let zero = Zero
let one = Succ zero
let two = Succ one
let three = Succ two
let four = Succ three;;
(* val zero : nat = Zero
val one : nat = Succ Zero
val two : nat = Succ (Succ Zero)
val three : nat = Succ (Succ (Succ Zero))
val four : nat = Succ (Succ (Succ (Succ Zero))) *)

let iszero = function
  | Zero -> true
  | Succ _ -> false

let pred = function
  | Zero -> failwith "pred Zero is undefined"
  | Succ m -> m;;
(* val iszero : nat -> bool = <fun>
val pred : nat -> nat = <fun> *)

(* iszero two;;
- : bool = false
pred three;;
- : nat = Succ (Succ Zero) *)

let rec int_of_nat = function
  | Zero -> 0
  | Succ m -> 1 + int_of_nat m

let rec nat_of_int = function
  | i when i = 0 -> Zero
  | i when i > 0 -> Succ (nat_of_int (i - 1))
  | _ -> failwith "nat_of_int is undefined on negative ints";;
(* val int_of_nat : nat -> int = <fun>
val nat_of_int : int -> nat = <fun> *)
(* int_of_nat three;;
- : int = 3 
nat_of_int 5;;
- : nat = Succ (Succ (Succ (Succ (Succ Zero))))
*)

let rec even = function Zero -> true | Succ m -> odd m
and odd = function Zero -> false | Succ m -> even m;;
(* val even : nat -> bool = <fun>
val odd : nat -> bool = <fun> *)
(* even three;;
- : bool = false *)
