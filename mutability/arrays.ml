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


(* [vec_add v1 v2] is the sum of vectors [v1] & [v2]. Example: [vec_add [|1.; 2.|] [|3. ;4.|] ] is
   [[|4.; 6.|]] 
   Requires: [v1] and [v2] have the same length. *)
let vec_add v1 v2 =
  let len1, len2 = Array.length v1, Array.length v2 in
  if len1 <> len2 then invalid_arg "different lengths" else
    let v3 = Array.make len1 0. in 
    for i = 0 to len1 - 1 do
      v3.(i) <- v1.(i) +. v2.(i)
    done;
    v3


let vec_add' v1 v2 =
  let len1, len2 = Array.length v1, Array.length v2 in
  if len1 <> len2 then invalid_arg "different lengths" else
    let elt i = v1.(i) +. v2.(i) in
    Array.init len1 elt


let vec_add'' v1 v2 = 
  Array.map2 ( +. ) v1 v2

(*vec_add'' [|1.; 2.|] [|3. ;4.|];;
- : float array = [|4.; 6.|]
*)