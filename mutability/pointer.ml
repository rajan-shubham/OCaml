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
(* exception Segfault
val deref : 'a pointer -> 'a = <fun> *)
(* deref p;;
- : int = 42
deref null;;
Exception: Segfault. *)

let ( ~* ) = deref;;
(* val ( ~* ) : 'a pointer -> 'a = <fun> *)
(* ~*p;;
- : int = 42 *)

let assign (ptr:'a pointer) (x:'a) :unit = 
  match ptr with None -> raise Segfault | Some r -> r := x;;
(* val assign : 'a pointer -> 'a -> unit = <fun> *)
(* assign p 2
deref p;;
Error: This function has type 'a pointer -> 'a -> unit
       It is applied to too many arguments; maybe you forgot a `;'. *)

(* assign p 2;
 deref p;;
- : int = 2 *)
(* assign null 0;;
Exception: Segfault. *)

let ( =* ) = assign;;
(* val ( =* ) : 'a pointer -> 'a -> unit = <fun>
p =* 3;;
- : unit = ()
~*p;;
- : int = 3 *)
