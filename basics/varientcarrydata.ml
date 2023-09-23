type point = float * float
type shape =
  | Point of point
  | Circle of point * float (* center and radius *)
  | Rect of point * point ;;(* lower-left and upper-right corners *)

  (* type point = float * float
  type shape = Point of point | Circle of point * float | Rect of point * point *)

(*Point (0.,0.);;
- : shape = Point (0., 0.)
((0.,0.),1.);;
- : (float * float) * float = ((0., 0.), 1.)
Circle ((0.,0.),1.);;
- : shape = Circle ((0., 0.), 1.)
 Rect ((-1.,-1.),(1.,1.));;
- : shape = Rect ((-1., -1.), (1., 1.))
let r2 = Rect ((-2.,-2.),(2.,2.));;
val r2 : shape = Rect ((-2., -2.), (2., 2.))
*)
let area = function
  | Point _ -> 0.0
  | Circle (_, r) -> Float.pi *. (r ** 2.0)
  | Rect ((x1, y1), (x2, y2)) ->
      let w = x2 -. x1 in
      let h = y2 -. y1 in
      w *. h;;

(*area (Rect ((-1.,-1.),(1.,1.)));;
- : float = 4.
area (Rect ((-2.,-2.),(2.,2.)));;
- : float = 16.
area r2;;
- : float = 16.
   *)

let center = function
  | Point p -> p
  | Circle (p, _) -> p
  | Rect ((x1, y1), (x2, y2)) -> ((x2 +. x1) /. 2.0, (y2 +. y1) /. 2.0);;

(*val area : shape -> float = <fun>
val center : shape -> point = <fun>
*)
(*center r2;;
- : point = (0., 0.)
let c2 = (Circle ((0.,0.),1.));;
val c2 : shape = Circle ((0., 0.), 1.)
center c2;;
- : point = (0., 0.)
area c2;;
- : float = 3.14159265358979312


let c3 = (Circle ((2.,2.) ,1.) );;
val c3 : shape = Circle ((2., 2.), 1.)
area c3;;
- : float = 3.14159265358979312
center c3;;
- : point = (2., 2.)
*)

let (p1:point) = (1.,1.);;
(* val p1 : point = (1., 1.) *)
(*let c1 = Circle {((0.,0.),1.)};;
Error: Syntax error*)
let (c1:point*float)=((0.,0.),1.);; 
(* val c1 : point * float = ((0., 0.), 1.) *)

let (r1:point*point) = ((-1.,-1.),(1.,1.));; 
(* val r1 : point * point = ((-1., -1.), (1., 1.)) *)

type string_or_int =
  | String of string
  | Int of int;;
(*type string_or_int = String of string | Int of int*)

type string_or_int_list = string_or_int list

let rec sum : string_or_int list -> int = function
  | [] -> 0
  | String s :: t -> int_of_string s + sum t
  | Int i :: t -> i + sum t

let lst_sum = sum [String "1"; Int 2];;
(* type string_or_int_list = string_or_int list
val sum : string_or_int list -> int = <fun>
val lst_sum : int = 3 *)

(*let s1 = String "7";;
val s1 : string_or_int = String "7"
let i1 = Int 8;;
val i1 : string_or_int = Int 8
let i2 = Int 9;;
val i2 : string_or_int = Int 9
let s2 = String "5";;
val s2 : string_or_int = String "5"
let sil = [s1;s2;i1;i2];;
val sil : string_or_int list = [String "7"; String "5"; Int 8; Int 9]
sum sil;;
- : int = 29 *)


type t = Left of int |Right of int ;;
(* type t = Left of int | Right of int *)
let x = Left 1 and y = Right 1;;
(* val x : t = Left 1
val y : t = Right 1 *)
let double_right = function 
|Left i -> i
|Right i -> i*2;;
(* val double_right : t -> int = <fun> *)
(* double_right x;;
- : int = 1
double_right y;;
- : int = 2
double_right x,y;;
- : int * t = (1, Right 1)
double_right y,x;;
- : int * t = (2, Left 1) *)

type color = Blue |Red |Green
let string_of_color = function
|Blue -> "It's Blue"
|Red -> "It's Red"
|Green -> "It's Green";;
(* type color = Blue | Red | Green
val string_of_color : color -> string = <fun> *)
(*string_of_color Red;;
- : string = "It's Red"
   *)
