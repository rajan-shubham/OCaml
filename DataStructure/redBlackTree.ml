module RBset = struct
type color = Red | Black
type 'a rbtree = Leaf | Node of color * 'a * 'a rbtree * 'a rbtree

let rec mem x = function
  | Leaf -> false
  | Node (_, y, l, r) ->
    if x < y then mem x l
    else if x > y then mem x r
    else true

let balance = function
  | Black, z, Node (Red, y, Node (Red, x, a, b), c), d
  | Black, z, Node (Red, x, a, Node (Red, y, b, c)), d
  | Black, x, a, Node (Red, z, Node (Red, y, b, c), d)
  | Black, x, a, Node (Red, y, b, Node (Red, z, c, d)) ->
    Node (Red, y, Node (Black, x, a, b), Node (Black, z, c, d))
  | a, b, c, d -> Node (a, b, c, d)

(**)
let insert x s =
  let rec ins = function
    | Leaf -> Node (Red, x, Leaf, Leaf)
    | Node (color, y, a, b) as s ->
      if x < y then balance (color, y, ins a, b)
      else if x > y then balance (color, y, a, ins b)
      else s
  in
  match ins s with
  | Node (_, y, a, b) -> Node (Black, y, a, b)
  | Leaf -> (* guaranteed to be non-empty *)
    failwith "RBT insert failed with ins returning leaf"
end

(*some ways of writing answer : *)

(*let rb1 = RBset.Node (Black,5,Leaf,Leaf);;
val rb1 : int RBset.rbtree =
  RBset.Node (RBset.Black, 5, RBset.Leaf, RBset.Leaf)*)
(*let rb2 =  RBset.insert 6 rb1;;
val rb2 : int RBset.rbtree =
  RBset.Node (RBset.Black, 5, RBset.Leaf,
   RBset.Node (RBset.Red, 6, RBset.Leaf, RBset.Leaf))*)
(*let rb3 =  RBset.insert 4 rb2;;
val rb3 : int RBset.rbtree =
  RBset.Node (RBset.Black, 5,
   RBset.Node (RBset.Red, 4, RBset.Leaf, RBset.Leaf),
   RBset.Node (RBset.Red, 6, RBset.Leaf, RBset.Leaf))*)
(*let rb4 =  RBset.insert 3 rb3;;
val rb4 : int RBset.rbtree =
  RBset.Node (RBset.Black, 4,
   RBset.Node (RBset.Black, 3, RBset.Leaf, RBset.Leaf),
   RBset.Node (RBset.Black, 5, RBset.Leaf,
    RBset.Node (RBset.Red, 6, RBset.Leaf, RBset.Leaf)))*)
(*let rb5 =  RBset.insert 7 rb4;;
val rb5 : int RBset.rbtree =
  RBset.Node (RBset.Black, 4,
   RBset.Node (RBset.Black, 3, RBset.Leaf, RBset.Leaf),
   RBset.Node (RBset.Red, 6,
    RBset.Node (RBset.Black, 5, RBset.Leaf, RBset.Leaf),
    RBset.Node (RBset.Black, 7, RBset.Leaf, RBset.Leaf)))*)


(*open RBset;;*)
(*let rb1 = Node (Black,5,Leaf,Leaf);;
val rb1 : int rbtree = Node (Black, 5, Leaf, Leaf)*)
(*let rb2 = insert 6 rb1;;
val rb2 : int rbtree =
  Node (Black, 5, Leaf, Node (Red, 6, Leaf, Leaf))*)
(*let rb3 = insert 4 rb2;;
val rb3 : int rbtree =
  Node (Black, 5, Node (Red, 4, Leaf, Leaf),
   Node (Red, 6, Leaf, Leaf))*)
(*let rb4 = insert 3 rb3;;
val rb4 : int rbtree =
  Node (Black, 4, Node (Black, 3, Leaf, Leaf),
   Node (Black, 5, Leaf, Node (Red, 6, Leaf, Leaf)))*)
(*let rb5 = insert 7 rb4;;
val rb5 : int rbtree =
  Node (Black, 4, Node (Black, 3, Leaf, Leaf),
   Node (Red, 6, Node (Black, 5, Leaf, Leaf),
    Node (Black, 7, Leaf, Leaf)))*)



(*best way to insert elements*)

(*let rb5 = insert 1 rb5;;
val rb5 : int rbtree =
  Node (Black, 4, Node (Black, 3, Node (Red, 1, Leaf, Leaf), Leaf),
   Node (Red, 6, Node (Black, 5, Leaf, Leaf),
    Node (Black, 7, Leaf, Leaf)))*)
(*let rb5 = insert 0 rb5;;
val rb5 : int rbtree =
  Node (Black, 4,
   Node (Red, 1, Node (Black, 0, Leaf, Leaf),
    Node (Black, 3, Leaf, Leaf)),
   Node (Red, 6, Node (Black, 5, Leaf, Leaf),
    Node (Black, 7, Leaf, Leaf)))*)
(*let rb5 = insert 8 rb5;;
val rb5 : int rbtree =
  Node (Black, 4,
   Node (Red, 1, Node (Black, 0, Leaf, Leaf),
    Node (Black, 3, Leaf, Leaf)),
   Node (Red, 6, Node (Black, 5, Leaf, Leaf),
    Node (Black, 7, Leaf, Node (Red, 8, Leaf, Leaf))))*)
(*let rb5 = insert 2 rb5;;
val rb5 : int rbtree =
  Node (Black, 4,
   Node (Red, 1, Node (Black, 0, Leaf, Leaf),
    Node (Black, 3, Node (Red, 2, Leaf, Leaf), Leaf)),
   Node (Red, 6, Node (Black, 5, Leaf, Leaf),
    Node (Black, 7, Leaf, Node (Red, 8, Leaf, Leaf))))*)
(*let rb5 = insert 9 rb5;;
val rb5 : int rbtree =
  Node (Black, 6,
   Node (Black, 4,
    Node (Red, 1, Node (Black, 0, Leaf, Leaf),
     Node (Black, 3, Node (Red, 2, Leaf, Leaf), Leaf)),
    Node (Black, 5, Leaf, Leaf)),
   Node (Black, 8, Node (Black, 7, Leaf, Leaf),
    Node (Black, 9, Leaf, Leaf)))*)