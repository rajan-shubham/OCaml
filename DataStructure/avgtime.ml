module WriterMonad = struct
  type 'a t = { result: 'a; log: string list }

  let return a = { result = a; log = [] }

  let (>>=) m f =
    let { result; log } = m in
    let { result = new_result; log = new_log } = f result in
    { result = new_result; log = log @ new_log }

  let tell msg = { result = (); log = [msg] }

  let run m = m.result, m.log
end


let cch (amount:int) (denominations: int list): int list list =
  let rec helper a d acc =
  if a<0 then failwith "Invalid Input"
  else if a=0 then [acc]
  else match d with
  | [] -> [[]]
  | h::t ->
  if a>=h
  then (helper (a-h) d (h::acc)) @ (helper a t acc)
  else helper a t acc
  in helper amount denominations [] |> List.filter (fun x -> x<>[]);;

(**)
let rec stack2list s = match Stack.pop_opt s with
| None -> []
| Some v -> v::stack2list s;;


(* A stack based implementation of cch *)
let cchstack (amount:int) (denominations:int list): int list list =
let res = Stack.create () in
let rec cch a d acc =
if a<0 then failwith "Invalid Input"
else if a=0 then (Stack.push acc res)
else match d with
| [] -> ()
| h::t -> (if a>=h
then ((cch (a-h) d (h::acc));(cch a t acc))
else (cch a t acc)) in
cch amount denominations []; stack2list res;;

(* A more compact version of cchstack *)
let cchstack2 amount denominations =
  let (res:(int*int) list Stack.t) = Stack.create () in
  let rec cch a d acc =
  if a<0 then failwith "Invalid Input"
  else if a=0 then Stack.push acc res (* we are done *)
  else match d with| [] -> () (* solution not possible *)
  | h::t -> let q=a/h in
  (for i=1 to q; do
  cch (a-(h*i)) t ((h,i)::acc)
  done); (cch a t acc)
  in cch amount denominations []; stack2list res;;


let scch amount denominations =
let rec helper a d acc =
if a<0
then failwith "Invalid Input"
else if a=0
then acc
else match d with
| [] -> [] (* solution not possible *)
| h::t ->
(if a>=h
then helper (a mod h) t ((h,a/h)::acc)
else helper a t acc)
in helper amount denominations [];;


let time f x y =
  let start = Sys.time() in
  let stop = ignore(f x y);Sys.time() in
  stop -. start;;

let cch_writer (amount:int) (denominations: int list): int list list WriterMonad.t =
  let open WriterMonad in
  let rec helper a d acc =
    if a < 0 then failwith "Invalid Input"
    else if a = 0 then return [acc]
    else match d with
      | [] -> return [[]]
      | h::t ->
        if a >= h then
          (helper (a - h) d (h :: acc)) >>= fun res1 ->
          (helper a t acc) >>= fun res2 ->
          return (res1 @ res2)
        else
          helper a t acc
  in
  helper amount denominations [] >>= fun result ->
  tell "Coin change computation completed." >>= fun () ->
  return result;;

let cchstack_writer amount denominations =
  let open WriterMonad in
  let res = Stack.create () in
  let rec cch a d acc =
    if a < 0 then failwith "Invalid Input"
    else if a = 0 then (Stack.push acc res; return ())
    else match d with
      | [] -> return ()
      | h::t ->
        if a >= h then
          (cch (a - h) d (h :: acc)) >>= fun () ->
          (cch a t acc)
        else
          cch a t acc
  in
  cch amount denominations [] >>= fun () ->
  return (stack2list res);;

let () =
  let amount = 10 in
  let denominations = [1; 2; 5] in

  let result, log = WriterMonad.run (cch_writer amount denominations) in
  let result_str = List.map (fun lst -> String.concat ", " (List.map string_of_int lst)) result in
  Printf.printf "List based result: %s\n" (String.concat "; " result_str);
  Printf.printf "List based log: %s\n" (String.concat ", " log);

  let result_stack, log_stack = WriterMonad.run (cchstack_writer amount denominations) in
  let result_stack_str = List.map (fun lst -> String.concat ", " (List.map string_of_int lst)) result_stack in
  Printf.printf "Stack based result: %s\n" (String.concat "; " result_stack_str);
  Printf.printf "Stack based log: %s\n" (String.concat ", " log_stack);


(**)
type 'a writer = { value : 'a; log : string list }

let return a = { value = a; log = [] }

let bind m f =
  let result = f m.value in
  { result with log = m.log @ result.log }

let write_log msg = { value = (); log = [msg] }

let time_writer f x y =
  let start = Sys.time() in
  let stop = ignore (f x y); Sys.time () in
  { value = stop -. start; log = ["Function executed."] }
