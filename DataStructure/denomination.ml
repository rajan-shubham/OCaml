(* which taken amount and a list of denominations (in descending order) using which you need to construct the given amount. A given amount can be produced using different combinations of the provided denominations. Your function needs to output the total number of possible ways of producing the given amount.
*)

let rec cch amount demonations = 
  if amount<0 then failwith "Invalid input"
  else if amount = 0 then 1 else 
    match demonations with 
    |[] -> 0 
    | h::t -> if amount>=h then (cch (amount-h) demonations) + (cch amount t) else (cch amount t);;

(* cch 102 d1;;
- : int = 4907*)

(* which, like the above function cch, takes an amount and a list of denominations, and outputs an (int,int) tuple list indicating the smallest number of denominations used to obtain the given amount. The first int in the tuple indicates how many of this denomination is used in constructing the given amount.
   *)

let scch amount denominations = 
  let rec helper amount denominations acc =
    if amount<0 then failwith "Invalid Input" else if amount = 0 then acc else
      match denominations with
      | [] -> []
      | h::t -> (if amount >= h then (helper (amount mod h) t ((h, amount/h) :: acc)) else (helper amount t acc))
  in helper amount denominations [];;

(* scch 32 d1;;
- : (int * int) list = [(2, 1); (10, 1); (20, 1)]
scch 92 d1;;
- : (int * int) list = [(2, 1); (20, 2); (50, 1)]*)