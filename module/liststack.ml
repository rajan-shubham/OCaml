module ListStack = struct
let empty = []
let is_empty = function [] -> true | _ -> false
let push x s = x :: s
exception Empty 
let peek = function
|[] -> raise Empty
|x :: _-> x
let pop = function
|[] -> raise Empty
| _::s -> s
end