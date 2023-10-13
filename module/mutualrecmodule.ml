module M = struct
  (* Requires: input is non-negative. *)
  let rec even = function 
    | 0 -> true 
    | n -> odd (n - 1)
  and odd = function 
    | 0 -> false 
    | n -> even (n - 1)
end
(* M.even 4;;
- : bool = true
M.odd 4;;
- : bool = false *)

let length = String.length
let get = String.get
let lowercase_ascii = String.lowercase_ascii;;
(* val length : string -> int = <fun>
val get : string -> int -> char = <fun>
val lowercase_ascii : string -> string = <fun> *)
(* length "shubham";;
- : int = 7
get "shubham" 5;;
- : char = 'a'
lowercase_ascii "SHUBHAM";;
- : string = "shubham" *)


module M = struct
  open List

  (** [uppercase_all lst] upper-cases all the elements of [lst]. *)
  let uppercase_all = map String.uppercase_ascii
end;;
(* module M : sig val uppercase_all : string list -> string list end *)
(* let uclst1 = M.uppercase_all ["Shubham";"ji";"Kaise";"ho"];;
val uclst1 : string list = ["SHUBHAM"; "JI"; "KAISE"; "HO"] *)
