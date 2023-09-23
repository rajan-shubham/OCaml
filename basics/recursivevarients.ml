type intlist = Nil | Cons of int * intlist

let lst3 = Cons (3, Nil)  (* similar to 3 :: [] or [3]*)
let lst123 = Cons(1, Cons(2, lst3)) (* similar to [1; 2; 3] *)

let rec sum (l : intlist) : int=
  match l with
  | Nil -> 0
  | Cons (h, t) -> h + sum t

let rec length : intlist -> int = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t

let empty : intlist -> bool = function
  | Nil -> true
  | Cons _ -> false;;

(*length lst123;;
- : int = 3
empty Nil;;
- : bool = true
   *)


type node = {value : int; next : mylist}
and mylist = Nil | Node of node;;
(* type node = { value : int; next : mylist; }
and mylist = Nil | Node of node *)

(*let (n1:node) = {value = 1;next = n2;}
and (n2:node) = {value = 2;next = Nil;};;  
Error: Unbound value n2
let (n2:node) = {value = 2;next = Nil;};;
val n2 : node = {value = 2; next = Nil}
let (n1:node) = {value = 1;next = n2;};;
Error: This expression has type node
       but an expression was expected of type mylist
let (nod2:mylist) = Node n2;;
val nod2 : mylist = Node {value = 2; next = Nil}
let (n1:node) = {value = 1;next = nod2;};;
val n1 : node =
  {value = 1; next = Node {value = 2; next = Nil}}
*)