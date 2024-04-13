module type Xtype = sig
  val x : int
end

module AValue : Xtype = struct
  let x = 0
end

(* module IncX = functor (M : Xtype) -> struct
  let x = M.x + 1
end *)

module IncX (M : Xtype) = struct
  let x = M.x + 1
end

module BIncValue = IncX(AValue);;
Printf.printf "%d \n" BIncValue.x;;

module CIncValue = IncX(BIncValue);;
Printf.printf "%d \n" CIncValue.x;;