(* Write ocaML code for the well known higher order functions fold_left and fold_right. *)
let rec fold_left f acc lst =
  match lst with
  | [] -> acc
  | hd :: tl -> fold_left f (f acc hd) tl

let rec fold_right f lst acc =
  match lst with
  | [] -> acc
  | hd :: tl -> f hd (fold_right f tl acc)
;;
let sum = fold_left (+) 0 [1; 2; 3; 4; 5];;    (* Computes the sum of the list *)
(* ((((((((0 ^ "1") ^ "2") ^ "3") ^ "4") ^ "5") ^ "6") ^ "7") *)

let concat = fold_right (fun x acc -> x ^ acc) ["a"; "b"; "c"; "d"] "";;    (* Concatenates the list *)
(* ("1" ^ ("2" ^ ("3" ^ ("4" ^ ("5" ^ ("6" ^ ("7" ^ "0"))))))) *)

(* Looking at the shape of the two computations from above fold_left and fold_right, which of fold_left and fold_right should be preferred for a non-lazy functional programming language such as ocaML? Justify your answer *)
(* In a non-lazy functional programming language like OCaml, where eager evaluation is the norm, the choice between `fold_left` and `fold_right` can have implications for performance and stack usage due to the order of evaluation.

In general, `fold_left` is preferred over `fold_right` in non-lazy functional programming languages like OCaml for several reasons:

1. **Tail Recursion Optimization**: `fold_left` lends itself more naturally to tail recursion optimization. OCaml's compiler can optimize tail-recursive functions, which means that `fold_left` can typically be implemented more efficiently without risking stack overflow errors, especially for large lists.

2. **Better Cache Performance**: `fold_left` processes elements of the list in a left-to-right order, which matches the natural order of how data is stored in memory. This can lead to better cache performance compared to `fold_right`, which processes elements in a right-to-left order, potentially leading to less efficient memory access patterns.

3. **Predictable Evaluation Order**: `fold_left` evaluates elements of the list in a predictable left-to-right order, which can make reasoning about the behavior of the function easier and can lead to code that is easier to understand and maintain.

4. **Avoids Nested Function Calls**: `fold_right` typically results in nested function calls due to its right-associative nature, which can introduce additional overhead and potentially reduce performance, especially for large lists.

However, it's important to note that the choice between `fold_left` and `fold_right` ultimately depends on the specific requirements of the problem at hand and the behavior desired by the programmer. There are situations where `fold_right` may be more appropriate, such as when dealing with infinite lists or when the desired behavior naturally aligns with a right-to-left evaluation order. Nonetheless, in most cases, `fold_left` is the preferred choice for its efficiency and predictability. *)

(* Write an OCaml function next that works as follows:
[] -> [1]
[a]-> [a, a]
[a, b, c] -> [a, (a+b), (b+c), c]
[a, b, ..., c, d] -> [a, (a+b), ..., (c+d), d]  
Here a, b, c, d, etc. are positive integers. Given the input as represented by the list on the left side of - >, the output is as given on the right side of - >. *)
let rec next lst =
  match lst with
  | [] -> [1]
  | [a] -> [a; a]
  | hd1 :: hd2 :: tl ->
    let rec compute_next acc lst =
      match lst with
      | [] -> List.rev acc
      | [x] -> List.rev (x :: acc)
      | hd1 :: hd2 :: tl ->
        let sum = hd1 + hd2 in
        compute_next (sum :: acc) (hd2 :: tl)
    in
    hd1 :: compute_next [hd1 + hd2] (hd2 :: tl)
;;
(* Test cases *)
let () =
  let test_cases = [[1]; [1; 2; 3]; [1; 2; 3; 4]; [1; 2; 3; 4; 5]] in
  List.iter (fun lst -> 
    let result = next lst in
    Printf.printf "Input: [%s] -> Output: [%s]\n"
      (String.concat "; " (List.map string_of_int lst))
      (String.concat "; " (List.map string_of_int result))
  ) test_cases
;;

(* This next function follows the pattern you described:

For an empty list, it returns [1].
For a list with a single element a, it returns [a; a].
For a list with more than one element [a; b; c; ...; d], it returns [a; (a+b); (b+c); ...; (c+d); d].
The function uses pattern matching to handle different cases of the input list. It recursively computes the next elements by summing adjacent pairs and constructing the result list accordingly. *)

(* Q.3.B(b) Write an OCAML higher order function n_times which takes as inputs a function f, a list v, and a non-negative integer n. It applies f to v n times. Assume that f takes a list of type v and returns another list of the same type. *)
let rec n_times f v n =
  if n <= 0 then
    v
  else
    n_times f (f v) (n - 1)

(* Test cases *)
let add_one lst = List.map ((+) 1) lst

let () =
  let initial_list = [1; 2; 3] in
  let result = n_times add_one initial_list 3 in
  Printf.printf "Result after applying add_one 3 times: [%s]\n"
    (String.concat "; " (List.map string_of_int result))
;;

(* Q 3.B(c) What would be the output of the following function call:
n_times next [] 5; *)
[1; 4; 6; 4; 1]
(* This output indicates that `n_times` applied the `next` function five times to the initial empty list `[]`.

- After the first application of `next`, the output is `[1]`.
- After the second application, the output is `[1; 2; 3]`.
- After the third application, the output is `[1; 2; 3; 4; 5]`.
- After the fourth application, the output is `[1; 4; 6; 4; 1]`.

So, the output you provided indicates that the `next` function has a different behavior than described earlier. 

The output `[1; 4; 6; 4; 1]` suggests that the `next` function calculates the next element by summing adjacent pairs, which is a different behavior from the Fibonacci-like sequence described earlier. 

It seems that the `next` function provided has been defined to generate a sequence different from the one described in the previous context. *)
