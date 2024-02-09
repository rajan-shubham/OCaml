open Mazesolver.Mazesolv
(* Put the appropriate call to the 'run' function (that you wrote in
   mazesolv.ml in ../lib folder) to execute your program.

   NOTE: No other function should be defined in this file *)
    
let () = (* TODO *)
    usage ();
    match get_parameters () with
    | (fname, row, col) -> run (fname, row, col)

    

