module type Map = sig

    (** [('k, 'v) t] is the type of maps that bind keys of type
        ['k] to values of type ['v]. *)
    type ('k, 'v) t
  
    (** [insert k v m] is the same map as [m], but with an additional
        binding from [k] to [v].  If [k] was already bound in [m],
        that binding is replaced by the binding to [v] in the new map. *)
    val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
  
    (** [find k m] is [Some v] if [k] is bound to [v] in [m],
        and [None] if not. *)
    val find : 'k -> ('k, 'v) t -> 'v option
  
    (** [remove k m] is the same map as [m], but without any binding of [k].
        If [k] was not bound in [m], then the map is unchanged. *)
    val remove : 'k -> ('k, 'v) t -> ('k, 'v) t
  
    (** [empty] is the empty map. *)
    val empty : ('k, 'v) t
  
    (** [of_list lst] is a map containing the same bindings as
        association list [lst].
        Requires: [lst] does not contain any duplicate keys. *)
    val of_list : ('k * 'v) list -> ('k, 'v) t
  
    (** [bindings m] is an association list containing the same
        bindings as [m]. There are no duplicates in the list. *)
    val bindings : ('k, 'v) t -> ('k * 'v) list
end
  
  
module ListMap : Map = struct
    (** AF: [[(k1, v1); (k2, v2); ...; (kn, vn)]] is the map {k1 : v1, k2 : v2,
        ..., kn : vn}. If a key appears more than once in the list, then in the
        map it is bound to the left-most occurrence in the list. For example,
        [[(k, v1); (k, v2)]] represents {k : v1}. The empty list represents
        the empty map.
        RI: none. *)
    type ('k, 'v) t = ('k * 'v) list
  
    (** Efficiency: O(1). *)
    let insert k v m = (k, v) :: m
  
    (** Efficiency: O(n). *)
    let find = List.assoc_opt
  
    (** Efficiency: O(n). *)
    let remove k lst = List.filter (fun (k', _) -> k <> k') lst
  
    (** Efficiency: O(1). *)
    let empty = []
  
    (** Efficiency: O(1). *)
    let of_list lst = lst
  
    (** [keys m] is a list of the keys in [m], without
        any duplicates.
        Efficiency: O(n log n). *)
    let keys m = m |> List.map fst |> List.sort_uniq Stdlib.compare
  
    (** [binding m k] is [(k, v)], where [v] is the value that [k]
         binds in [m].
         Requires: [k] is a key in [m].
         Efficiency: O(n). *)
    let binding m k = (k, List.assoc k m)
  
    (** Efficiency: O(n log n) + O(n) * O(n), which is O(n^2). *)
    let bindings m = List.map (binding m) (keys m)
end
  
let m = ListMap.(empty);;
  (* val m : ('a, 'b) ListMap.t = <abstr> *)
let al1 = ListMap.insert 1 "prince" m;;
  (* val al1 : (int, string) ListMap.t = <abstr> *)
  (* al1;;
  - : (int, string) ListMap.t = <abstr>
  ListMap.find 1 al1;;
  - : string option = Some "prince"
  List.assoc_opt;;
  - : 'a -> ('a * 'b) list -> 'b option = <fun> *)
let al2 = ListMap.(al1 |>insert 2 "shubham" |> insert 3 "anurag" |> insert 4 "prince" |>insert 5 "anurag");;
  (* val al2 : (int, string) ListMap.t = <abstr> *)
let bindlist = ListMap.bindings al2;;
  (* val bindlist : (int * string) list =
    [(1, "prince"); (2, "shubham"); (3, "anurag"); (4, "prince");
     (5, "anurag")] *)
  (* bindings al2 ;;
  - : (int * string) list =
  [(1, "prince"); (2, "shubham"); (3, "anurag"); (4, "prince");
  (5, "anurag")] *)
  (* bindings remov;;
  - : (int * string) list =
  [(1, "prince"); (2, "shubham"); (3, "anurag"); (4, "prince")] *)
    