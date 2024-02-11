let () = print_endline "Function Factorial ->"
let () = Printf.printf "Enter an Integer : ";
  let factnum = read_int() in
  Printf.printf " The Factorial is : %d" (Facto.factorial factnum)