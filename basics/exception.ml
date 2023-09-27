exception OhNo of string;;
(* exception OhNo of string *)
OhNo "oops";;
(* - : exn = OhNo "oops" *)
raise (OhNo "oops");;
(* Exception: OhNo "oops". *)
(*5 / 0;;
 Exception: Division_by_zero. *)
(* exception ABadThing;;
 exception ABadThing
 raise ABadThing;;
Exception: ABadThing. *)
Invalid_argument "you will caught";;
(* - : exn = Invalid_argument "you will caught" *)
failwith "my error message";;
(* Exception: Failure "my error message". *)
let safe_div x y =
  try x/y with 
  |Division_by_zero -> 0;;
  (* val safe_div : int -> int -> int = <fun> *)
(* safe_div 4 0;;
- : int = 0
safe_div 5 5;;
- : int = 1
*)

match List.hd [] with
|[] -> "empty"
|_::_ -> "nonempty"
| exception (Failure s) -> s;;
(* - : string = "hd" *)
match List.hd [[]] with
|[] -> "empty"
|_::_ -> "nonempty"
| exception (Failure s) -> s;;
(* - : string = "empty" *)
