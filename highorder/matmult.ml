(*let matmult m1 m2 = if not(compatible m1 m2) then failwith "incompatible matrices" 
else let rec matmult' mx my = match mx with
	|[] -> []
	|h::t -> (matrowprod h my) :: (matmult' t my) in matmult' m1 (transpose m2);;

let compatible m1 m2 =
	(List.length(List.hd m1)) = (List.length m2);;

let rec matrowprod v m = match m with
	|[] -> []
	|h::t -> ((vecprod v h)::matrowprod v t);;

let rec transpose = function
	|[] -> []
	|[]::_ -> []
	|m -> (List.map List.hd m)::transpose (List.map List.tl m);;

let rec vecprod v1 v2 = match (v1,v2) with
	|[],[] -> 0
	|((h1::t1),(h2::t2)) -> (h1 * h2) + vecprod t1 t2;;*)

	
let compatible m1 m2 =
	(List.length(List.hd m1)) = (List.length m2);;
	
let rec transpose = function
	|[] -> []
	|[]::_ -> []
	|m -> (List.map List.hd m)::transpose (List.map List.tl m);;
	
let rec vecprod v1 v2 = match (v1,v2) with
	|[],[] -> 0
	|((h1::t1),(h2::t2)) -> (h1 * h2) + vecprod t1 t2;;
	
let rec matrowprod v m = match m with
	|[] -> []
	|h::t -> ((vecprod v h)::matrowprod v t);;
	
let matmult m1 m2 = if not(compatible m1 m2) then failwith "incompatible matrices" 
else let rec matmult' mx my = match mx with
	|[] -> []
	|h::t -> (matrowprod h my) :: (matmult' t my) in matmult' m1 (transpose m2);;
