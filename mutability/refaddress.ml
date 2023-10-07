type 'a pointer = 'a ref option;; 
(* type 'a pointer = 'a ref option *)

let null : 'a pointer = None;;
(* val null : 'a pointer = None *)

let malloc (x : 'a) : 'a pointer = Some (ref x);;
(* val malloc : 'a -> 'a pointer = <fun> *)

let p = malloc 42;;
(* val p : int pointer = Some {contents = 42} *)
exception Segfault

let deref (ptr:'a pointer) : 'a = 
match ptr with None -> raise Segfault | Some r -> !r;;

(* Obj.magic;;
- : 'a -> 'b = <fun>
Obj.magic 5;;
- : 'a = <poly>
Obj.magic p;;
- : 'a = <poly> *)
let address (ptr:'a pointer) : int = 
  match ptr with None -> 0 | Some r -> Obj.magic r
  
  let ( ~& ) = address;;
(* val address : 'a pointer -> int = <fun>
val ( ~& ) : 'a pointer -> int = <fun> *)
(* address p;;
- : int = 46960995897252 *)
 