(** This file [readmaze.ml] provides the [Readmaze] module contained
    in the [Mazesolver] module *)


(* NOTE: You have to complete the functions below with your own
   code. Parts you need to replace are the regions indicated with

   () (* TODO *)

   Replace those lines with your own code *)



(** [mat_of_file fname] reads the text file [fname] and reads the
    matrix of 0s and 1s from the file and returns a 3-tuple containing
    the rows, columns, and the matrix itself as a 2D Array.

    The text file stores the matrix in the format stated below (and it
    is assumed that the provided file strictly follows the format
    mentioned below, and hence, no error checking is done regarding
    the format of the file):

[<num of rows>
<num of cols>
<row 1 of 0s and 1s (without any space in between)>
<row 2 ...>
...
<last row>] *)
(* let mat_of_file (fname:string): (int * int * int array array) =
  () (* TODO *) *)

let mat_of_file (fname:string): (int * int * int array array) =
    let read_file filename =
    let input_channel = open_in filename in
    let rec read_lines lines =
        try
            let line = input_line input_channel in
            read_lines (line :: lines)
        with End_of_file ->
            close_in input_channel;
            List.rev lines
        in read_lines []
    in
    let lines = read_file fname in 
    let first = String.split_on_char ' ' (List.hd lines) in
    let second = String.split_on_char ' ' (List.hd (List.tl lines)) in
    let (p,q) = (int_of_string (List.hd first), int_of_string ( List.hd (second))) in
    let make_array arrlst = Array.map Array.of_list (Array.of_list arrlst) in
    let rec helper acc = function
        | [] -> acc
        | h::t -> let str = List.of_seq (String.to_seq h) in 
            let str2 = List.filter (fun x -> x <> ' ') str in
            let line = List.map (fun x ->(int_of_char x)- (int_of_char '0') ) str2 in
            helper (line::acc) t
    in
    (p,q,(helper [] (List.tl (List.tl lines)) |> List.rev |>  make_array)) 



(** [print_maze maze] prints the maze which is a 2D matrix of 1s and
    0s to the terminal one row per line *)
let print_maze (maze:int array array): unit =
  Array.iter
    (fun row ->
       (Array.iter
         (fun i -> print_int i; print_char ' ')
         row);
       print_char '\n')
    maze;;


