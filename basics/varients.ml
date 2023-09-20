type day = Sun | Mon | Tue | Wed | Thu | Fri | Sat
let  d = Tue 
let int_of_day d = match d with 
|Sun -> 1
|Mon -> 2
|Tue -> 3
|Wed -> 4
|Thu -> 5
|Fri -> 6
|Sat -> 7
(*type day = Sun | Mon | Tue | Wed | Thu | Fri | Sat
val d : day = Tue
val int_of_day : day -> int = <fun>
d;;
- : day = Tue
int_of_day d;;
- : int = 3
match (1.,2.,3.) with (x,y,z) -> x+.y+.z;;
- : float = 6.
   *)