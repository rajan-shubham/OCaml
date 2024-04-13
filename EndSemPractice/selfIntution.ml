(* utop # let total budget expenses =
  List.fold_left (fun acc e -> acc - e) budget expenses;;
val total : int -> int list -> int = <fun>
utop # let explist = [1;2;3;;4;5];;
Error: Syntax error: ']' expected, the highlighted '[' might be unmatched
utop # let explist = [1;2;3;4;5];;
val explist : int list = [1; 2; 3; 4; 5]
utop # total 100 explist;;
- : int = 85
utop # let length l =
  List.fold_left (fun acc _ -> acc + 1) 0 l;;
val length : 'a list -> int = <fun>
utop # length explist;;
- : int = 5
utop # let last l =
  match l with
  | [] -> invalid_arg "last: empty list"
  | h :: t -> List.fold_left (fun _ x -> x) h t;;
val last : 'a list -> 'a = <fun>
utop # last explist;;
- : int = 5
utop # let rev l =
  List.fold_left (fun acc x -> x :: acc) [] l;;
val rev : 'a list -> 'a list = <fun>
utop # rev explist;;
- : int list = [5; 4; 3; 2; 1]
utop # List.exists;;
- : ('a -> bool) -> 'a list -> bool = <fun>
utop # let rec drop n lst =
  if n = 0 then lst else match lst with
    | [] -> []
    | x :: xs -> drop (n - 1) xs;;
val drop : int -> 'a list -> 'a list = <fun>
utop # drop 2 explist;;
- : int list = [3; 4; 5]
utop # let rec take_rev n xs acc = 
  if n = 0 then acc else match xs with
    | [] -> acc
    | x :: xs' -> take_rev (n - 1) xs' (x :: acc);;
val take_rev : int -> 'a list -> 'a list -> 'a list = <fun>
utop # take_rev 2 explist [];;
- : int list = [2; 1]
utop # let rec from i j l =
  if i > j then l
  else from i (j - 1) (j :: l);;
val from : int -> int -> int list -> int list = <fun>
utop # from 1 3 explist;;
- : int list = [1; 2; 3; 1; 2; 3; 4; 5]
utop # (* returns: [powerset s] is the list representing the set of all subsets of s
 * requires: [s] is a set-like list (no duplicate elements) *)
let rec powerset = function
  | [] -> [ [] ]
  | x :: s -> let p = powerset s in
    List.map (List.cons x) p @ p;;
val powerset : 'a list -> 'a list list = <fun>
utop # powerset explist;;
- : int list list =
[[1; 2; 3; 4; 5]; [1; 2; 3; 4]; [1; 2; 3; 5]; [1; 2; 3]; [1; 2; 4; 5];
 [1; 2; 4]; [1; 2; 5]; [1; 2]; [1; 3; 4; 5]; [1; 3; 4]; [1; 3; 5]; [1; 3];
 [1; 4; 5]; [1; 4]; [1; 5]; [1]; [2; 3; 4; 5]; [2; 3; 4]; [2; 3; 5]; 
 [2; 3]; [2; 4; 5]; [2; 4]; [2; 5]; [2]; [3; 4; 5]; [3; 4]; [3; 5]; [3];
 [4; 5]; [4]; [5]; []]
utop # (* effects: prints all elements in the given list on a separate line *)
let rec print_int_list = function
  | [] -> ()
  | hd :: tl -> print_endline (string_of_int hd); print_int_list tl;;
val print_int_list : int list -> unit = <fun>
utop # print_int_list explist;;
1
2
3
4
5
- : unit = ()
utop # let safe_hd = function
  | [] -> None
  | h::_ -> Some h

(* returns: [Some x] if the tail of [lst] is [x], or [None]
 *   if [lst] is empty.
*)
let safe_tl = function
  | [] -> None
  | _::t -> Some t;;
val safe_hd : 'a list -> 'a option = <fun>
val safe_tl : 'a list -> 'a list option = <fun>
utop # safe_hd explist;;
- : int option = Some 1 *)

