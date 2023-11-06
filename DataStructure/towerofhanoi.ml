let rec hanoi n source auxiliary target =
  if n > 0 then (
    hanoi (n - 1) source target auxiliary;
    Printf.printf "Move disk %d from Tower %s to Tower %s\n" n source target;
    hanoi (n - 1) auxiliary source target
  )

let towers_of_hanoi n =
  hanoi n "A" "C" "B";;

towers_of_hanoi 3;;
(* towers_of_hanoi 3;;
Move disk 1 from Tower A to Tower B
Move disk 2 from Tower A to Tower C
Move disk 1 from Tower B to Tower C
Move disk 3 from Tower A to Tower B
Move disk 1 from Tower C to Tower A
Move disk 2 from Tower C to Tower B
Move disk 1 from Tower A to Tower B
- : unit = () *)


let rec count_hanoi_moves n source auxiliary target =
  if n = 1 then 1
  else (
    let move_top_disk = count_hanoi_moves (n - 1) source target auxiliary in
    let move_bottom_disk = 1 in
    let move_rest = count_hanoi_moves (n - 1) auxiliary source target in
    move_top_disk + move_bottom_disk + move_rest
  )

let number_of_moves n =
  count_hanoi_moves n "A" "C" "B";;

Printf.printf "Number of moves: %d\n" (number_of_moves 3)
(* Number of moves: 7
- : unit = () *)


let memoized_hanoi_moves n =
  let memo = Array.make (n + 1) 0 in
  let rec count_moves n source auxiliary target =
    if n = 1 then 1
    else if memo.(n) <> 0 then memo.(n)
    else (
      let move_top_disk = count_moves (n - 1) source target auxiliary in
      let move_bottom_disk = 1 in
      let move_rest = count_moves (n - 1) auxiliary source target in
      let total_moves = move_top_disk + move_bottom_disk + move_rest in
      memo.(n) <- total_moves;
      total_moves
    )
  in
  count_moves n "A" "C" "B";;

Printf.printf "Number of moves: %d\n" (memoized_hanoi_moves 3)
(* Number of moves: 7
- : unit = () *)
