let rec add1 = function
|[] -> []
|h::t -> (h+1)::add1 t;;
(* val add1 : int list -> int list = <fun> *)

let rec concat301 = function
|[] -> []
|h::t -> (h^"302")::concat301 t;;
(* val concat301 : string list -> string list = <fun> *)

let a1 = [1;2;3;4;5] and c1 = ["i";"am";"shubham";"rajan"];;
(* val a1 : int list = [1; 2; 3; 4; 5]
val c1 : string list = ["i"; "am"; "shubham"; "rajan"]
add1 a1,concat301 c1;;
- : int list * string list =
([2; 3; 4; 5; 6], ["i302"; "am302"; "shubham302"; "rajan302"]) *)

let rec transform f = function
|[] -> []
|h::t -> f h :: transform f t;;
(* val transform : ('a -> 'b) -> 'a list -> 'b list = <fun> *)
(* transform (fun x -> x +1) a1;;
- : int list = [2; 3; 4; 5; 6] *)


let rec map f = function
|[] -> []
|h::t -> f h :: map f t;;
(* val map : ('a -> 'b) -> 'a list -> 'b list = <fun> *)
let add1' lst = map (fun x -> x+1) lst
let concat301' lst = map (fun x -> x ^ "301") lst;;
(* val add1' : int list -> int list = <fun>
val concat301' : string list -> string list = <fun> *)
(*add1' a1;;
- : int list = [2; 3; 4; 5; 6]
concat301' c1;;
- : string list = ["i301"; "am301"; "shubham301"; "rajan301"]
*)

let stringlist_of_intlist lst = map string_of_int lst;;
(* val stringlist_of_intlist : int list -> string list = <fun> *)
(*stringlist_of_intlist a1;;
- : string list = ["1"; "2"; "3"; "4"; "5"]
*)

(* string_of_int;;
- : int -> string = <fun>
List.append ;;
- : 'a list -> 'a list -> 'a list = <fun>
List.map;;
- : ('a -> 'b) -> 'a list -> 'b list = <fun>
let result = List.map string_of_int a1;;
val result : string list = ["1"; "2"; "3"; "4"; "5"] *)
let c2 = ['a';'b';'c';'d'];;
(* val c2 : char list = ['a'; 'b'; 'c'; 'd'] *)
(*let result1 = List.map int_of_char c2;;
val result1 : int list = [97; 98; 99; 100]
let result2 = List.append a1 [6;7;8;9;10];;
val result2 : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
List.append [ 5] result2;;
- : int list = [5; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
*)
