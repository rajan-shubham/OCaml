(** [square <a; b; c; ...>] is [<a * a; b * b; c * c; ...]. *)
let rec square (Cons (h, t)) =
  Cons (h * h, fun () -> square (t ()))

(** [sum <a1; a2; a3; ...> <b1; b2; b3; ...>] is
    [<a1 + b1; a2 + b2; a3 + b3; ...>] *)
let rec sum (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons (h1 + h2, fun () -> sum (t1 ()) (t2 ()))

(*val square : int sequence -> int sequence = <fun>*)
(*val sum : int sequence -> int sequence -> int sequence = <fun>*)

(*let nats10 = from 10;;
val nats10 : int sequence = Cons (10, <fun>)
square nats;;
- : int sequence = Cons (0, <fun>)
square nats10;;
- : int sequence = Cons (100, <fun>)
sum nats nats10;;
- : int sequence = Cons (10, <fun>)*)

(** [map f <a; b; c; ...>] is [<f a; f b; f c; ...>] *)
let rec map f (Cons (h, t)) =
  Cons (f h, fun () -> map f (t ()))

(** [map2 f <a1; b1; c1;...> <a2; b2; c2; ...>] is
    [<f a1 b1; f a2 b2; f a3 b3; ...>] *)
let rec map2 f (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons (f h1 h2, fun () -> map2 f (t1 ()) (t2 ()))

let square' = map (fun n -> n * n)
let sum' = map2 ( + );;

(*val map : ('a -> 'b) -> 'a sequence -> 'b sequence = <fun>
val map2 : ('a -> 'b -> 'c) -> 'a sequence -> 'b sequence -> 'c sequence =
  <fun>
val square' : int sequence -> int sequence = <fun>
val sum' : int sequence -> int sequence -> int sequence = <fun>*)

let rec nats = Cons (0, fun () -> map (fun x -> x + 1) nats)
(*val nats : int sequence = Cons (0, <fun>)*)
(*take 10 nats;;
- : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9]*)

(*Why does this work? Intuitively, nats is <0; 1; 2; 3; ...>, so mapping the increment function over nats is <1; 2; 3; 4; ...>. If we cons 0 onto the beginning of <1; 2; 3; 4; ...>, we get <0; 1; 2; 3; ...>, as desired. The recursive value definition is permitted, because we never attempt to use nats until after its definition is finished. In particular, the thunk delays nats from being evaluated on the right-hand side of the definition.

Here’s another clever definition. Consider the Fibonacci sequence <1; 1; 2; 3; 5; 8; ...>. If we take the tail of it, we get <1; 2; 3; 5; 8; 13; ...>. If we sum those two sequences, we get <2; 3; 5; 8; 13; 21; ...>. That’s nothing other than the tail of the tail of the Fibonacci sequence. So if we were to prepend [1; 1] to it, we’d have the actual Fibonacci sequence. That’s the intuition behind this definition:*)

let rec fibs =
  Cons (1, fun () ->
    Cons (1, fun () ->
      sum fibs (tl fibs)))
(*val fibs : int sequence = Cons (1, <fun>)*)

(*take 10 fibs;;
- : int list = [1; 1; 2; 3; 5; 8; 13; 21; 34; 55]*)

(* fibs is very inefficient for 100th term of fibonacci , so a new thing Laginess is on the ground*)