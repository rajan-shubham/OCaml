type 'a tree = Node of 'a * 'a tree * 'a tree | Leaf

(** [mem x t] is [true] iff [x] is a member of [t]. *)
let rec mem x = function
  | Leaf -> false
  | Node (y, l, r) ->
    if x < y then mem x l
    else if x > y then mem x r
    else true

(** [insert x t] is [t] with [x] inserted as a member. *)
let rec insert x = function
  | Leaf -> Node (x, Leaf, Leaf)
  | Node (y, l, r) as t ->
    if x < y then Node (y, insert x l, r)
    else if x > y then Node (y, l, insert x r)
    else t

(**)
(*let t1 = (5,Leaf,Leaf);;
val t1 : int * 'a tree * 'b tree = (5, Leaf, Leaf)*)
(*let t2 = Node (5,Leaf,Leaf);;
val t2 : int tree = Node (5, Leaf, Leaf)*)


(* wrong way ->
insert 6 t2;;
- : int tree = Node (5, Leaf, Node (6, Leaf, Leaf))
insert 4 t2;;
- : int tree = Node (5, Node (4, Leaf, Leaf), Leaf)*)

(* right way ->
let t3 = insert 6 t2;;
val t3 : int tree = Node (5, Leaf, Node (6, Leaf, Leaf))
let t4 = insert 4 t3;;
val t4 : int tree =
  Node (5, Node (4, Leaf, Leaf), Node (6, Leaf, Leaf))*)

(*let t5 = insert 3 t4;;
val t5 : int tree =
  Node (5, Node (4, Node (3, Leaf, Leaf), Leaf),
   Node (6, Leaf, Leaf))
let t6 = insert 7 t5;;
val t6 : int tree =
  Node (5, Node (4, Node (3, Leaf, Leaf), Leaf),
   Node (6, Leaf, Node (7, Leaf, Leaf)))*)

(*mem 7 t6;;
- : bool = true*)