    open Readmaze

(** This file [mazesolv.ml] provides the [Mazesolv] module inside the
    [Mazesolver] module *)


(* NOTE: You have to complete the functions below with your own
   code. Parts you need to replace are the regions indicated with

   () (* TODO *)

   Replace those parts with your own code *)



(** [solvemaze maze (entryrow, entrycol)] tries to find an exit point
    starting from the entry point to the maze (which is a 2D matrix of
    0s and 1s) indicated by the cell [(entryrow, entrycol)], i.e.,
    [maze.(entryrow).(entrycol)].

    If no exit point is found, it returns [None], otherwise it returns
    [Some x] where [x] is a tuple indicating the found exit point. 

    If entry point provided is invalid (the cell is not open, i.e.,
    it's value is not 0), then it fails with [failwith "Invalid Entry
    Point"] *)
let solvemaze (maze:int array array) ((entryrow, entrycol):(int * int)): (int * int) option =
   (* TODO *)
    let res = Stack.create () in 
    let n = Array.length maze in 
    let a,b = entryrow, entrycol in 
    let outline x y = if x = 0 || y = 0 || x = n - 1 || y = n - 1 then true else false in
    let is_start x y = if x = a && y = b then true else false in
    let rec helper (x,y) acc = 
        try (  
            if maze.(x).(y) = 0 then 
                if (outline x y ) && ((is_start x y) = false) 
                then Stack.push ((x,y)::acc) res
                else ( 
                    maze.(x).(y) <- (-1);
                    (helper ((x+1),y) ((x,y)::acc));  
                    (helper ((x),y+1) ((x,y)::acc));
                    (helper ((x),y-1) ((x,y)::acc));
                    (helper ((x-1),y) ((x,y)::acc))
                )

            else () 
        )
        with Invalid_argument _ -> ()
    in helper (a,b) [];
    match Stack.pop res with
    | x -> Some (List.hd x)
    | exception Stack.Empty -> None


  


(** [usage ()] simply prints a message indicating how to use this
    program assuming the user has not invoked this program with the
    proper argument(s) *)
let usage () = 
  Printf.printf 
    "Invalid/Missing argument(s). Usage:\n%s <fname> <entry_row> \
     <entry_col>\nwhere <fname> is the name of the file containing the \
     maze in the required format, <entry_row> and <entry_col> is the \
     maze entry point.\n " Sys.argv.(0)



(** [get_parameters ()] reads the 3 parameters which the user is
    supposed to call this program with from the command line. The
    first argument is the filename containing the matrix representing
    the maze in the required format, the second and third arguments
    are supposed to be the row and column number for the entry point
    to the maze. Thus, the return type for this function is:
    [(string*int*int)]

    In case any argument is/are missing, or extra arguments are
    provided, it prints a usage message and exits with a [Failure
    "Wrong Input"] exception *)

let get_parameters (): (string * int * int) =  
  if Array.length Sys.argv <> 4 then failwith "Wrong Input" else 
  (Sys.argv.(1), int_of_string Sys.argv.(2), int_of_string Sys.argv.(3))

(** [run (fname, row, col)] uses the filename and the entry point
    [row], [col] pair obtained from [get_parameters] to call
    [mat_of_file] function in the [readmaze.ml] file to read the
    matrix from the provided file, and the [solvemaze] function with
    the appropriate parameters to find the exit point.

    If no exit point is found, it prints an appropriate one line
    message. If a solution is found, it prints an appropriate message
    with the row column pair for the exit point found. *)
let run (fname, row, col) = 
    let (_,_,maze) = mat_of_file fname  in
  Printf.printf "Maze provided is:\n";
  print_maze (maze);
  Printf.printf "Entry point provided: (%i, %i)\n" row col;
  match solvemaze maze (row,col) with
  | None -> Printf.printf "Maze has no solution for the given entry point\n"
  | Some (r,c) -> Printf.printf "Maze has at least one exit point \
                                 found at (%i, %i)\n" r c;;


