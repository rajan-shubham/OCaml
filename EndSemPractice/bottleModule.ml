module type Bottle = sig
  type t
  (* val empty : t *)
  val lengthOfBottle: int -> t
  val bottleSize: t -> int
  val bottleVolume: t -> int
end

module Sprite:Bottle = struct
  type t = int
  (* let empty = 0 *)  
  let lengthOfBottle (x:int):t = x 
  let bottleSize length = length 
  let bottleVolume length = length * length * length
end

(* module type Bottle = sig
  type t
  val bottleSize: t -> int
  val bottleVolume: t -> int
end

module Sprite:Bottle = struct
  type t = int
  let bottleSize length = length 
  let bottleVolume length = length * length * length
end;;
module type Bottle =
  sig
    type t
    val bottleSize : t -> int
    val bottleVolume : t -> int
  end
module Sprite : Bottle
utop # let pep = Sprite.t;;
Error: Unbound value Sprite.t
utop # let pep:Sprite.t = 25;;
Error: This expression has type int
       but an expression was expected of type Sprite.t
utop # module type Bottle = sig
  type t
  val empty : t
  val bottleSize: t -> int
  val bottleVolume: t -> int
end

module Sprite:Bottle = struct
  type t = int
  let empty = 0
  let bottleSize length = length 
  let bottleVolume length = length * length * length
end;;
module type Bottle =
  sig
    type t
    val empty : t
    val bottleSize : t -> int
    val bottleVolume : t -> int
  end
module Sprite : Bottle
utop # let pep:Sprite.t = Sprite.empty;;
val pep : Sprite.t = <abstr>
utop # let pepsi = Sprite.empty;;
val pepsi : Sprite.t = <abstr>
utop # let pepsiSize = Sprite.bottleSize 1;;
Error: This expression has type int
       but an expression was expected of type Sprite.t
utop # let pepsiSize = Sprite.bottleSize pepsi;;
val pepsiSize : int = 0
utop # module type Bottle = sig
  type t
  val empty : t
  val lengthOfBottle: t -> t
  val bottleSize: t -> int
  val bottleVolume: t -> int
end

module Sprite:Bottle = struct
  type t = int
  let empty = 0
    
  let lengthOfBottle (x:t) = empty + x 
  let bottleSize length = length 
  let bottleVolume length = length * length * length
end;;
module type Bottle =
  sig
    type t
    val empty : t
    val lengthOfBottle : t -> t
    val bottleSize : t -> int
    val bottleVolume : t -> int
  end
module Sprite : Bottle
utop # let pepsi = Sprite.empty;;
val pepsi : Sprite.t = <abstr>
utop # let coke = Sprite.lengthOfBottle empty;;
Error: Unbound value empty
utop # let coke = Sprite.lengthOfBottle 0;;
Error: This expression has type int
       but an expression was expected of type Sprite.t
utop # let pepsiBotLen = Sprite.lengthOfBottle pepsi;;
val pepsiBotLen : Sprite.t = <abstr>
utop # let pepsiBotVol = Sprite.bottleVolume pepsiBotLen;;
val pepsiBotVol : int = 0
utop # module type Bottle = sig
  type t
  (* val empty : t *)
  val lengthOfBottle: int -> t
  val bottleSize: t -> int
  val bottleVolume: t -> int
end

module Sprite:Bottle = struct
  type t = int
  (* let empty = 0 *)  
  let lengthOfBottle (x:int):t = x 
  let bottleSize length = length 
  let bottleVolume length = length * length * length
end;;
module type Bottle =
  sig
    type t
    val lengthOfBottle : int -> t
    val bottleSize : t -> int
    val bottleVolume : t -> int
  end
module Sprite : Bottle
utop # let mazaLen = Sprite.lengthOfBottle 25;;
val mazaLen : Sprite.t = <abstr>
utop # let mazaSize = Sprite.bottleSize mazaLen;;
val mazaSize : int = 25
utop # let mazaVol = Sprite.bottleVolume mazaLen;;
val mazaVol : int = 15625 *)