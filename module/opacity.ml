(* Opacity
When implementing a module, you might sometimes have helper functions that you don’t want to expose to clients of the module. *)
module Math = struct
  (** [fact_aux n acc] is [n! * acc]. *)
  let rec fact_aux n acc =
    if n = 0 then acc else fact_aux (n - 1) (n * acc)

  (** [fact n] is [n!]. *)
  let fact n = fact_aux n 1
end;;
(* module Math :
  sig val fact_aux : int -> int -> int val
fact : int -> int end *)
(* Math.fact 5;;
- : int = 120 *)
let factorial10 = 
  let open Math in 
  fact 10;;
(* val factorial10 : int = 3628800 *)


module type MATH = sig
  (** [fact n] is [n!]. *)
  val fact : int -> int
end

module Math : MATH = struct
  (** [fact_aux n acc] is [n! * acc]. *)
  let rec fact_aux n acc =
    if n = 0 then acc else fact_aux (n - 1) (n * acc)

  let fact n = fact_aux n 1
end
(* let fact7 =
  let open Math in
  fact 7;;
  val fact7 : int = 5040 *)
