let rec fib n = if n < 2 then 1 else fib (n - 1) + fib (n - 2);;
(* To be precise, its running time turns out to be O(si^n), where <si> is the golden ratio,(1+5^(1/2) / 2) . *)


(* If we record Fibonacci numbers as they are computed, we can avoid this redundant work. The idea is that whenever we compute f n, we store it in a table indexed by n. In this case the indexing keys are integers, so we can implement this table using an array: *)

let fibm n =
  let memo : int option array = Array.make (n + 1) None in
  let rec f_mem n =
    match memo.(n) with
    | Some result -> (* computed already *) result
    | None ->
        let result =
          if n < 2 then 1 else f_mem (n - 1) + f_mem (n - 2)
        in
        (* record in table *)
        memo.(n) <- Some result;
        result
  in
  f_mem n