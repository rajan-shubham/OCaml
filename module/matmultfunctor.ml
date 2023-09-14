module type XSig = sig
    type t
    val add:t list list -> t list list -> t list list
end
module AddX (X:XSig) = struct
    let add = X.add
end
module XInt = struct
    type t = int
    let add = List.map2(List.map2(+))
end
module XFloat = struct
    type t = float
    let add = List.map2(List.map2(+.))
end
module XString = struct
    type t = string
    let add = List.map2(List.map2(^))
end

module AddInt = AddX(XInt)
module AddString = AddX(XString)
module AddFloat = AddX(XFloat);;