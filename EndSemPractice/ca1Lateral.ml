(*CA1 (Lateral) *)
(*Q1- [Marks: 7]
You are given the following month type:

type month = Jan | Fab | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec;;

Define a function valid_date that takes a month type m and n integer d, and returns true when d and m from a vaild date. A valid date has a month data type, and the day must be a number that is between 1 and the minimum number of days in that month, inclusive. for example, if the month is Jan, then the day is between 1 and 31, inclusive, whereas if the month is Feb, then the day is between 1 and 28, inclusive.

Focus on making your function in as few lines as possible.
Q2- [Marks:6]
Write the type of each of the following functions: 
(*
let  p  x  y  z = if  x  then  y  else  z 
let  q  x  =  if  x  then  x  else  x
let  r   x   y =  if  x  then  some   (2 * y)  else  None
*)
Note that you MUST use the type of the function in the same formet as shown by the ocaml toplevel (utop).

Q3- [Marks6]
write a function borders that takes a list of integers ilist and returns a tuple option [(int * int)option] containing the first and last elements of the provided list if the list is non-empty. If the list contains only a single elements, then the first and last elements are the same.If the list is empty,then your code should return None.

Q4- [Marks:6]
Write a functon drop : int -> 'a list -> 'a list option such that drop n lst returns all but the first n elements if lst.
If lst has fewer than n elements, return None.
*)
(* Solution to Q1*)

type month = Jan | Fab | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec;;
let valid_date m d = match m with
    | Jan | Mar | May | Jul | Aug | Oct | Dec -> d<32 && d>0
    | Fab -> d<29 && d>0
    | _ -> d<31 && d>0
;;
let ansQ1 = valid_date Fab 23;;

(* Solution to Q2*)

(* val p: bool -> 'a -> 'a -> 'a *)
(* val q: bool -> bool *)
(* val r: bool -> int -> int option *)

(* Solution to Q3*)

let borders ilist = 
match ilist with 
  | [] -> None
  | h::[] -> Some (h,h)
  | h::t ->
    let rec last lst = match lst with
      | h::[] -> h
      | h::t -> last t
      | _ -> failwith "Unexpected failure"   (* this should never happen *)
    in Some (h, (last t))
;;

(* Solution to Q4*)
let rec drop n lst = match (n, lst) with
  | 0,[] -> Some []
  | n,[] -> None 
  | 0,lst -> Some lst
  | n, h::t -> drop (n-1) t
;; 