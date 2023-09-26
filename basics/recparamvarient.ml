type 'a mylist = 
|Nil
|Cons of 'a * 'a mylist;;
(* type 'a mylist = Nil | Cons of 'a * 'a mylist *)

let rec length = function
|Nil -> 0
|Cons (_,t) -> 1 + length t;;
(* val length : 'a mylist -> int = <fun> *)

let (ml1:'a mylist) = Cons (3,(Cons (2,Cons (1,Nil))));;
(* val ml1 : int mylist = Cons (3, Cons (2, Cons (1, Nil))) *)
(* length ml1;;
- : int = 3 *)

type 'a my_list = 
|[]
|(::) of 'a * 'a my_list;;
(* type 'a my_list = [] | (::) of 'a * 'a my_list *)

let rec length_list = function
|[] -> 0
|_::t -> 1 + length_list t;;
(* val length_list : 'a my_list -> int = <fun> *)

let (ml2:'a my_list) = (::) (2,(::) (1,[]));;
(* val ml2 : int my_list = (::) (2, (::) (1, []))
length_list ml2;;
- : int = 2 *)

type 'a list = 
|[]
|(::) of 'a * 'a list;;
(* type 'a list = [] | (::) of 'a * 'a list *)

let rec length_of_list = function
|[] -> 0
|(::) (_,t) -> 1 + length_of_list t;;
(* val length_of_list : 'a list -> int = <fun> *)

(* let (lst:'a list) = (::) (2,(::) (1,[]));;
val lst : int list = (::) (2, (::) (1, []))
length_of_list lst;;
- : int = 2 *)