let insert k v d = (k,v)::d

(* find the value v to which key k is bound, if any, in the assocation list *)
let rec lookup k = function
  | [] -> None
  | (k',v)::t -> if k=k' then Some v else lookup k t

let dict = insert 3 "three" (insert 2 "two" (insert 1 "one" []))
(* let some_two = lookup 2 dict
let none = lookup 4 dict;;
val insert : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list = <fun>
val lookup : 'a -> ('a * 'b) list -> 'b option = <fun>
val dict : (int * string) list = [(3, "three"); (2, "two"); (1, "one")]
val some_two : string option = Some "two"
val none : string option = None *)

let product_left lst = List.fold_left ( *. ) 1.0 lst

let rec from i j l =
  if i>j then l
  else from i (j-1) (j::l);;
(* val from : int -> int -> int list -> int list = <fun> *)
let ij1 = from 1 10 [];;
(* val ij1 : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10] *)

let (--) i j =
  from i j []
let sum_cube_odd n =
  let l = 0 -- n in
  let odds_only = List.filter (fun i -> i mod 2 = 1) l in
  let odd_cubes = List.map (fun i -> i * i * i) odds_only in
  List.fold_left (+) 0 odd_cubes

(* sum_cube_odd 5;;
- : int = 153 *)

(* List.append ["b"] ["a"];;
- : string list = ["b"; "a"] *)

let at_least_three lst =
  List.filter (fun s -> String.length s > 3) lst;;
(* val at_least_three : string list -> string list = <fun> *)

(* at_least_three ["abc";"bac";"abcd";"dcba"];;
- : string list = ["abcd"; "dcba"] *)

let join_with strs sep =
  match strs with
  | [] -> ""
  | x :: xs ->
    List.fold_left (fun combined s -> combined ^ sep ^ s) x xs;;
(* val join_with : string list -> string -> string = <fun> *)

(* join_with ["abc";"bac";"abcd";"dcba"] "@";;
- : string = "abc@bac@abcd@dcba" *)

(* returns: [true] iff the matrix has at least one row and column, and
 * each row has the same number of columns.
*)
let is_valid_matrix = function
  | [] -> false
  | r :: rows ->
    let m = List.length r in
    m > 0 && List.for_all (fun r' -> m = List.length r') rows
;;
let matrix = [[1; 2; 3]; [4; 5; 6]; [7; 8; 9]];;
let matrix1 = [[1; 2; 3]; [4; 5; 6]; [7; 8; 9]; [10;11;12]];;
(* is_valid_matrix matrix;;
- : bool = true
is_valid_matrix matrix1;;
- : bool = true *)

(* returns: element-wise summation of two lists
 * requires: [v1] and [v2] has the same length
*)
let add_row_vectors =
  List.map2 (+)
;;
let add_matrices =
  List.map2 add_row_vectors
;;

(* add_matrices matrix1 matrix1;;
- : int list list =
[[2; 4; 6]; [8; 10; 12]; [14; 16; 18]; [20; 22; 24]] *)

let rec transpose ls =
  let rec transpose' acc = function
    | [] | [] :: _ -> List.rev acc
    | ls -> transpose' (List.map List.hd ls :: acc) (List.map List.tl ls)
  in transpose' [] ls

let dot = List.fold_left2 (fun acc x y -> acc + x * y) 0

let multiply_matrices m1 m2 =
  List.map (fun row -> List.map (dot row) (transpose m2)) m1

(* another solution *)

let inner matrix row = List.map (dot row) (transpose matrix)

let multiply_matrices' m1 m2 =
  List.map (inner m2) m1
;;

(* multiply_matrices' matrix matrix;;
- : int list list = [[30; 36; 42]; [66; 81; 96]; [102; 126; 150]] *)

(* multiply_matrices [[1;2];[3;4]] [[4;5];[6;7]];;
- : int list list = [[16; 19]; [36; 43]] *)