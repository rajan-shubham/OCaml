type 'a mylist = Nil | Cons of 'a * 'a mylist
(*type 'a mylist = Nil | Cons of 'a * 'a mylist*)

type 'a sequence = Cons of 'a * 'a sequence
(*type 'a sequence = Cons of 'a * 'a sequence*)

let rec from n = Cons (n, from (n + 1))
(*val from : int -> int sequence = <fun>*)

let nats = from 0
(*Stack overflow during evaluation (looping recursion?).*)

(*As before, that definition attempts to go off and compute the entire infinite sequence of naturals.

What we need is a way to pause evaluation, so that at any point in time, only a finite approximation to the infinite sequence has been computed.*)

let f1 = failwith "oops"
let f2 = fun x -> failwith "oops"

(*The definition of f1 immediately raises an exception, whereas the definition of f2 does not. Why? Because f2 wraps the failwith inside an anonymous function. Recall that, according to the dynamic semantics of OCaml, functions are already values. So no computation is done inside the body of the function until it is applied. That’s why f2 () raises an exception.*)

(*We can use this property of evaluation—that functions delay evaluation—to our advantage in defining sequences: let’s wrap the tail of a sequence inside a function. Since it doesn’t really matter what argument that function takes, we might as well let it be unit. A function that is used just to delay computation, and in particular one that takes unit as input, is called a thunk.*)

(** An ['a sequence] is an infinite list of values of type ['a].
    AF: [Cons (x, f)] is the sequence whose head is [x] and tail is [f ()].
    RI: none. *)
type 'a sequence = Cons of 'a * (unit -> 'a sequence)
(*type 'a sequence = Cons of 'a * (unit -> 'a sequence)*)

let rec from n = Cons (n, fun () -> from (n + 1))
let nats = from 0
(*val from : int -> int sequence = <fun>
   val nats : int sequence = Cons (0, <fun>)*)

(** [hd s] is the head of [s] *)
let hd (Cons (h, _)) = h
(*val hd : 'a sequence -> 'a = <fun>*)

(** [tl s] is the tail of [s] *)
let tl (Cons (_, t)) = t ()
(*val tl : 'a sequence -> 'a sequence = <fun>*)

(** [take n s] is the list of the first [n] elements of [s] *)
let rec take n s =
  if n = 0 then [] else hd s :: take (n - 1) (tl s)
(*val take : int -> 'a sequence -> 'a list = <fun>*)

(** [drop n s] is all but the first [n] elements of [s] *)
let rec drop n s =
  if n = 0 then s else drop (n - 1) (tl s)
(*val drop : int -> 'a sequence -> 'a sequence = <fun>*)

take 10 nats;;
(*- : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9]*)