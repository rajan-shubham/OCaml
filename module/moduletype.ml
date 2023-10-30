module type Fact = sig
  (*[fact n] is [n] factorial. *)
  val fact : int -> int
end

module RecursiveFact : Fact = struct
  let rec fact n = if n = 0 then 1 else n * fact (n-1)
end

(* module NotFact : Fact = struct
  let inc x = x + 1
end *)

module TailRecursiveFact : Fact = struct
  let rec fact_aux n acc = 
    if n = 0 then acc else
      fact_aux (n - 1) (n * acc)
  
  let fact n = 
    fact_aux n 1
end