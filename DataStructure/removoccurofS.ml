let s1 = ["hello";"hi";"hello";"hi";"hello";"hi";"hi";"hello";"hi";"hi"];;

(*Q1 making of remove
   which removes all occurance of s from los*)
let strMat s x = s <> x;;
let remove (s:string) (los:string list) : string list = List.filter (strMat s) los;;


(*Q2 making of remove2 
   which removes all occurance of string in ts from ss *)
let rec remove2 (ts: string list) (ss: string list) : string list = match ts with
|[] -> ss
|h::t -> remove2 t (remove h ss);;


(*Q3 making of make_histogram
   which finds out how many times each string in sl occurs in sl and returns a list of (string * int) where the int indicating how many times a particular string has appeared
   ["hello";"hello";"bye";"hello"] -> [("hello",3);("bye",1)]     *)
let rec count x lst = match lst with
|[] -> 0
|h::t -> if x = h then 1 + count x t else count x t;;

let rec make_histogram (st: string list) : (string * int) list = match st with
|[] -> []
|h::t -> (h,(count h st)) :: make_histogram (remove h t);;


(*Q4 making of make_histogram2*)
let rec make_histogram2 (st:string list) (ss:string list) : (string * int) list = match st with
|[] -> []
|h::t -> (h,(count h ss)) :: make_histogram2 (remove h t) ss;;