module BatchedQueue = struct
  type 'a t = {outbox:'a list; inbox:'a list}

  let empty = {outbox=[]; inbox=[]}

  let is_empty = function
    | {outbox=[]; inbox=[]} -> true
    | _ -> false

  let norm = function
    | {outbox=[]; inbox} -> {outbox=List.rev inbox; inbox=[]}
    | q -> q

  let enqueue x q = norm {q with inbox=x::q.inbox}

  let peek = function
    | {outbox=[]; _} -> None
    | {outbox=x::_; _} -> Some x

  let dequeue = function
    | {outbox=[]; _} -> None
    | {outbox=_::xs; inbox} -> Some (norm {outbox=xs; inbox})
end

(*  *utop # let bq = BatchedQueue.empty;;
val bq : 'a BatchedQueue.t =
  {BatchedQueue.outbox = []; inbox = []}
utop # let bq = BatchedQueue.enqueue 1 bq;;
val bq : int BatchedQueue.t =
  {BatchedQueue.outbox = [1]; inbox = []}
utop # let bq = BatchedQueue.enqueue 2 bq;;
val bq : int BatchedQueue.t =
  {BatchedQueue.outbox = [1]; inbox = [2]}
utop # let bq = BatchedQueue.enqueue 3 bq;;
val bq : int BatchedQueue.t =
  {BatchedQueue.outbox = [1]; inbox = [3; 2]}
utop # let bq = BatchedQueue.enqueue 4 bq;;
val bq : int BatchedQueue.t =
  {BatchedQueue.outbox = [1]; inbox = [4; 3; 2]} *) 

(* utop # BatchedQueue.dequeue tlq;;
- : int BatchedQueue.t option =
Some {BatchedQueue.outbox = [101; 102; 103]; inbox = []}
utop # let tlq = BatchedQueue.enqueue 104 tlq;;
val tlq : int BatchedQueue.t =
  {BatchedQueue.outbox = [100]; inbox = [104; 103; 102; 101]}
utop # BatchedQueue.peek tlq;;
- : int option = Some 100
utop # let tlq = BatchedQueue.enqueue 105 tlq;;
val tlq : int BatchedQueue.t =
  {BatchedQueue.outbox = [100];
   inbox = [105; 104; 103; 102; 101]} *)

   let fill_BatchedQueue n =
    let rec loop n q =
      if n=0
      then q
      else loop (n-1) (BatchedQueue.enqueue n q)
    in
    loop n BatchedQueue.empty
(* fill_BatchedQueue 5;;
- : int BatchedQueue.t =
{BatchedQueue.outbox = [5]; inbox = [1; 2; 3; 4]} *)