type point = float * float
type vector = float list
type matrix = float list list;;
(* type point = float * float
type vector = float list
type matrix = float list list *)
(*let fl1 = [1.;2.;3.];;
val fl1 : float list = [1.; 2.; 3.]
fl1;;
- : float list = [1.; 2.; 3.]
let (fl2:vector) = fl1;;
val fl2 : vector = [1.; 2.; 3.] *)
let get_x = fun (x, _) -> x

let p1 : point = (1., 2.)
let p2 : float * float = (1., 3.)

let a = get_x p1
let b = get_x p2;;
(* val get_x : 'a * 'b -> 'a = <fun>
val p1 : point = (1., 2.)
val p2 : float * float = (1., 3.)
val a : float = 1.
val b : float = 1. 
p2;;
- : float * float = (1., 3.)
*)
