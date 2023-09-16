let increment x = x + 1;;
let b=1 in 2*b;;(*b is not bound out side because of scope.*)
let avg = (fun x y -> (x +. y) /. 2.0 );;
let id x = x;;
let id_int' :int -> int = id (*for integer identity function only*)
let id' : 'a -> 'a = fun x -> x + 1

(*
( + ) 1 3;;
- : int = 4
( * );;
- : int -> int -> int = <fun>
(=);;
- : 'a -> 'a -> bool = <fun>
1 3 ( + );;
Error: This expression has type int
       This is not a function; it cannot be applied.
( ^ );;
- : string -> string -> string = <fun>
max;;
- : 'a -> 'a -> 'a = <fun>
min;;
- : 'a -> 'a -> 'a = <fun>
3 <^> 4;;
- : int = 4
( @@ );;
- : ('a -> 'b) -> 'a -> 'b = <fun>
( @@ ) succ (2*19);;
- : int = 39
square(succ 5);;
- : int = 36
5 |> succ |> square |> succ;;
- : int = 37
( |> );;
- : 'a -> ('a -> 'b) -> 'b = <fun>
65/60;;
- : int = 1
65 mod 60;;
- : int = 5
"shubham".[3];;
- : char = 'b'
String.sub;;
- : string -> int -> int -> string = <fun>
String.sub "shubham" 1 3;;
- : string = "hub"
"hi" == "hi";; physical equality
- : bool = false 
"hi" = "hi";; structural equality
- : bool = true
ignore;;
- : 'a -> unit = <fun>
let ignore x = ();;
val ignore : 'a -> unit = <fun>
let ignore _ = ();;
val ignore : 'a -> unit = <fun>
let print_stat name num =
print_string name;
print_string ": ";
print_float num;
print_newline ();;
val print_stat : string -> float -> unit = <fun>
print_stat "shubham" 35.0;;
shubham: 35.
- : unit = ()
let print_stat name num =
Printf.printf "%s: %F\n%!" name num;;
val print_stat : string -> float -> unit = <fun>
print_stat "shubham" 35.0;;
shubham: 35.
- : unit = ()
let string_of_stat name num =
Printf.sprintf "%s: %F" name num;;
val string_of_stat : string -> float -> string = <fun>
string_of_stat "shubham" 35.0 ;;
- : string = "shubham: 35."
*)
let ( <^> ) x y = max x y;;
let square x = x*x;;
( |> );;
let rec count n acc = if n = 0 then acc else count (n-1) (1+acc)
let count_reccursion n = count n 0;;
let _ = print_endline "Hello, world!"