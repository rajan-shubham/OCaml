module M = struct
  let x = 42
end
(* M.x;;
- : int = 42 *)
(* List.append [8] [1;2;3;4];;
- : int list = [8; 1; 2; 3; 4] *)
(* List.assoc;;
- : 'a -> ('a * 'b) list -> 'b = <fun>
let ablist = [(1,"shubham");(2,"prince");(3,"anurag")];;
val ablist : (int * string) list =
  [(1, "shubham"); (2, "prince"); (3, "anurag")]
List.assoc 2 ablist;;
- : string = "prince" *)

(* String.trim;; *)
(* - : string -> string = <fun> *)
let trim = String.trim "shubhamKumar";;
(* val trim : string = "shubhamKumar" *)
