type ptype = TNormal | TFire | TWater
type peff = ENormal | ENotVery | ESuper

let mult_of_eff = function
|ENormal -> 1.
|ENotVery -> 0.5
|ESuper -> 2.0

let eff = function
|(TFire,TFire) -> ENotVery
|(TWater,TWater) -> ENotVery
|(TFire,TWater) -> ENotVery
|(TWater,TFire) -> ESuper
|_ -> ENormal

let eff' = function
|(TFire,TFire) |(TWater,TWater) |(TFire,TWater) -> ENotVery
|(TWater,TFire) -> ESuper
|_ -> ENormal

let eff'' t1 t2 = match t1 , t2 with 
|TFire,TFire |TWater,TWater |TFire,TWater -> ENotVery
|TWater,TFire -> ESuper
|_ -> ENormal

type mon = {
  name : string;
  hp : int;
  ptype : ptype;
}

let charmander = {
  name = "Charmander";
  hp = 39;
  ptype = TFire
}

(*{name = "Charmander"; hp = 39; ptype = TFire}
;;
- : mon = {name = "Charmander"; hp = 39; ptype = TFire}
charmander.hp;;
- : int = 39
charmander.ptype ,charmander.name;;
- : ptype * string = (TFire, "Charmander")
match charmander with {name = n; hp = h; ptype = t} -> h;;
- : int = 39
match charmander with {name;hp;ptype} -> hp;;
- : int = 39
   *)
(* Pokemon types *)
type ptype = TNormal | TFire | TWater

(* A record to represent Pokemon *)
type mon = { name : string; hp : int; ptype : ptype }

(* OK *)
let get_hp m = match m with { name = n; hp = h; ptype = t } -> h

(* better *)
let get_hp m = match m with { name = _; hp = h; ptype = _ } -> h

(* better *)
let get_hp m = match m with { name; hp; ptype } -> hp

(* better *)
let get_hp m = match m with { hp } -> hp

(* best *)
let get_hp m = m.hp
(*get_hp c;;
- : int = 39
let get_ptype m = m.ptype;;
val get_ptype : mon -> ptype = <fun>
get_ptype c;;
- : ptype = TFire

   *)