(*let rec list_max = function
  | [] -> ???
  | h :: t -> max h (list_max t);;
Error: Syntax error
*)
(*Some 42;;
- : int option = Some 42
 None;;
- : 'a option = None
   *)
   let extract o =
    match o with
    | Some i -> string_of_int i
    | None -> "";;
    (* extract (Some 39);;
    - : string = "39"
    - : string = "42"

    - : string = "" *)
    let get_val o = match o with 
    |None -> failwith "??"
    |Some x -> x;;
    (* val get_val : 'a option -> 'a = <fun> *)
    let get_val default o = match o with 
    |None -> default
    |Some x -> x;;
    (* val get_val : 'a -> 'a option -> 'a = <fun> *)
(*get_val "" (Some "h");;
- : string = "h"
get_val "" (Some "");;
- : string = ""
get_val "" (Some "   ");;
- : string = "   "
get_val None (Some None);;
- : 'a option = None
   *)
let rec list_max (lst:'a list):'a option = match lst with
|[] -> None
|h::t -> begin
 match list_max t with 
|None -> Some h
|Some m -> Some (max h m)
end;;
(* val list_max : 'a list -> 'a option = <fun> 
list_max [1;2;3;5;4];;
- : int option = Some 5
list_max [];;
- : 'a option = None

*)