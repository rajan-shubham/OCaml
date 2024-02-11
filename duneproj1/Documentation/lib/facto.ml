let rec fact n acc = 
	if n=0 then acc else fact (n-1) (n*acc)
let factorial n = fact n 1;;