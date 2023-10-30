module type StackSig = sig
  (* ['a stack ] is the representation type for stacks *)
  type 'a stack

  (* [empty] is the empty stack *)
  val empty : 'a stack

  (* [push  x s] is [s] with [x] pushed on top *)
  val push : 'a -> 'a stack -> 'a stack

  (* [peek s] is the top element of [s].
     Raises failure if [s] is empty. *)
  val peek : 'a stack -> 'a

  (* [pop s] is all but the top element of [s].
     raises [failure] if [s] is empty. *)
  val pop : 'a stack -> 'a stack
end

module ListStack : StackSig = struct
  type 'a stack = 'a list

  let empty = []

  let push x s =
    x :: s
  
  let peek = function
  |[] -> failwith "Empty"
  |x :: _ -> x

  let pop = function
  |[] -> failwith "Empty"
  |_ :: s -> s
end

let s1 : int ListStack.stack = ListStack.(empty |> push 42)