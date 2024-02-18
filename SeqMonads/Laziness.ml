(** An ['a sequence] is an infinite list of values of type ['a].
    AF: [Cons (x, f)] is the sequence whose head is [x] and tail is [f ()].
    RI: none. *)
    type 'a sequence = Cons of 'a * (unit -> 'a sequence)

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
(**)

(** [square <a; b; c; ...>] is [<a * a; b * b; c * c; ...]. *)
let rec square (Cons (h, t)) =
  Cons (h * h, fun () -> square (t ()))

(** [sum <a1; a2; a3; ...> <b1; b2; b3; ...>] is
    [<a1 + b1; a2 + b2; a3 + b3; ...>] *)
let rec sum (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons (h1 + h2, fun () -> sum (t1 ()) (t2 ()))
(**)

(** [map f <a; b; c; ...>] is [<f a; f b; f c; ...>] *)
let rec map f (Cons (h, t)) =
  Cons (f h, fun () -> map f (t ()))

(** [map2 f <a1; b1; c1;...> <a2; b2; c2; ...>] is
    [<f a1 b1; f a2 b2; f a3 b3; ...>] *)
let rec map2 f (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons (f h1 h2, fun () -> map2 f (t1 ()) (t2 ()))

let square' = map (fun n -> n * n)
let sum' = map2 ( + )

let rec nats = Cons (0, fun () -> map (fun x -> x + 1) nats);;

take 10 nats;;

let rec fibs =
  Cons (1, fun () ->
    Cons (1, fun () ->
      sum fibs (tl fibs)));;

take 10 fibs;;
(*- : int list = [1; 1; 2; 3; 5; 8; 13; 21; 34; 55]*)
(*take 30 fibs;;
- : int list =
[1; 1; 2; 3; 5; 8; 13; 21; 34; 55; 89; 144; 233; 377; 610; 987; 1597; 2584;
 4181; 6765; 10946; 17711; 28657; 46368; 75025; 121393; 196418; 317811; 514229;
 832040]*)

(*If we try to get the 30th Fibonacci number, it will take a long time to compute:*)
(*let fib30long = take 30 fibs |> List.rev |> List.hd;;
val fib30long : int = 832040*)


(*But if we wrap evaluation of that with lazy, it will return immediately, because the evaluation of that number has been suspended:*)
(*let fib30lazy = lazy (take 30 fibs |> List.rev |> List.hd);;
val fib30lazy : int lazy_t = <lazy>*)


(*Later on we could force the evaluation of that lazy value, and that will take a long time to compute, as did fib30long:*)
(*let fib30 = Lazy.force fib30lazy;;
val fib30 : int = 832040*)


(*But if we ever try to recompute that same lazy value, it will return immediately, because the result has been memoized:*)
(*let fib30 = Lazy.force fib30lazy;;
val fib30 : int = 832040*)

(*Nonetheless, we still haven’t totally succeeded. That particular computation of the 30th Fibonacci number has been memoized, but if we later define some other computation of another it won’t be sped up the first time it’s computed:
   
let fib29long = take 29 fibs |> List.rev |> List.hd;;
val fib29long : int = 514229

What we really want is to change the representation of sequences itself to make use of lazy values.*)