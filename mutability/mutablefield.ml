type point = {x : int; y : int; mutable c : string};;
(* type point = { x : int; y : int; mutable c : string; } *)
let p = {x = 0; y = 0; c = "red"};;
(* val p : point = {x = 0; y = 0; c = "red"} *)
p.c <- "white";;
(* - : unit = ()
p;;
- : point = {x = 0; y = 0; c = "white"} *)
(* p.x <- 1;;
Error: The record field x is not mutable *)


type 'a ref = { mutable contents : 'a };;
(* type 'a ref = { mutable contents : 'a; } *)
let r = {contents = 42};;
(* val r : int ref = {contents = 42} *)
let r' = ref 42;;
(* val r' : int Stdlib.ref = {Stdlib.contents = 42} *)
