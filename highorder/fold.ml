let rec sum = function
|[] -> 0
|h::t -> h + sum t
and concat = function
|[] -> ""
|h::t -> h^concat t;;
(* val sum : int list -> int = <fun>
val concat : string list -> string = <fun> *)
let l1 = [1;2;3;4;5] and l2 = ["i";"am";"shubham";"kumar"];;
(* val l1 : int list = [1; 2; 3; 4; 5]
val l2 : string list = ["i"; "am"; "shubham"; "kumar"] *)

(*sum l1, concat l2;;
- : int * string = (15, "iamshubhamkumar")*)

let rec combine init op = function
|[] -> init
|h::t -> op h (combine init op t);;
(* val combine : 'a -> ('b -> 'a -> 'a) -> 'b list -> 'a = <fun> *)
let sum' lst = combine 0 (+) lst and 
concat' lst = combine "" (^) lst;;
(* val sum' : int list -> int = <fun>
val concat' : string list -> string = <fun> *)

let rec fold_right f lst acc = match lst with
|[] -> acc
|h::t -> f h (fold_right f t acc);;
(* val fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b = <fun> *)
let sum'' lst = fold_right (+) lst 0 and
concat'' lst = fold_right (^) lst "";;
(* val sum'' : int list -> int = <fun>
val concat'' : string list -> string = <fun>
sum'' l1,concat'' l2;;
- : int * string = (15, "iamshubhamkumar") *)


let rec fold_left f acc lst = match lst with
|[] -> acc 
|h::t -> fold_left f (f acc h) t;;
(* val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a = <fun> *)


let sum''' lst = fold_left (+) 0 lst and
concat''' lst = fold_left (^) "" lst ;;
(* val sum''' : int list -> int = <fun>
val concat''' : string list -> string = <fun> *)
(* sum''' l1,concat''' l2;;
- : int * string = (15, "iamshubhamkumar") *)

(* List.fold_left;;
- : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a = <fun>
List.fold_left (+) 0 l1;;
- : int = 15 *)