let rec first lst = match lst with
|[] -> 0
|h::t -> h;;

let fibonacci n = 
  let rec iter n acc1 acc2 =
    match n with
    |0 -> acc1
    |1 -> acc2
    |_ -> iter (n-1) acc2 (acc1 + acc2)
  in iter n 0 1