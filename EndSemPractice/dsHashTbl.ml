let ( -- ) i j =
let rec from i j l = if i > j then l else from i (j - 1) (j :: l)
in from i j [];;

let tab = Hashtbl.create 16

let ints = List.map (fun x -> (x, string_of_int x)) (1 -- 31)

let () = List.iter (fun (k, v) -> Hashtbl.add tab k v) ints

let () = assert (Hashtbl.find tab 1 = "1")
let () = assert ((try Hashtbl.find tab 0 with Not_found -> "") = "");;
(* val tab : (int, string) Hashtbl.t = <abstr>
val ints : (int * string) list =
  [(1, "1"); (2, "2"); (3, "3"); (4, "4"); (5, "5");
   (6, "6"); (7, "7"); (8, "8"); (9, "9"); (10, "10");
   (11, "11"); (12, "12"); (13, "13"); (14, "14");
   (15, "15"); (16, "16"); (17, "17"); (18, "18");
   (19, "19"); (20, "20"); (21, "21"); (22, "22");
   (23, "23"); (24, "24"); (25, "25"); (26, "26");
   (27, "27"); (28, "28"); (29, "29"); (30, "30");
   (31, "31")] *)

let x = 5 in
let y = 10 in
try
  assert (x > y);
  print_endline "x is greater than y"
with
| Assert_failure (file, line, column) ->
  Printf.printf "Assertion failed at line %d, column %d in file %s\n" line column file
;;
(* Assertion failed at line 4, column 2 in file //toplevel//
- : unit = () *)

let bindings h =
 Hashtbl.fold (fun k v acc -> (k, v) :: acc) h [];;
(* val bindings : ('a, 'b) Hashtbl.t -> ('a * 'b) list = <fun> *)

(* let bindoftab = bindings tab;;
val bindoftab : (int * string) list =
  [(15, "15"); (22, "22"); (18, "18"); (19, "19");
   (27, "27"); (17, "17"); (1, "1"); (10, "10"); (26, "26");
   (28, "28"); (11, "11"); (23, "23"); (25, "25"); (9, "9");
   (31, "31"); (4, "4"); (5, "5"); (12, "12"); (13, "13");
   (3, "3"); (7, "7"); (30, "30"); (8, "8"); (16, "16");
   (24, "24"); (14, "14"); (21, "21"); (29, "29"); (2, "2");
   (6, "6"); (20, "20")] *)

(* Hashtbl.stats tab;;
- : Hashtbl.statistics =
{Hashtbl.num_bindings = 31; num_buckets = 16;
 max_bucket_length = 4; bucket_histogram = [|3; 3; 3; 6; 1|]} *)