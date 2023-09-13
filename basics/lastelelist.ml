let rec lastelement lst = match lst with
    | [] -> None
    |a::[] -> Some a
    |h::t -> lastelement t;;
type p =string*string;;
let rec last_two lst =
  match lst with
  | [] -> None
  | [x] -> None
  | [x; y] -> Some (x, y)
  | _ :: rest -> last_two rest;;