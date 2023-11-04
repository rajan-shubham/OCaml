module type Ring = sig
  type t
  val zero : t
  val one : t
  val ( + ) : t -> t -> t
  val ( * ) : t -> t -> t
  val ( ~- ) : t -> t  (* additive inverse *)
  val ( / ) : t -> t -> t
  val to_string : t -> string
end

module IntRingPrep = struct
  type t = int
  let zero = 0
  let one = 1
  let ( + ) = Stdlib.( + )
  let ( * ) = Stdlib.( * )
  let ( ~- ) = Stdlib.( ~- )
  let ( / ) = Stdlib.( / )
  let to_string = string_of_int
end

module IntRing : Ring = IntRingPrep
  
(*include allows us to to avoid having to duplicate code*)

(* utop # IntRing.zero;;
- : IntRing.t = <abstr>
utop # IntRingPrep.zero;;
- : int = 0
utop # IntRingPrep.(to_string zero);;
- : string = "0"
utop # IntRingPrep.(zero + one);;
- : int = 1
utop # IntRing.(zero + one |> to_string);;
- : string = "1" *)

module FloatRingPrep = struct
  type t = float
  let zero = 0.
  let one = 1.
  let ( + ) = Stdlib.( +. )
  let ( * ) = Stdlib.( *. )
  let ( ~- ) = Stdlib.( ~-. )
  let ( / ) = Stdlib.( /. )
  let to_string = string_of_float
end

module FloatRing : Ring = FloatRingPrep

(* FloatRingPrep.(zero + one |> to_string);;
- : string = "1." *)

module type Field = sig
  include Ring
  val ( / ) : t -> t -> t
end

module IntFieldRep = struct
  include IntRingPrep
  let ( / ) = Stdlib.( / )
end

module IntField : Field = IntFieldRep

module FloatFieldRep = struct
include FloatRingPrep
let ( / ) = Stdlib.( /. )
end
 module FloatField : Field = FloatFieldRep