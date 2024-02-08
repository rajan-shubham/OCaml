(* open Printf
let rec isExp x = if x = 1.0 then true else if x < 1.0 then false else isExp (x /. 2.0);;
Printf.printf "%b\n" (isExp 4.0);;
Printf.printf "%b\n" (isExp 15.0);;
Printf.printf "%b\n" (isExp 4.0);; *)

(*open Printf*)

let rec isExp x = 
  if x = 1.0 then 
    true 
  else if x < 1.0 then 
    false 
  else 
    isExp (x /. 2.0)

let () =
  Printf.printf "Enter a number: ";
  let input = float_of_string (read_line ()) in
  Printf.printf "%b\n" (isExp input)
