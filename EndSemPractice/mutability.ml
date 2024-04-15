type student = {name: string; mutable gpa: float}

 let alice = {name = "Alice"; gpa = 3.7}

 let () = alice.gpa <- 7.3;;

let num = ref 42;;
num := 79;;

let inc = ref (fun x -> x + 1);;
(* val inc : (int -> int) ref = {contents = <fun>} *)

let fa = [|1.;2.;3.;4.;5.|];;
(* val fa : float array = [|1.; 2.; 3.; 4.; 5.|] *)
for i = 0 to Array.length fa - 1 do
Printf.printf "%f " fa.(i)
done;;
(* 1.000000 2.000000 3.000000 4.000000 5.000000 - : unit = () *)
(* "shubham".[4];;
- : char = 'h' *)

let fact_loop n =
  let ans = ref 1 in
  for i = 1 to n do
    ans := !ans * i
  done;
  !ans;;

(* [init_matrix n o f] creates and returns an [n] by [o] matrix [m]
  * with [m.(i).(j) = f i j] for all [i] and [j] in bounds.
  * requires: [n, o >= 0]
 *)
 let init_matrix n o f =
  Array.init n (fun i -> Array.init o (fun j -> f i j))

(* init_matrix 3 3 ( + );;
- : int array array =
[|[|0; 1; 2|]; [|1; 2; 3|]; [|2; 3; 4|]|]
utop # init_matrix 3 3 ( - );;
- : int array array =
[|[|0; -1; -2|]; [|1; 0; -1|]; [|2; 1; 0|]|]
utop # init_matrix 3 3 ( * );;
- : int array array =
[|[|0; 0; 0|]; [|0; 1; 2|]; [|0; 2; 4|]|] *)