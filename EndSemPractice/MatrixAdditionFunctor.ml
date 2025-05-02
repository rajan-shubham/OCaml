module type Matrix = sig
  type t
  val add : t -> t -> t
end;;
(* module type Matrix = sig type t val add : t -> t -> t end *)
module MatrixAdd (M : Matrix) = struct
let matrix_add a b=
let add_list l1 l2 = if List.length l1 <> List.length l2 then failwith " nerrror" else List.map2 (fun x y->M.add x y )l1 l2 in
let mat_add m1 m2 = if List.length m1<> List.length m2 then failwith "iuerih" else List.map2 (fun x y -> add_list x y) m1 m2 in
mat_add a b
end;;
(* module MatrixAdd :
  functor (M : Matrix) ->
    sig val matrix_add : M.t list list -> M.t list list -> M.t list list end *)
module IntMatrix : Matrix with type t = int = struct
  type t = int
  let add a b = a + b
end

module FloatMatrix : Matrix with type t = float = struct
  type t = float
  let add a b = a +. b
end

module StringMatrix : Matrix with type t = string = struct
  type t = string
  let add a b = a ^ b
end

module IntMatrixAdd = MatrixAdd(IntMatrix)
module FloatMatrixAdd = MatrixAdd(FloatMatrix)
module StringMatrixAdd = MatrixAdd(StringMatrix)
;;
(* module IntMatrix : sig type t = int val add : t -> t -> t end
module FloatMatrix : sig type t = float val add : t -> t -> t end
module StringMatrix : sig type t = string val add : t -> t -> t end
module IntMatrixAdd :
  sig val matrix_add : int list list -> int list list -> int list list end
module FloatMatrixAdd :
  sig
    val matrix_add : float list list -> float list list -> float list list
  end
module StringMatrixAdd :
  sig
    val matrix_add : string list list -> string list list -> string list list
  end *)
IntMatrixAdd.matrix_add [[1;2];[3;4]] [[5;6];[7;8]];;
(* - : int list list = [[6; 8]; [10; 12]] *)
