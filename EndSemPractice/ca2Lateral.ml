(* (CA2 (Laterals)) *)
(* 
Q1. Write a function repeat that takes a function f, value x, and integer n and applies the function n many times. For example repeat f x 3 should return -> 
f ( f ( f x)).
Q2. Write a function collect that does the same as Q1 but also collects all the outputs into a list and returns the list. For example collect f x 3 should return -> 
[(f ( f ( f x))); (f(f x)); (f x); x]

Q3. Write a function that returns the next prime number and use it to create a list of first 20 prime numbers.
*)

(* (Solutions)
(Q1 Solutions) *)

let rec repeat f x n = 
if n = 0 then x else repeat f (f x) (n -1);;

(* (Q2 Solutions) *)

let rec collect f x n = 
if n = 0 then [x] else (f x) :: collect f (f x) (n -1);;

(* (Q3 Solutions) *)

let is_prime x = 
if x = 2 || x = 3 then true else 
if x < 2 then false else 
let rec helper x n = 
if n < x then 
if x mod n = 0 then false else helper x (n + 1)
else true in helper x 2;;
let rec from n si = 
if si = 0 then [] else 
if is_prime n then n :: from (n + 1) (si - 1) else from (n +1) si ;; 
let twenty_prime = from 0 20;;

(* let twenty_prime = from 0 20;;
val twenty_prime : int list =
  [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71]
 is_prime 35;;
- : bool = false
 is_prime 37;;
- : bool = true
 let twenty_prime = from 1 20;;
val twenty_prime : int list =
  [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71]
 let twenty_prime = from 2 20;;
val twenty_prime : int list =
  [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71]
 let twenty_prime = from 3 20;;
val twenty_prime : int list =
  [3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71; 73] *)