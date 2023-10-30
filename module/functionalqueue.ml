module ListQueue = struct
type 'a queue = 'a list
let empty = []
let is_empty = function
|[] -> true
|_ -> false
let enqueue x q = q @ [x]
let peek = function
|[] -> None
|x :: _ -> Some x
let dequeue = function
|[] -> None
|_ :: q -> Some q
end

module TwoListQueue = struct
    (* [{front = [a;b]; back = [e;d;c]}]
       represents the queue a,b,c,d,e
       If [front] is empty then [back] must also be empty,
       to guarantee that the first element of the queue 
       is always the head of [front].
       *)
    type 'a queue = {
      front : 'a list;
      back : 'a list;
    }
    let empty = {
        front = [];
        back = [];
    }
    let peek = function
    | {front = []} -> None
    | {front = x :: _} -> Some x
    let enqueue x = function
    |{front = []} -> {front = [x]; back = []}
    |q -> {q with back = x :: q.back} (*constant time !!!*)
    let dequeue = function
    | {front = []} -> None
    | {front = _::[];back} -> Some {front = List.rev back; back = []}
    | {front = _::t; back} -> Some {front = t; back}
    (* constant time except when front gets exhausteed *)
end