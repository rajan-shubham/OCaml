let x = ref 0;;
(* val x : int ref = {contents = 0}
!x;;
- : int = 0
x := 1;;
- : unit = ()
!x;;
- : int = 1 *)

let x = ref 42;;
(* val x : int ref = {contents = 42} *)
let y = ref 42;;
(* val y : int ref = {contents = 42} *)
let z = x;;
(* val z : int ref = {contents = 42} *)
x := 43;;
(* - : unit = () *)
let w = !y + !z;;
(* val w : int = 85 *)
(* !z;;
- : int = 43 *)

let counter = ref 0

let next_val = fun () -> counter := !counter + 1;
!counter;;
(* val counter : int ref = {contents = 0}
val next_val : unit -> int = <fun>
next_val ();;
- : int = 1
next_val ();;
- : int = 2 *)


let next_val = 
  let counter = ref 0 in 
  fun () -> incr counter;
  !counter;;
(* val next_val : unit -> int = <fun> *)

(* next_val ();;
- : int = 1
next_val ();;
- : int = 2 *)
