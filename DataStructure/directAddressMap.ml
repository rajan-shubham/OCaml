module type DirectAddressMap = sig
  (** [t] is the type of maps that bind keys of type int to values of
      type ['v]. *)
  type 'v t

  (** [insert k v m] mutates map [m] to bind [k] to [v]. If [k] was
      already bound in [m], that binding is replaced by the binding to
      [v] in the new map. Requires: [k] is in bounds for [m]. *)
  val insert : int -> 'v -> 'v t -> unit

  (** [find k m] is [Some v] if [k] is bound to [v] in [m], and [None]
      if not. Requires: [k] is in bounds for [m]. *)
  val find : int -> 'v t -> 'v option

  (** [remove k m] mutates [m] to remove any binding of [k]. If [k] was
      not bound in [m], then the map is unchanged. Requires: [k] is in
      bounds for [m]. *)
  val remove : int -> 'v t -> unit

  (** [create c] creates a map with capacity [c]. Keys [0] through [c-1]
      are _in bounds_ for the map. *)
  val create : int -> 'v t

  (** [of_list c lst] is a map containing the same bindings as
      association list [lst] and with capacity [c]. Requires: [lst] does
      not contain any duplicate keys, and every key in [lst] is in
      bounds for capacity [c]. *)
  val of_list : int -> (int * 'v) list -> 'v t

  (** [bindings m] is an association list containing the same bindings
      as [m]. There are no duplicate keys in the list. *)
  val bindings : 'v t -> (int * 'v) list
end

module ArrayMap : DirectAddressMap = struct
  (** AF: [[|Some v0; Some v1; ... |]] represents {0 : v0, 1 : v1, ...}.
      If element [i] of the array is instead [None], then [i] is not
      bound in the map.
      RI: None. *)
  type 'v t = 'v option array

  (** Efficiency: O(1) *)
  let insert k v a = a.(k) <- Some v

  (** Efficiency: O(1) *)
  let find k a = a.(k)

  (** Efficiency: O(1) *)
  let remove k a = a.(k) <- None

  (** Efficiency: O(c) *)
  let create c = Array.make c None

  (** Efficiency: O(c) *)
  let of_list c lst =
    (* O(c) *)
    let a = create c in
    (* O(c) * O(1) = O(c) *)
    List.iter (fun (k, v) -> insert k v a) lst;
    a

  (** Efficiency: O(c) *)
  let bindings a =
    let bs = ref [] in
    (* O(1) *)
    let add_binding k v =
      match v with None -> () | Some v -> bs := (k, v) :: !bs
    in
    (* O(c) *)
    Array.iteri add_binding a;
    !bs
end

(*let m = ArrayMap.create 5;;
val m : '_weak2 ArrayMap.t = <abstr>
   *)
(*let m1 = ArrayMap.insert 2 "rajan" m;;
val m1 : unit = ()
*)
(*let m4 = ArrayMap.bindings m;;
val m4 : (int * string) list = [(2, "rajan")]
*)
(*ArrayMap.insert 0 "Piyush"  m;;
- : unit = ()
*)
(*let m5 = ArrayMap.bindings m;;
val m5 : (int * string) list = [(2, "rajan"); (0, "Piyush")]
*)



(*let lst = ["shubham";"prince";"anurag";"ajat";"toufik"];;
val lst : string list =
  ["shubham"; "prince"; "anurag"; "ajat"; "toufik"]
*)
(*let m1 = ArrayMap.of_list 5 lst;;
Error: This expression has type string list
       but an expression was expected of type (int * 'a) list
       Type string is not compatible with type int * 'a 
*)
(*let lst1 = [(0,"shubham");(1,"prince");(2,"anurag");(3,"ajat");(4,"toufik")];;
val lst1 : (int * string) list =
  [(0, "shubham"); (1, "prince"); (2, "anurag"); (3, "ajat");
   (4, "toufik")]
*)
(*let m1 = ArrayMap.of_list 5 lst1;;
val m1 : string ArrayMap.t = <abstr>
*)
(*let m2 = ArrayMap.insert 5 "aman" m1;;
Exception: Invalid_argument "index out of bounds".
*)



(*let a1 = ArrayMap.of_list 6 lst1;;
val a1 : string ArrayMap.t = <abstr>
*)
(*let a2 = ArrayMap.insert 5 "aman" a1;;
val a2 : unit = ()
*)
(*let a3 = ArrayMap.bindings a1;;
val a3 : (int * string) list =
  [(5, "aman"); (4, "toufik"); (3, "ajat"); (2, "anurag");
   (1, "prince"); (0, "shubham")]
*)



(*let f1 = ArrayMap.find 5 a1;;
val f1 : string option = Some "aman"
*)



(*let r1 = ArrayMap.remove 0 m;;
val r1 : unit = ()
*)
(*let r1' = ArrayMap.bindings m;;
val r1' : (int * string) list = [(2, "rajan")]
*)