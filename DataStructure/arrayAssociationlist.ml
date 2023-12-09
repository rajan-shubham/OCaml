let la1 = [| [(0,"shubham");(1,"aman")]; [(2,"prince");(3,"ajat")]; [(4,"anurag")] |];;
(* val la1 : (int * string) list array =
  [|[(0, "shubham"); (1, "aman")]; [(2, "prince"); (3, "ajat")];
    [(4, "anurag")]|] *)
(* la1.(2);;
- : (int * string) list = [(4, "anurag")] *)
    


type ('k, 'v) t = { mutable buckets: ('k * 'v) list array };;
(* type ('k, 'v) t = { mutable buckets : ('k * 'v) list array; } *)
 

type water = { mutable color: string };;
(*type water = { mutable color : string; }
*)
let watercolor = {color= "blue water"};;
(* val watercolor : water = {color = "blue water"} *)
(*watercolor.color;;
- : string = "blue water"
*)
(*watercolor.color <- "red water";;
- : unit = ()
*)
(*watercolor.color;;
- : string = "red water"*)