module type ComplexSig = sig
  type t = float * float
  val zero : t
  val add : t -> t -> t
end;;
module Complex : ComplexSig = struct
  type t = float * float
  let zero = (0., 0.)
  let add (r1,i1) (r2,i2) = r1 +. r2, i1 +. i2
end;;

module ListQueue = struct
  type 'a queue = 'a list

  let empty = []

  let is_empty q = (q = [])

  let enqueue x q = q @ [x]

  let peek = function
    | []   -> failwith "Empty"
    | x::_ -> x

  let dequeue = function
    | []   -> failwith "Empty"
    | _::q -> q
end

(* returns: a [ListQueue] filled with [n] elements. *)
let fill_listqueue n =
  let rec loop n q =
    if n=0 then q
    else loop (n-1) (ListQueue.enqueue n q) in
  loop n ListQueue.empty
;;
(* fill_listqueue 5;;
- : int list = [5; 4; 3; 2; 1] *)


module BatchedQueue = struct
  type 'a t = {outbox:'a list; inbox:'a list}

  let empty = {outbox=[]; inbox=[]}

  let is_empty = function
    | {outbox=[]; inbox=[]} -> true
    | _ -> false

  let norm = function
    | {outbox=[]; inbox} -> {outbox=List.rev inbox; inbox=[]}
    | q -> q

  let enqueue x q = norm {q with inbox=x::q.inbox}

  let peek = function
    | {outbox=[]; _} -> None
    | {outbox=x::_; _} -> Some x

  let dequeue = function
    | {outbox=[]; _} -> None
    | {outbox=_::xs; inbox} -> Some (norm {outbox=xs; inbox})
end;;

module type Map = sig
  type ('k, 'v) t
  val empty  : ('k, 'v) t
  val insert : 'k -> 'v -> ('k,'v) t -> ('k,'v) t
  val lookup  : 'k -> ('k,'v) t -> 'v
end

(*  * exercise: binary search tree map *)
module BstMap : Map = struct
  type 'a tree =
    | Leaf
    | Node of 'a * 'a tree * 'a tree

  type ('k, 'v) t = ('k * 'v) tree

  let empty =
    Leaf

  let rec insert k v = function
    | Leaf -> Node((k, v), Leaf, Leaf)
    | Node ((k',v'), l, r) ->
      if (k = k') then Node ((k, v), l, r)
      else if (k < k') then Node ((k',v'), insert k v l, r)
      else Node ((k',v'), l, insert k v r)

  let rec lookup k = function
    | Leaf -> failwith "Not_found"
    | Node ((k',v'), l, r) ->
      if (k = k') then v'
      else if (k < k') then lookup k l
      else lookup k r
end

(* exercise: fraction *)
module type Fraction = sig
  (* A fraction is a rational number p/q, where q != 0.*)
  type t

  (* [make n d] is n/d. Requires d != 0. *)
  val make : int -> int -> t

  val numerator : t -> int
  val denominator : t -> int
  val to_string : t -> string
  val to_float : t -> float

  val add : t -> t -> t
  val mul : t -> t -> t
end

module PairFraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let add (n1,d1) (n2,d2) =
    let d' = d1 * d2 in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2, d1 * d2)
end