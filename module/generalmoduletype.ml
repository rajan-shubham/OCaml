module type StackSig = sig
  type 'a stack

  val empty : 'a stack

  val push : 'a -> 'a stack -> 'a stack

  val peek : 'a stack -> 'a

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

module MyStack : StackSig = struct
  type 'a stack = 
  |Empty
  |Entry of 'a * 'a stack

  let empty = Empty

  let push x s =
    Entry (x,s)
  
  let peek = function
  |Empty -> failwith "Empty"
  |Entry (x,_) -> x

  let pop = function
  |Empty -> failwith "Empty"
  |Entry (_,s) -> s
end




module ListQueueImpl = struct
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
  
module TwoListQueueImpl = struct
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

module type Queue = sig
  type 'a queue

  val empty : 'a queue

  val enqueue : 'a -> 'a queue -> 'a queue

  val peek : 'a queue -> 'a option

  val dequeue : 'a queue -> 'a queue option
end

module ListQueue : Queue = ListQueueImpl
module TwoListQueue : Queue = TwoListQueueImpl

let t1 = let open TwoListQueueImpl in empty;;
(* val t1 : 'a TwoListQueueImpl.queue =
  {TwoListQueueImpl.front = []; back = []} *)
let t2 = let open TwoListQueueImpl in enqueue 5 t1;;
(* val t2 : int TwoListQueueImpl.queue =
{TwoListQueueImpl.front = [5]; back = []} *)
let t3 = TwoListQueueImpl.enqueue 99 t2;;
(* val t3 : int TwoListQueueImpl.queue =
{TwoListQueueImpl.front = [5]; back = [99]} *)


let w = let open TwoListQueue in empty;;
(* val w : 'a TwoListQueue.queue = <abstr> *)
let x = let open TwoListQueue in enqueue 88 w;;
(* val x : int TwoListQueue.queue = <abstr> *)
let y = let open TwoListQueue in enqueue 77 x;;
(* val y : int TwoListQueue.queue = <abstr> *)
