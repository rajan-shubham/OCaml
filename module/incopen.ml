module M = struct
  let x = 0
end

module N = struct
  include M (* include M actually including all of the definations from module M to inside of module N *)
  let y = x + 1
end

module O = struct
  open M (* open M means not include but open it into scope we make it's names available for use internally , we don't export them again |> so even though we can use the x from M to define y inside of O *)
  let y = x + 1
end