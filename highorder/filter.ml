let rec evens = function
|[] -> []
|h::t -> begin
  if h mod 2 = 0 then h::evens t else evens t 
end;;
let rec odds = function
|[] -> []
|h::t -> begin
  if h mod 2 = 1 then h::odds t else odds t 
end;;
(*let l1 = [1;2;3;4;5;6];;
val l1 : int list = [1; 2; 3; 4; 5; 6]
evens l1;;
- : int list = [2; 4; 6]
*)

let rec filter' p = function
|[] -> []
|h::t -> if p h then h::filter' p t else filter' p t;;

let even x = x mod 2 = 0 and odd x = x mod 2 = 1;;

let evens' lst = filter' even lst ;;
let odds' lst = filter' odd lst;;

(*odds' l1;;
- : int list = [1; 3; 5]
*)

let rec filter_aux p acc = function
|[] -> List.rev acc
|h::t -> filter_aux p (if p h then h::acc else acc) t
let rec filter p lst = filter_aux p [] lst;;
(*this filter function is tail recursive.*)
(*filter even l1;;
- : int list = [2; 4; 6]
*)
(*List.filter;;
- : ('a -> bool) -> 'a list -> 'a list = <fun>
*)