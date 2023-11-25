(*Mutable singly-linked Lists *)

(* An ['a node] is a node of a mutable singly-linked list. 
   It contains a value of type ['a] and optionally has a pointer to the next node. *)
type 'a node = {
  value : 'a;
  mutable next : 'a node option;
}

(* An ['a mlist] is a mutable-singly-linked list with element of type ['a]. *)
type 'a mlist = {
  mutable first : 'a node option;
} 

(* [creat_node v] is a node containing value [v] with of link to another node. *)
let creat_node v = {
  next = None;
  value = v; 
}

(* [singleton v] is a singly-linked list containing exactly one value, [v]. *)
let singleton v = {
  first = Some (creat_node v)
}
(*singleton 5;;
- : int mlist = {first = Some {value = 5; next = None}}
creat_node 8;;
- : int node = {value = 8; next = None}
*)



(* [insert_first lst n] mutates [lst] by inserting value [v] as the first value in the list. *)
let insert_first lst v = 
  match lst.first with
  | None -> 
    lst.first <- Some (creat_node v)
  | was_first -> 
    let new_first = creat_node v in 
    new_first.next <- was_first;
    lst.first <- Some new_first

(* let insert_first lst v =
  lst.first <- Some { value = v; next = lst.first} *)

let empty () = {
  first = None
}

(*let l = singleton 3110;;
val l : int mlist = {first = Some {value = 3110; next = None}}
insert_first l 100;;
- : unit = ()
l;;
- : int mlist =
{first = Some {value = 100; next = Some {value = 3110; next = None}}}
*)
(*let empty = {
  first = None
};;
val empty : '_weak1 mlist = {first = None}
*)
(*let sl = empty;;
val sl : '_weak1 mlist = {first = None}
insert_first sl 3110;;
- : unit = ()
insert_first sl 100;;
- : unit = ()
sl;;
- : int mlist =
{first = Some {value = 100; next = Some {value = 3110; next = None}}}
*)
(*let l = empty ();;
val l : '_weak1 mlist = {first = None}
insert_first l 3110;;
- : unit = ()
let l2 = empty ();;
val l2 : '_weak2 mlist = {first = None}
insert_first l2 2110;;
- : unit = ()
l,l2;;
- : int mlist * int mlist =
({first = Some {value = 3110; next = None}},
 {first = Some {value = 2110; next = None}})
*)