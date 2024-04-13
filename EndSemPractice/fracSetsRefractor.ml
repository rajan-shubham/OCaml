module type Fraction = sig
  (* A fraction is a rational number p/q, where q != 0.*)
  type t

  (* [make n d] is n/d. Requires d != 0. *)
  val make : int -> int -> t

  val numerator : t -> int
  val denominator : t -> int
  val to_string : t -> string
  val to_float : t -> float

  val add : t -> t -> t
  val mul : t -> t -> t
end

module PairFraction = struct
  type t = int * int
  let make n d =
    assert (d != 0);
    (n,d)
  let numerator (n,d) = n
  let denominator (n,d) = d
  let to_string (n,d) =
    string_of_int n ^ " / " ^ string_of_int d
  let to_float (n,d) =
    float_of_int n /. float_of_int d
  let add (n1,d1) (n2,d2) =
    let d' = d1 * d2 in
    (n1 * d2 + n2 * d1, d')
  let mul (n1,d1) (n2,d2) =
    (n1 * n2, d1 * d2)
end

(* let frac = PairFraction.make 7 22;;
val frac : int * int = (7, 22)
─( 23:09:59 )─< command 28 >───────────────────{ counter: 0 }─
utop # let fracOppo = PairFraction.make 22 7;;
val fracOppo : int * int = (22, 7)
─( 23:10:28 )─< command 29 >───────────────────{ counter: 0 }─
utop # PairFraction.mul fracOppo frac;;
- : int * int = (154, 154)
─( 23:10:48 )─< command 30 >───────────────────{ counter: 0 }─
utop # PairFraction.add fracOppo frac;;
- : int * int = (533, 154) *)

