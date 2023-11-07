let print_and_add x y = print_int (x + y); print_newline (); x + y;;
(* print_and_add 5 6;;
11
- : int = 11 *)
(* ignore;;
- : 'a -> unit = <fun> *)
(* print_and_add 34 53 ; print_and_add 32 34;;
Line 1, characters 0-19:
Warning 10 [non-unit-statement]: this expression should have type unit.
Line 1, characters 0-19:
Warning 10 [non-unit-statement]: this expression should have type unit.
87
66
- : int = 66 *)
(* ignore (print_and_add 9 8 );print_and_add 1 3;;
17
4
- : int = 4 *)
