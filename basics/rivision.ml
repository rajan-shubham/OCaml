let a = 0 in a;;
(* a;;
Error: Unbound value a --> this gives a notion of scope*)

let c = 3 in (let d = 4 in c + d);;
let x = 1 in
let x = 2 in 
x;;

13/2;;
(* - : int 6 *)
(* 13 mod 2;;
- : int = 1 *)
(* let name = "shubham";;
val name : string = "shubham" *)
(* name.[3];;
- : char = 'b' *)

(* Printf.printf "hello"
;;
hello- : unit = () *)
(* Printf.printf "hello \t"
;;
hello   - : unit = () *)
(* Printf.sprintf "hello \t"
;;
- : string = "hello \t" *)

(* [[1+1];[3-4];[3*4]];;
- : int list list = [[2]; [-1]; [12]] *)

(* let add1 x = x + 1;;
val add1 : int -> int = <fun> *)
(* let lst1 = [(add1 3); (add1 5)];;
val lst1 : int list = [4; 6] *)

let insert k v lst = (k,v) :: lst;;
let rec lookup k = function
   |[] -> None
   |(k',v)::t -> if k'=k then Some v else lookup k t;;

(* tail rec fibonacci series *)
let fibonacci n = 
  let rec iter n acc1 acc2 =
    match n with
    |0 -> acc1
    |1 -> acc2
    |_ -> iter (n-1) acc2 (acc1 + acc2)
  in iter n 0 1

(* list of num. upto *)
let rec from i j l = if i>j then l else from i (j-1) (j::l);;
(* val from : int -> int -> int list -> int list = <fun> 
let elements_of_list_upto j = from 0 j [];;
val elements_of_list_upto : int -> int list = <fun>
elements_of_list_upto 10;;
- : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10]   
*)

let rec add lst acc=match lst with
|[]->acc
|h::t-> add t (h+acc);;

let apd_tail_rec lst1 lst2 =
  let rec aux acc lst1 =
    match lst1 with
    | [] -> acc @ lst2  (* Combine the accumulator with lst2 to form the final result *)
    | h::t -> aux (acc @ [h]) t
  in
  aux [] lst1
;;