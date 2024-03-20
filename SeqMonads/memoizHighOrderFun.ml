(* let’s use higher-order functions to memoize any function. First, consider the case of memoizing a non-recursive function (f). In that case we simply need to create a hash table that stores the corresponding value for each argument that (f) is called with (and to memoize multi-argument functions we can use currying and uncurrying to convert to a single argument function). *)

let memo f =
  let h = Hashtbl.create 11 in
  fun x ->
    try Hashtbl.find h x
    with Not_found ->
      let y = f x in
      Hashtbl.add h x y;
      y;;
(*  *)

let mult2 x = x * 2;; 
(* val mult2 : int -> int = <fun> *)

(*  memo mult2 4;;
- : int = 8 *)

(* For recursive functions, however, the recursive call structure needs to be modified. This can be abstracted out independent of the function that is being memoized: *)
let memo_rec f =
  let h = Hashtbl.create 16 in
  let rec g x =
    try Hashtbl.find h x
    with Not_found ->
      let y = f g x in
      Hashtbl.add h x y;
      y
  in
  g;;

(* Now we can slightly rewrite the original fib function above using this general memoization technique: *)
let fib_memo =
  let fib self n =
    if n < 2 then 1 else self (n - 1) + self (n - 2)
  in
  memo_rec fib;;

(* fib_memo 30;;
- : int = 1346269 *)