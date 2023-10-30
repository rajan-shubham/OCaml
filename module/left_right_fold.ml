let rec fold_left f acc lst = match lst with
|[] -> acc
|h::t -> fold_left f (f acc h) t;;

let rec fold_right f lst acc = match lst with
|[] -> acc
|h::t -> f h (fold_right f t acc);;
