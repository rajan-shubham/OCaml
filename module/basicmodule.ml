module MyModule = struct
  let inc x = x + 1
  type primary_color = Red | Green | Blue
  exception Oops
end

(*MyModule.inc 5;;
- : int = 6
let x:MyModule.primary_color = Red;;
val x : MyModule.primary_color = MyModule.Red
x;;
- : MyModule.primary_color = MyModule.Red
*)