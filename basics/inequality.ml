let x = "shubham";;
let y = "shubham";;
let isStructureEqual x y = if x = y then Printf.printf "Structurly Equal\n" else Printf.printf " NOT Structuraly Equal\n";;
isStructureEqual x y;;

let isPhysicalEqual x y = if x == y then Printf.printf "Physicaly Equal\n" else Printf.printf "NOT Physicaly Equal\n";;
isPhysicalEqual x y;;


let isInequalStructural x y = if x <> y then Printf.printf "Structural INEqual\n" else Printf.printf "Structuraly Equal\n";;
isInequalStructural x y;;

let isInequalPhysical x y = if x != y then Printf.printf "Physicaly INEqual\n" else Printf.printf "Physical Equal\n";;
isInequalPhysical x y;;