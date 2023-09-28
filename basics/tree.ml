type 'a tree =
|Leaf
|Node of 'a * 'a tree * 'a tree;;
(* type 'a tree = Leaf | Node of 'a * 'a tree * 'a tree *)

let t = 
  Node(4,
   Node(2,
    Node(1,Leaf,Leaf),
    Node(3,Leaf,Leaf)
  ),
  Node(5,
   Node(6,Leaf,Leaf),
   Node(7,Leaf,Leaf)
  )
  );;
(* val t : int tree =
Node (4, Node (2, Node (1, Leaf, Leaf), Node (3, Leaf, Leaf)),
Node (5, Node (6, Leaf, Leaf), Node (7, Leaf, Leaf))) *)

let rec size = function
  |Leaf -> 0
  |Node (_,l,r) -> 1 + size l + size r;;

(*size t;;
- : int = 7*)

type 'a tree =
  | Leaf
  | Node of 'a node

and 'a node = {
  value: 'a;
  left: 'a tree;
  right: 'a tree
};;
(* type 'a tree = Leaf | Node of 'a node
and 'a node = { value : 'a; left : 'a tree; right : 'a tree; } *)

(* represents
      2
     / \
    1   3  *)
    let t =
      Node {
        value = 2;
        left = Node {value = 1; left = Leaf; right = Leaf};
        right = Node {value = 3; left = Leaf; right = Leaf}
      };;
(* val t : int tree =
Node
 {value = 2; left = Node {value = 1; left = Leaf; right = Leaf};
right = Node {value = 3; left = Leaf; right = Leaf}} *)

let rec mem x = function
|Leaf -> false
|Node {value; left; right} -> value = x || mem x left || mem x right;;
(*mem 3 t;;
- : bool = true
*)

let rec preorder = function
|Leaf -> []
|Node {value; left; right} -> [value] @ preorder left @ preorder right;;
(*preorder t;;
- : int list = [2; 1; 3]
*)


let preorder_lin t =
  let rec pre_acc acc = function
  | Leaf -> acc
  | Node {value; left; right} -> value :: (pre_acc (pre_acc acc right) left) in pre_acc [] t;;

(*preorder_lin t;;
- : int list = [2; 1; 3]
*)