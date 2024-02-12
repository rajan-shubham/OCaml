let rec from n = Cons (n, fun () -> from (n + 1))
let nats = from 0

(** [hd s] is the head of [s] *)
let hd (Cons (h, _)) = h

(** [tl s] is the tail of [s] *)
let tl (Cons (_, t)) = t ()

(** [take n s] is the list of the first [n] elements of [s] *)
let rec take n s =
  if n = 0 then [] else hd s :: take (n - 1) (tl s)

(** [drop n s] is all but the first [n] elements of [s] *)
let rec drop n s =
  if n = 0 then s else drop (n - 1) (tl s)

take 10 nats;;
(*- : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9]*)

(** [square <a; b; c; ...>] is [<a * a; b * b; c * c; ...]. *)
let rec square (Cons (h, t)) =
  Cons (h * h, fun () -> square (t ()))

(** [sum <a1; a2; a3; ...> <b1; b2; b3; ...>] is
    [<a1 + b1; a2 + b2; a3 + b3; ...>] *)
let rec sum (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons (h1 + h2, fun () -> sum (t1 ()) (t2 ()))

let rec fibs =
  Cons (1, fun () ->
    Cons (1, fun () ->
      sum fibs (tl fibs)));;

(*val fibs : int sequence = Cons (1, <fun>)*)

take 10 fibs;;
(*- : int list = [1; 1; 2; 3; 5; 8; 13; 21; 34; 55]*)
