module ListStack = struct
  (** [empty] is the empty stack. *)
  let empty = []

  (** [is_empty s] is whether [s] is empty. *)
  let is_empty = function [] -> true | _ -> false

  (** [push x s] pushes [x] onto the top of [s]. *)
  let push x s = x :: s

  (** [Empty] is raised when an operation cannot be applied
      to an empty stack. *)
  exception Empty

  (** [peek s] is the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let peek = function
    | [] -> raise Empty
    | x :: _ -> x

  (** [pop s] is all but the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let pop = function
    | [] -> raise Empty
    | _ :: s -> s
end
(*let s = [];;
val s : 'a list = []
ListStack.is_empty s;;
- : bool = true
let s1 = ListStack.push 1 s;;
val s1 : int list = [1]
let s2 = ListStack.push 2 s1;;
val s2 : int list = [2; 1]
let s3 = ListStack.push 3 s2;;
val s3 : int list = [3; 2; 1]
ListStack.is_empty s3;;
- : bool = false
let peek = ListStack.peek s3;;
val peek : int = 3
s3;;
- : int list = [3; 2; 1]
let pop = ListStack.pop s3;;
val pop : int list = [2; 1]
*)
(*ListStack.empty;;
- : 'a list = []
*)