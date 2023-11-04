(* Functors are "functions" on modules*)
(* A Functor really is just a module level function , It's a kind of function that can take in a module as input & produce a module as output*)
module type X = sig
  val x : int
end

module A : X = struct
  let x = 0
end

module IncX (M : X) = struct
  let x = M.x + 1
end
module IncX = functor (M : X) -> struct
  let x = M.x + 1
end
(* IncX(A);;
Error: Unbound constructor IncX
struct let x = 0 end ;;
Error: Syntax error
module B = IncX(A);;
module B : sig val x : int end
let one = B.x;;
val one : int = 1
module C = IncX(B);;
module C : sig val x : int end
let two = C.x;;
val two : int = 2 *)
