let length_is lst n = List.length lst = n;;
(* val length_is : 'a list -> int -> bool = <fun> 
  length_is [1;23;34;5] 4;;
- : bool = true *)
(* List.length;;
- : 'a list -> int = <fun>
List.compare;;
- : ('a -> 'a -> int) -> 'a list -> 'a list -> int = <fun> *)
let rec from i j l = if i>j then l else from i (j-1) (j::l);;
(* val from : int -> int -> int list -> int list = <fun> 
let elements_of_list_upto j = from 0 j [];;
val elements_of_list_upto : int -> int list = <fun>
elements_of_list_upto 10;;
- : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10]   
*)
type color =
  | Red
  | Green
  | Blue;;
(* type color = Red | Green | Blue *)
let my_color = Red;;
(* val my_color : color = Red *)
let describe_color c =
  match c with
  | Red -> "It's red."
  | Green -> "It's green."
  | Blue -> "It's blue.";;
(* val describe_color : color -> string = <fun> *)
(*
Red;;
- : color = Red
my_color;;
- : color = Red
describe_color my_color;;
- : string = "It's red."
describe_color Red;;
- : string = "It's red."*) 
type point = float*float;;
(* type point = float * float *)
type shape = 
|Circle of {centre : point;radius:float}
|Rectangle of {lower_left:point;upper_right:point}

let c1 = Circle {centre = (0.,0.);radius=1.};;
(* type shape =
|Circle of { centre : point; radius : float; }
| Rectangle of { lower_left : point; upper_right : point; }
val c1 : shape = Circle {centre = (0., 0.); radius = 1.} *)
let r1 = Rectangle { lower_left=(-1.,-1.);upper_right=(1.,1.)};;
(* val r1 : shape = Rectangle {lower_left = (-1., -1.); upper_right = (1., 1.)} *)
let centre s = match s with
|Circle { centre;radius} -> centre
|Rectangle { lower_left;upper_right} -> (0.,0.) ;;
(* val center : shape -> point = <fun> *)
(* centre c1;;
- : point = (0., 0.) *)

let avg a b= (a+.b)/.2.;;
(* val avg : float -> float -> float = <fun> *)
let center s = match s with
|Circle { centre;radius} -> centre
|Rectangle { lower_left;upper_right} -> 
let (x_ll,y_ll) = lower_left in
let (x_ur,y_ur) = upper_right in
(avg x_ll x_ur,avg y_ll y_ur);;
(* val center : shape -> point = <fun> *)
(* center r1;;
- : point = (0., 0.) *)
let r2 = Rectangle {lower_left = (-4.,-4.);upper_right = (2.,2.)};;
(* val r2 : shape =
  Rectangle {lower_left = (-4., -4.); upper_right = (2., 2.)} *)
  (* center r2;;
  - : point = (-1., -1.)   *)
let center' s = match s with
|Circle {centre ;radius}->centre
|Rectangle {lower_left = (x_ll,y_ll);upper_right=(x_ur,y_ur) } -> (avg x_ll x_ur, avg y_ll y_ur);;
(* val center' : shape -> point = <fun> 
in this fun center' there is nesting of pattern matching done
center' r2;;
- : point = (-1., -1.)*)