type 'a tree =
|Leaf
|Node of 'a * 'a tree * 'a tree;;

let t =
  Node ( 1,Node (2,Leaf,Leaf),Node(3,Leaf,Leaf)
);;

let rec map f = function
|Leaf -> Leaf
|Node (v,l,r) -> Node (f v,map f l,map f r);;

let add1 t = map succ t;;
(*add1 t;;
- : int tree =
Node (2, Node (3, Leaf, Leaf), Node (4, Leaf, Leaf))
*)

let rec fold acc f = function
|Leaf -> acc
|Node (v,l,r) -> f v (fold acc f l) (fold acc f r);;

let sum t = fold 0 (fun x y z -> x+y+z) t;;
(* sum t;;
- : int = 6
t |> add1 |> sum;;
- : int = 9 *)