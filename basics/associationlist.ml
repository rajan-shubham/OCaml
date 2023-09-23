let d = [("triangle",3);("rectangle",4);("nonagon",9)];;
(* val d : (string * int) list =
  [("triangle", 3); ("rectangle", 4); ("nonagon", 9)] *)
let insert k v lst = (k,v) :: lst;;
(* val insert : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list = <fun> *)
(*insert "icosagon" 20 d;;
- : (string * int) list =
[("icosagon", 20); ("triangle", 3); ("rectangle", 4); ("nonagon", 9)]
   *)
   let rec lookup k = function
   |[] -> None
   |(k',v)::t -> if k'=k then Some v else lookup k t;;
   (* val lookup : 'a -> ('a * 'b) list -> 'b option = <fun> *)
(*lookup "triangle" d;;
- : int option = Some 3*)
