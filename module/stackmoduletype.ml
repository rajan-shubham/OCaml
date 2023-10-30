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

module (* Private Class *)ListStackImpl = struct
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

module (* Public Class *)ListStack : StackSig = ListStackImpl

let s1 : int ListStack.stack = ListStack.(empty |> push 42)
let s2 : int ListStackImpl.stack = [42]
let s3 : int ListStackImpl.stack = 99 :: s2;;
(* val s3 : int list = [99; 42] *)