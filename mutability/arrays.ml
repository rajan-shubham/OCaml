(* Arrays are fixed-length mutable sequences with constant-time access and update. *)

(* [|1 ;2;3;4|];;
- : int array = [|1; 2; 3; 4|] *)
let a = [|1 ;2;3;4|];;
(* val a : int array = [|1; 2; 3; 4|] *)
(* a.(0);;
- : int = 1
a.(4);;
Exception: Invalid_argument "index out of bounds". *)
a.(0) <- 5;;
(* - : unit = ()
a;;
- : int array = [|5; 2; 3; 4|] *)

type vec = float array

let vec_print v = 
  for i = 0 to Array.length v - 1 do
    print_float v.(i); print_newline ()
  done

let v = [|1.;0.|]
(*vec_print v;;
1.
0.
- : unit = ()
*)

let vec_print' v = 
  let print_elt n = 
    print_float n; print_newline ()
  in
  Array.iter print_elt v 
(* vec_print' v;;
1.
0.
- : unit = ()
*)

let vec_print'' v = 
  Array.iter (Printf.printf "%f\n") v
(*%f take & print  floating point no. in standard style i.e (1.000000),
   but %F take & print in Ocaml style. (1.)*)