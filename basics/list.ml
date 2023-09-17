(* 
[[1+1];[3-4];[3*4]];;
- : int list list = [[2]; [-1]; [12]] 

type student = {
name : string;
year : int;
};;
type student = { name : string; year : int; }
let rbg = {
name = "Ruth Bader";
year = 1954;}
;;
val rbg : student = {name = "Ruth Bader"; year = 1954}
rbg.name;;
- : string = "Ruth Bader"
{rbg with name = "Ruth Bader Gishburg"};;
- : student = {name = "Ruth Bader Gishburg"; year = 1954}

type time = int*int*string;;
type time = int * int * string
let t:time= (8,15,"am");;
val t : time = (8, 15, "am")
type point=float*float;;
type point = float * float
let p:point = (5.,3.5);;
val p : point = (5., 3.5)
fst;;
- : 'a * 'b -> 'a = <fun>
snd;;
- : 'a * 'b -> 'b = <fun>
snd p;;
- : float = 3.5
*)