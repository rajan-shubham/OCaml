(* which taken amount and a list of denominations (in descending order) using which you need to construct the given amount. A given amount can be produced using different combinations of the provided denominations. Your function needs to output the total number of possible ways of producing the given amount.
*)

let rec cch amount demonations = 
  if amount<0 then failwith "Invalid input"
  else if amount = 0 then 1 else 
    match demonations with 
    |[] -> 0 
    | h::t -> if amount>=h then (cch (amount-h) demonations) + (cch amount t) else (cch amount t);;
