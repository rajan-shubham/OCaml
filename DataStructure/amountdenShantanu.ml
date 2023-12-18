(* Assignment problem along with instructions appears towards the end
 of this file *)
(* Possible solutions to some problems given in previous classes. Just
 remember that these are only possible solutions for you to study
 and get some ideas from. There can be many other ways to solve
 these problems, possibly more efficient ones.*)
(* [cch amount denominations] returns all the possible ways in which
 [amount] can be produced using the [denominations] list *)
let cch (amount:int) (denominations: int list): int list list =
 let rec helper a d acc =
 if a<0 then failwith "Invalid Input"
 else if a=0 then [acc]
 else match d with
 | [] -> [[]]
 | h::t ->
 if a>=h
 then (helper (a-h) d (h::acc)) @ (helper a t acc)
 else helper a t acc
 in helper amount denominations [] |> List.filter (fun x -> x<>[]);;
let rec stack2list s = match Stack.pop_opt s with
 | None -> []
 | Some v -> v::stack2list s;;


(* A stack based implementation of cch *)
let cchstack (amount:int) (denominations:int list): int list list =
 let res = Stack.create () in
 let rec cch a d acc =
 if a<0 then failwith "Invalid Input"
 else if a=0 then (Stack.push acc res)
 else match d with
 | [] -> ()
 | h::t -> (if a>=h
 then ((cch (a-h) d (h::acc));(cch a t acc))
 else (cch a t acc)) in
 cch amount denominations []; stack2list res;;
