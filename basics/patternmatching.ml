let x =
  match not true with
  |true -> "nope"
  |false -> "yep";;
  (* val x : string = "yep" *)
  (*let y =
    match 42 with
    |fooo -> fooo;;
    val y : int = 42 
let z = 
match "foo" with
|"bar" -> 0
|_ -> 1;;
val z : int = 1
let a =
match [] with
|[] -> "empty"
|_-> "not empty";;
val a : string = "empty"
let b =
match ["taylor";"swift"] with
|[]-> "folklore"
|h::t -> h;;
val b : string = "taylor"
let b =
match ["taylor";"swift"] with
|[]-> ["folklore"]
|h::t -> t;;
val b : string list = ["swift"]
*)
let fst3 t= match t with
|(a,b,c) -> a;;
(* val fst3 : 'a * 'b * 'c -> 'a = <fun>
fst3 (1,2,3);;
- : int = 1
fst ('a','b');;
- : char = 'a'
*)
type student = { name : string; year : int; }
let rbg = {
name = "Ruth Bader";
year = 1954;};;
(* type student = { name : string; year : int; }
val rbg : student = {name = "Ruth Bader"; year = 1954} *)
let name_with_year s=
match s with
|{name;year} -> name^"'"^string_of_int year;;
(* val name_with_year : student -> string = <fun> *)
let empty lst =match lst with
|[] -> "empty list"
|h::t -> "not empty";;
(* val empty : 'a list -> string = <fun> *)
let is_empty lst=match lst with
|[] -> true
|_::_ -> false;;
(* val is_empty : 'a list -> bool = <fun> *)
let rec add lst acc=match lst with
|[]->acc
|h::t-> add t (h+acc);;
(* val add : int list -> int -> int = <fun> *)
let sum lst = add lst 0;;
(* val sum : int list -> int = <fun> *)
let rec length lst acc= match lst with
|[]-> acc
|h::t->length t (1+acc)
let length_of_list lst = length lst 0;;
(* val length : 'a list -> int -> int = <fun>
val length_of_list : 'a list -> int = <fun> *)
let rec apd lst1 lst2=match lst1 with
|[] -> lst2
|h::t -> h::(apd t lst2);;
(* val apd : 'a list -> 'a list -> 'a list = <fun> *)